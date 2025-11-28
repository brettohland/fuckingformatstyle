---
sitemap_ignore: true
---

The easiest and best way to access this style is through the `.number` extension on `FormatStyle`. From there, you can use method chaining to customize the output.

```swift
Float(10).formatted(.number.scale(200.0).notation(.compactName).grouping(.automatic)) // "2K"
```

You can also initialize an instance of `IntegerFormatStyle<Value: BinaryInteger>`, `FloatingPointFormatStyle<BinaryFloatingPoint>` or `Decimal.FormatStyle` and use method chaining to customize the output.
  
``` swift
FloatingPointFormatStyle<Double>().rounded(rule: .up, increment: 1).format(10.9) // "11"
IntegerFormatStyle<Int>().notation(.compactName).format(1_000) // "1K"
Decimal.FormatStyle().scale(10).format(1) // "10"
```

### Available Properties

| Property                                                     | Description                                                   |
|--------------------------------------------------------------|---------------------------------------------------------------|
| [Rounding](#numbers-rounding)                                | Customize the rounding behaviour                              |
| [Sign](#numbers-sign)                                        | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](#numbers-decimal-separator)              | Do you want to show or hide the decimal separator             |
| [Grouping](#numbers-grouping)                                | How do you want the thousands numbers to be grouped           |
| [Precision](#numbers-prescision)                             | How many fractional or significant digits do you want to show |
| [Notation](#numbers-notation)                                | Enable scientific or compact notation                         |
| [Scale](#numbers-scale)                                      | Scale the number up or down before display                    |
| [Locale](#numbers-locale)                                    | Set the `Locale` for one output                               |
| [Compositing](#numbers-compositing)                          | Mix and match any and all of the above                        |
| [AttributedString output](#numbers-attributed-string-output) | Output an `AttributedString`                                  |

<h3 id="numbers-rounding">Rounding</h3>

At its simplest, you can call the `.formatted(.number.rounded())` method on any number type (Float, Double, Decimal, or Integer) in order to get the system's default rounding behaviour.

``` swift
Double(1.9999999).formatted(.number.rounded())  // "2"
Decimal(1.9999999).formatted(.number.rounded()) // "2"
Float(1.9999999).formatted(.number.rounded())   // "2"
Int(1.9999999).formatted(.number.rounded())     // "1"
```

Using the full instance method, you can access more granular settings: `.number.rounded(rule:increment:)`.

| Rounding Rule              | Description                                                                                        |
|----------------------------|----------------------------------------------------------------------------------------------------|
| `.awayFromZero`            | Round to the closest allowed value whose magnitude is greater than or equal to that of the source. |
| `.down`                    | Round to the closest allowed value that is less than or equal to the source.                       |
| `.toNearestOrAwayFromZero` | Round to the closest allowed value; if two values are equally close, the one with greater          |
| `.toNearestOrEven`         | Round to the closest allowed value; if two values are equally close, the even one is chosen.       |
| `.towardZero`              | Round to the closest allowed value whose magnitude is less than or equal to that of the source.    |
| `.up`                      | Round to the closest allowed value that is greater than or equal to the source.                    |

The `increment:` parameter is a `Double` and tells the system under the hood what to round the value by.

``` swift
Float(0.26575467567788).formatted(.number.rounded(rule: .awayFromZero))              // "0.265755"
Float(0.00900999876871).formatted(.number.rounded(rule: .awayFromZero))              // "0.00901"

Float(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 1))            // "6"
Float(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 10))           // "10"
Float(0.01).formatted(.number.rounded(rule: .down))                                  // "0.009999"
Float(0.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero))               // "0.01"
Float(0.01).formatted(.number.rounded(rule: .towardZero))                            // "0.009999"
Float(0.01).formatted(.number.rounded(rule: .up))                                    // "0.01"
Float(5.01).formatted(.number.rounded(rule: .down, increment: 1))                    // "5"
Float(5.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "5"
Float(5.01).formatted(.number.rounded(rule: .towardZero, increment: 1))              // "5"
Float(5.01).formatted(.number.rounded(rule: .up, increment: 1))                      // "5"

Double(0.26575467567788).formatted(.number.rounded(rule: .awayFromZero))              // "0.265755"
Double(0.00900999876871).formatted(.number.rounded(rule: .awayFromZero))              // "0.00901"
Double(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 1))            // "6"
Double(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 10))           // "10"
Double(0.01).formatted(.number.rounded(rule: .down))                                  // "0.01"
Double(0.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero))               // "0.01"
Double(0.01).formatted(.number.rounded(rule: .towardZero))                            // "0.01"
Double(0.01).formatted(.number.rounded(rule: .up))                                    // "0.01"
Double(5.01).formatted(.number.rounded(rule: .down, increment: 1))                    // "5"
Double(5.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "5"
Double(5.01).formatted(.number.rounded(rule: .towardZero, increment: 1))              // "5"
Double(5.01).formatted(.number.rounded(rule: .up, increment: 1))                      // "5"

Decimal(0.26575467567788).formatted(.number.rounded(rule: .awayFromZero))              // "0.265755"
Decimal(0.00900999876871).formatted(.number.rounded(rule: .awayFromZero))              // "0.00901"
Decimal(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 1))            // "6"
Decimal(5.01).formatted(.number.rounded(rule: .awayFromZero, increment: 10))           // "10"
Decimal(0.01).formatted(.number.rounded(rule: .down))                                  // "0.01"
Decimal(0.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero))               // "0.01"
Decimal(0.01).formatted(.number.rounded(rule: .towardZero))                            // "0.01"
Decimal(0.01).formatted(.number.rounded(rule: .up))                                    // "0.01"
Decimal(5.01).formatted(.number.rounded(rule: .down, increment: 1))                    // "5"
Decimal(5.01).formatted(.number.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "5"
Decimal(5.01).formatted(.number.rounded(rule: .towardZero, increment: 1))              // "5"
Decimal(5.01).formatted(.number.rounded(rule: .up, increment: 1))                      // "5"
```

<h3 id="numbers-sign">Sign</h3>

Controls the visibility of the negative and positive sign.

| Sign Display Strategy     | Description                                                                           |
|---------------------------|---------------------------------------------------------------------------------------|
| `.automatic`              | Displays the negative sign (-) when the number is negative. Positive sign isn't shown |
| `.never`                  | Never shows the positive (+) or negative (-) signs                                    |
| `.always(includingZero:)` | Passing in `true` will show the positive sign on a 0 value                            |

``` swift
Float(1.90).formatted(.number.sign(strategy: .never))                     // "1.9"
Float(-1.90).formatted(.number.sign(strategy: .never))                    // "1.9"
Float(1.90).formatted(.number.sign(strategy: .automatic))                 // "1.9"
Float(1.90).formatted(.number.sign(strategy: .always()))                  // "+1.9"
Float(0).formatted(.number.sign(strategy: .always(includingZero: true)))  // "+0"
Float(0).formatted(.number.sign(strategy: .always(includingZero: false))) // "0"
```

<h3 id="numbers-decimal-separator">Decimal Separator</h3>

Controls the visibility of the decimal separator.

| Decimal Separator Display Strategy | Descriotion                                           |
|------------------------------------|-------------------------------------------------------|
| `.automatic`                       | Only shows the decimal separator on fractional values |
| `.always`                          | Always shows the decimal separator                    |

``` swift
Float(10).formatted(.number.decimalSeparator(strategy: .automatic)) // "10"
Float(10).formatted(.number.decimalSeparator(strategy: .always))    // "10."
```

<h3 id="numbers-grouping">Grouping</h3>

Controls if the thousands units are grouped or not.

| Grouping     | Descriotion                                        |
|--------------|----------------------------------------------------|
| `.never`     | Never group thousands digits                       |
| `.automatic` | Group the digits automatically based on the locale |

``` swift
Float(1000).formatted(.number.grouping(.automatic)) // "1,000"
Float(1000).formatted(.number.grouping(.never))     // "1000"
```

<h3 id="numbers-precision">Precision</h3>

There are seven options to set the precision of the output.

| Precision Option                               | Description                                                    |
|------------------------------------------------|----------------------------------------------------------------|
| `.significantDigits(Int)`                      | Sets a fixed number of significant digits to show              |
| `.significantDigits(Range)`                    | Sets a range of significant digits to show                     |
| `.fractionLength(Int)`                         | Sets the number digits after the decimal separator             |
| `.fractionLength(Range)`                       | Sets a range of digits to show after the decimal separator     |
| `.integerLength(Int)`                          | Sets the number of digits to show before the decimal separator |
| `.integerLength(Range)`                        | Sets a range of digits to show before the decimal separator    |
| `.integerAndFractionLength(integer:fraction:)` | Sets both the integer and fractional digits to display         |
|                                                |                                                                |

``` swift
Decimal(10.1).formatted(.number.precision(.significantDigits(1))) // "10"
Decimal(10.1).formatted(.number.precision(.significantDigits(2))) // "10"
Decimal(10.1).formatted(.number.precision(.significantDigits(3))) // "10.1"
Decimal(10.1).formatted(.number.precision(.significantDigits(4))) // "10.10"
Decimal(10.1).formatted(.number.precision(.significantDigits(5))) // "10.100"
Decimal(1000000.1).formatted(.number.precision(.significantDigits(5))) // "10.100"

Decimal(1).formatted(.number.precision(.significantDigits(1 ... 3)))     // "1"
Decimal(10).formatted(.number.precision(.significantDigits(1 ... 3)))    // "10"
Decimal(10.1).formatted(.number.precision(.significantDigits(1 ... 3)))  // "10.1"
Decimal(10.01).formatted(.number.precision(.significantDigits(1 ... 3))) // "10"

Decimal(10.01).formatted(.number.precision(.fractionLength(1))) // 10.0
Decimal(10.01).formatted(.number.precision(.fractionLength(2))) // 10.01
Decimal(10.01).formatted(.number.precision(.fractionLength(3))) // 10.010

Decimal(10).formatted(.number.precision(.fractionLength(0...2)))        // 10
Decimal(10.1).formatted(.number.precision(.fractionLength(0...2)))      // 10.1
Decimal(10.11).formatted(.number.precision(.fractionLength(0...2)))     // 10.11
Decimal(10.111).formatted(.number.precision(.fractionLength(0...2)))    // 10.11

Decimal(10.111).formatted(.number.precision(.integerLength(1))) // 0.111
Decimal(10.111).formatted(.number.precision(.integerLength(2))) // 10.111

Decimal(10.111).formatted(.number.precision(.integerLength(0...1))) // .111
Decimal(10.111).formatted(.number.precision(.integerLength(0...2))) // 10.111
Decimal(10.111).formatted(.number.precision(.integerLength(0...3))) // 10.111

Decimal(10.111).formatted(.number.precision(.integerAndFractionLength(integer: 1, fraction: 1))) // 0.1
Decimal(10.111).formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 1))) // 10.1
Decimal(10.111).formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 2))) // 10.11
Decimal(10.111).formatted(.number.precision(.integerAndFractionLength(integer: 2, fraction: 3))) // 10.111
```

<h3 id="numbers-notation">Notation</h3>

Controls the ability to use different notation styles.

| Notation Setting | Description                                                                                                 |
|------------------|-------------------------------------------------------------------------------------------------------------|
| `.automatic`     | Used primarily when compositing other styles, will choose the best notation setting for the given settings. |
| `.compactName`   | Uses the compact notation for the thousands styles                                                          |
| `.scientific`    | Uses scientific notation                                                                                    |

``` swift
Float(1_000).formatted(.number.notation(.automatic))   // "1,000"
Float(1_000).formatted(.number.notation(.compactName)) // "1K"
Float(1_000).formatted(.number.notation(.scientific))  // "1E3"
```

<h3 id="numbers-scale">Scale</h3>

Controls the scale of the number.

``` swift
Float(10).formatted(.number.scale(1.0))  // "10"
Float(10).formatted(.number.scale(1.5))  // "15"
Float(10).formatted(.number.scale(2.0))  // "20"
Float(10).formatted(.number.scale(-2.0)) // "-20"
```

<h3 id="numbers-locale">Setting the Locale</h3>

Controls the locale of the output.

``` swift
Float(1_000).formatted(.number.notation(.automatic).locale(Locale(identifier: "fr_FR")))   // "1 000"
Float(1_000).formatted(.number.notation(.compactName).locale(Locale(identifier: "fr_FR"))) // "1 k"
Float(1_000).formatted(.number.notation(.scientific).locale(Locale(identifier: "fr_FR")))  // "1E3"

Float(1000).formatted(.number.grouping(.automatic).locale(Locale(identifier: "fr_FR"))) // "1 000"
Float(1000).formatted(.number.grouping(.never).locale(Locale(identifier: "fr_FR")))     // "1000"
```

### Localizing Number Systems

In cases where a given `Locale` has multiple number systems available, numeric format styles will default to using the number system which matches the your system's `Locale.current` value. You're able to explicitly set the number system for the Format Style to use by initializing a new `Locale` with the number system set using the BCP-47 or ICU Identifiers:

#### [BCP-47](https://www.rfc-editor.org/info/bcp47)

``` swift
let englishArabicBCP47 = "en-u-nu-arab"
let enArabBCP47 = Locale(identifier: englishArabicBCP47)
123456.formatted(.number.locale(enArabBCP47)) // "١٢٣٬٤٥٦"
Date.now.formatted(.dateTime.year().month().day().locale(enArabBCP47)) // "Sep ٢٣, ٢٠٢٣"
```

#### ICU

``` swift
let englishArabicICU = "en@numbers=arab"
let enArabICU = Locale(identifier: "en@numbers=arab")
12345.formatted(.number.locale(enArabICU)) // "١٢٬٣٤٥"
Date.now.formatted(.dateTime.year().month().day().locale(enArabICU)) // "Sep ٢٣, ٢٠٢٣"
```

<h3 id="numbers-compositing">Compositing</h3>

Any of the above styles can be combined to fully customize the output.

``` swift
Float(10).formatted(.number.scale(200.0).notation(.compactName).grouping(.automatic)) // "2K"
```

<h3 id="numbers-attributed-string-output">Attributed String Output</h3>

Outputs and `AttributedString` instead of a `String`.

``` swift
Float(10).formatted(.number.scale(200.0).notation(.compactName).grouping(.automatic).attributed)
```

### Parsing Numbers From Strings

Each of Swift's build-in numeric types supports the parsing of numeric string into their respective types.

``` swift
// MARK: Parsing Integers
try? Int("120", format: .number) // 120
try? Int("0.25", format: .number) // 0
try? Int("1E5", format: .number.notation(.scientific)) // 100000

// MARK: Parsing Floating Point Numbers
try? Double("0.0025", format: .number) // 0.0025
try? Double("95%", format: .number) // 95
try? Double("1E5", format: .number.notation(.scientific)) // 100000

try? Float("0.0025", format: .number) // 0.0025
try? Float("95%", format: .number) // 95
try? Float("1E5", format: .number.notation(.scientific)) // 100000

// MARK: - Parsing Decimals
try? Decimal("0.0025", format: .number) // 0.0025
try? Decimal("95%", format: .number) // 95
try? Decimal("1E5", format: .number.notation(.scientific)) // 100000
```