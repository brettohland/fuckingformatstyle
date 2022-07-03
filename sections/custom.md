---
sitemap_ignore: true
---
As a protocol, `FormatStyle` is quite simple to conform to:

```
/// A type that can convert a given data type into a representation
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

Here's an example of a custom type (an [ISBN](https://en.wikipedia.org/wiki/ISBN)) that supports `FormatStyle`, `ParseableFormatStyle`, and can output `AttributedString` values.

[Read the blog post for more details](https://ampersandsoftworks.com/posts/formatstyle-parseableformatstyle-and-your-custom-types/)

[Download the Xcode Playground](https://github.com/brettohland/ISBN-FormatStyle/) or [See everything as a Gist](https://gist.github.com/brettohland/744fcbd2a8aa77907ec84a286e8da3b0)

### Defining Our ISBN

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "2.ISBN.swift" >}}

#### Creating Our FormatStyle

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "3.ISBN+FormatStyle.swift" >}}

#### Adding AttributedString Output

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "4.ISBN+AttributedStringFormatStyle.swift" >}}

#### Conforming to ParseableFormatStyle

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "5.ISBN+ParseableFormatStyle.swift" >}}