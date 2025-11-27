---
sitemap_ignore: true
---

The easiest and best way to access this style is through the `.percent` extension on `FormatStyle`. From there, you can use method chaining to customize the output.

``` swift
0.1.formatted(.percent) // "10%"
```

You can also initialize an instance of `IntegerFormatStyle<Value: BinaryInteger>.Percent`, `FloatingPointFormatStyle<BinaryFloatingPoint>.Percent` or `Decimal.FormatStyle.Percent` and use method chaining to customize the output.
  
```
FloatingPointFormatStyle<Double>.Percent().rounded(rule: .up, increment: 1).format(0.109) // "11%"
IntegerFormatStyle<Int>.Percent().notation(.compactName).format(1_000) // "1K%"
Decimal.FormatStyle.Percent().scale(12).format(0.1) // "1.2%"
```

### Available Properties

| Property                                                     | Description                                                   |
|--------------------------------------------------------------|---------------------------------------------------------------|
| [Rounding](#percent-rounding)                                | Customize the rounding behaviour                              |
| [Sign](#percent-sign)                                        | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](#percent-decimal-separator)              | Do you want to show or hide the decimal separator             |
| [Grouping](#percent-grouping)                                | How do you want the thousands numbers to be grouped           |
| [Precision](#percent-prescision)                             | How many fractional or significant digits do you want to show |
| [Notation](#percent-notation)                                | Enable scientific or compact notation                         |
| [Scale](#percent-scale)                                      | Scale the number up or down before display                    |
| [Locale](#percent-locale)                                    | Set the `Locale` for one output                               |
| [Compositing](#percent-compositing)                          | Mix and match any and all of the above                        |
| [AttributedString output](#percent-attributed-string-output) | Output an `AttributedString`                                  |

<h3 id="percent-ounding">Rounding</h3>

At its simplest, you can call the `.formatted(.number.rounded())` method on any number type (Float, Double, Decimal, or Integer) in order to get the system's default rounding behaviour.

``` swift
Double(1.9999999).formatted(.percent.rounded())  // "199.99999%"
Decimal(1.9999999).formatted(.percent.rounded()) // "199.99999%"
Float(1.9999999).formatted(.percent.rounded())   // "199.999998%"
Int(1.9999999).formatted(.percent.rounded())     // 1%
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
Float(0.26575467567788).formatted(.percent.rounded(rule: .awayFromZero))              // "26.575467%"
Float(0.00900999876871).formatted(.percent.rounded(rule: .awayFromZero))              // "0.901%"
Float(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 1))            // "502%"
Float(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 10))           // "510%"
Float(0.01).formatted(.percent.rounded(rule: .down))                                  // "0.999999%"
Float(0.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero))               // "1%"
Float(0.01).formatted(.percent.rounded(rule: .towardZero))                            // "0.999999%"
Float(0.01).formatted(.percent.rounded(rule: .up))                                    // "1%"
Float(5.01).formatted(.percent.rounded(rule: .down, increment: 1))                    // "501%"
Float(5.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "501%"
Float(5.01).formatted(.percent.rounded(rule: .towardZero, increment: 1))              // "501%"
Float(5.01).formatted(.percent.rounded(rule: .up, increment: 1))                      // "502%"

Double(0.26575467567788).formatted(.percent.rounded(rule: .awayFromZero))              // "26.575468%"
Double(0.00900999876871).formatted(.percent.rounded(rule: .awayFromZero))              // "0.901%"
Double(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 1))            // "501%"
Double(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 10))           // "510%"
Double(0.01).formatted(.percent.rounded(rule: .down))                                  // "1%"
Double(0.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero))               // "1%"
Double(0.01).formatted(.percent.rounded(rule: .towardZero))                            // "1%"
Double(0.01).formatted(.percent.rounded(rule: .up))                                    // "1%"
Double(5.01).formatted(.percent.rounded(rule: .down, increment: 1))                    // "501%"
Double(5.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "501%"
Double(5.01).formatted(.percent.rounded(rule: .towardZero, increment: 1))              // "501%"
Double(5.01).formatted(.percent.rounded(rule: .up, increment: 1))                      // "501%"

Decimal(0.26575467567788).formatted(.percent.rounded(rule: .awayFromZero))              // "26.575468%"
Decimal(0.00900999876871).formatted(.percent.rounded(rule: .awayFromZero))              // "0.901%"
Decimal(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 1))            // "501%"
Decimal(5.01).formatted(.percent.rounded(rule: .awayFromZero, increment: 10))           // "510%"
Decimal(0.01).formatted(.percent.rounded(rule: .down))                                  // "1%"
Decimal(0.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero))               // "1%"
Decimal(0.01).formatted(.percent.rounded(rule: .towardZero))                            // "1%"
Decimal(0.01).formatted(.percent.rounded(rule: .up))                                    // "1%"
Decimal(5.01).formatted(.percent.rounded(rule: .down, increment: 1))                    // "500%"
Decimal(5.01).formatted(.percent.rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "501%"
Decimal(5.01).formatted(.percent.rounded(rule: .towardZero, increment: 1))              // "500%"
Decimal(5.01).formatted(.percent.rounded(rule: .up, increment: 1))                      // "501%"
```

<h3 id="percent-sign">Sign</h3>

Controls the visibility of the negative and positive sign.

| Sign Display Strategy     | Description                                                                           |
|---------------------------|---------------------------------------------------------------------------------------|
| `.automatic`              | Displays the negative sign (-) when the number is negative. Positive sign isn't shown |
| `.never`                  | Never shows the positive (+) or negative (-) signs                                    |
| `.always(includingZero:)` | Passing in `true` will show the positive sign on a 0 value                            |

``` swift
Float(1.90).formatted(.percent.sign(strategy: .never))                      // "189.999998%"
Float(-1.90).formatted(.percent.sign(strategy: .never))                     // "189.999998%"
Float(1.90).formatted(.percent.sign(strategy: .automatic))                  // "189.999998%"
Float(1.90).formatted(.percent.sign(strategy: .always()))                   // "+189.999998%"
Float(0).formatted(.percent.sign(strategy: .always(includingZero: true)))   // "+0%"
Float(0).formatted(.percent.sign(strategy: .always(includingZero: false)))  // "0%"
```

<h3 id="percent-decimal-separator">Decimal Separator</h3>

Controls the visibility of the decimal separator.

| Decimal Separator Display Strategy | Descriotion                                           |
|------------------------------------|-------------------------------------------------------|
| `.automatic`                       | Only shows the decimal separator on fractional values |
| `.always`                          | Always shows the decimal separator                    |

``` swift
Float(10).formatted(.percent.decimalSeparator(strategy: .automatic))    // "1,000%"
Float(10).formatted(.percent.decimalSeparator(strategy: .always))       // "1,000.%"
```

<h3 id="percent-grouping">Grouping</h3>

Controls if the thousands units are grouped or not.

| Grouping  | Descriotion                   |
|-----------|-------------------------------|
| `.never`  | Never group thousands digits  |
| `.always` | Always group thousands digits |

``` swift
Float(1_000).formatted(.percent.grouping(.automatic))   // "100,000%"
Float(1_000).formatted(.percent.grouping(.never))       // "100000%"
```

<h3 id="percent-precision">Precision</h3>

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
Decimal(10.1).formatted(.percent.precision(.significantDigits(1))) // "1,000%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(2))) // "1,000%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(3))) // "1,010%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(4))) // "1,010%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(5))) // "1,010.0%"

Decimal(1).formatted(.percent.precision(.significantDigits(1 ... 3)))       // "100%"
Decimal(10).formatted(.percent.precision(.significantDigits(1 ... 3)))      // "1,000%"
Decimal(10.1).formatted(.percent.precision(.significantDigits(1 ... 3)))    // "1,010%"
Decimal(10.01).formatted(.percent.precision(.significantDigits(1 ... 3)))   // "1,000%"

Decimal(0.0001).formatted(.percent.precision(.fractionLength(1))) // 0.0%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(2))) // 0.01%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(3))) // 0.010%

Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...1)))    // 0%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...2)))    // 0.01%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...3)))    // 0.01%
Decimal(0.0001).formatted(.percent.precision(.fractionLength(0...4)))    // 0.01%

Decimal(10.111).formatted(.percent.precision(.integerLength(1))) // 1.1%
Decimal(10.111).formatted(.percent.precision(.integerLength(2))) // 11.1%

Decimal(10.111).formatted(.percent.precision(.integerLength(0...1))) // 1.1%
Decimal(10.111).formatted(.percent.precision(.integerLength(0...2))) // 11.1%
Decimal(10.111).formatted(.percent.precision(.integerLength(0...3))) // 11.1%

Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 1, fraction: 1))) // 1.1%
Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 2, fraction: 1))) // 11.1%
Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 2, fraction: 2))) // 11.10%
Decimal(10.111).formatted(.percent.precision(.integerAndFractionLength(integer: 2, fraction: 3))) // 11.100%
```

<h3 id="percent-notation">Notation</h3>

Controls the ability to use different notation styles.

| Notation Setting | Description                                                                                                 |
|------------------|-------------------------------------------------------------------------------------------------------------|
| `.automatic`     | Used primarily when compositing other styles, will choose the best notation setting for the given settings. |
| `.compactName`   | Uses the compact notation for the thousands styles                                                          |
| `.scientific`    | Uses scientific notation                                                                                    |

``` swift
Float(1_000).formatted(.percent.notation(.automatic))   // "100,000%"
Float(1_000).formatted(.percent.notation(.compactName)) // "100K%"
Float(1_000).formatted(.percent.notation(.scientific))  // "1E5%"
```

<h3 id="percent-scale">Scale</h3>

Controls the scale of the number.

``` swift
Float(10).formatted(.percent.scale(1.0))    // "10%"
Float(10).formatted(.percent.scale(1.5))    // "15%"
Float(10).formatted(.percent.scale(2.0))    // "20%"
Float(10).formatted(.percent.scale(-2.0))   // "-20%"
```

<h3 id="percent-locale">Setting the Locale</h3>

Controls the locale of the output.

``` swift
Float(1_000).formatted(.percent.grouping(.automatic).locale(Locale(identifier: "fr_FR")))   // "100 000 %"
Float(1_000).formatted(.percent.grouping(.never).locale(Locale(identifier: "fr_FR")))       // "100000 %"

