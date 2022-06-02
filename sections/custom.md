---
---
As a protocol, `FormatStyle` is quite simple to conform to:

```
/// A type that can convert a given data type into a representation.
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
public protocol FormatStyle : Decodable, Encodable, Hashable {

    /// The type of data to format.
    associatedtype FormatInput

    /// The type of the formatted data.
    associatedtype FormatOutput

    /// Creates a `FormatOutput` instance from `value`.
    func format(_ value: Self.FormatInput) -> Self.FormatOutput

    /// If the format allows selecting a locale, returns a copy of this format with the new locale set. Default implementation returns an unmodified self.
    func locale(_ locale: Locale) -> Self
}
```

Essentially, this provides you with the ability to convert any data type into any other data type or representation.

An example of a custom Format Style that features locale, attributed string output, as well as a `FormatStyle` extension.

```
struct ToYen: FormatStyle {
    typealias FormatInput = Int
    typealias FormatOutput = String

    static let multiplier = 100
    static let yenCurrencyCode = "jpy"

    let formatter: IntegerFormatStyle<Int>.Currency

    var attributed: ToYen.AttributedStyle = AttributedStyle()

    init(locale: Locale? = nil) {
        formatter = IntegerFormatStyle<Int>.Currency(code: Self.yenCurrencyCode, locale: locale ?? Locale.current)
    }

    func format(_ value: Int) -> String {
        (value * Self.multiplier).formatted(formatter)
    }

    // This is optional.
    func locale(_ locale: Locale) -> ToYen {
        .init(locale: locale)
    }
}

// MARK: Add Attributed Style support

extension ToYen {
    struct AttributedStyle: FormatStyle {
        typealias FormatInput = Int
        typealias FormatOutput = AttributedString

        func format(_ value: Int) -> AttributedString {
            (value * ToYen.multiplier).formatted(ToYen().formatter.attributed)
        }
    }
}

// MARK: Extend `FormatStyle` to simplify access

extension FormatStyle where Self == ToYen {
    static var toYen: ToYen { .init() }
}

// MARK: - Usage Examples

30.formatted(ToYen()) // "¥3,000"
30.formatted(.toYen) // "¥3,000")

30.formatted(.toYen.locale(Locale(identifier: "zh_CN"))) // "JP¥3,000"

30.formatted(.toYen.attributed)
```