Float(1_000).formatted(.percent.notation(.automatic).locale(Locale(identifier: "fr_FR")))   // "100 000 %"
Float(1_000).formatted(.percent.notation(.compactName).locale(Locale(identifier: "fr_FR"))) // "100 k %"
Float(1_000).formatted(.percent.notation(.scientific).locale(Locale(identifier: "fr_FR")))  // "1E5 %"
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

<h3 id="percent-compositing">Compositing</h3>

Any of the above styles can be combined to fully customize the output.

``` swift
Float(10).formatted(.percent.scale(200.0).notation(.compactName).grouping(.automatic)) // "2K%"
```

<h3 id="percent-attributed-string-output">Attributed String Output</h3>

Outputs and `AttributedString` instead of a `String`.

``` swift
Float(10).formatted(.percent.scale(200.0).notation(.compactName).grouping(.automatic).attributed)
```

### Parsing Percentages From Strings

{{< hint type=important >}}

Percentages parsed as Integers will be a value from 0 - 100, while percentages parsed as floating point or decimal values will be 0.0 - 1.0.

{{< /hint >}}

Percentage strings can be parsed into any of Swift's built-in numeric types. 

``` swift
try? Int("98%", format: .percent) // 98
try? Float("95%", format: .percent) // 0.95
try? Decimal("95%", format: .percent) // 0.95
```
