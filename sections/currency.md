---
---
### Available Properties

| Property                                                      | Description                                                   |
| ------------------------------------------------------------- | ------------------------------------------------------------- |
| [Rounding](#currency-rounding)                                | Customize the rounding behaviour                              |
| [Sign](#currency-sign)                                        | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](#currency-decimal-separator)              | Do you want to show or hide the decimal separator             |
| [Grouping](#currency-grouping)                                | How do you want the thousands numbers to be grouped           |
| [Precision](#currency-prescision)                             | How many fractional or significant digits do you want to show |
| [Presentation](#currency-presentation)                        | Controls the style of the displayed currency                  |
| [Scale](#currency-scale)                                      | Scale the number up or down before display                    |
| [Locale](#currency-locale)                                    | Set the `Locale` for one output                               |
| [Compositing](#currency-compositing)                          | Mix and match any and all of the above                        |
| [AttributedString output](#currency-attributed-string-output) | Output an `AttributedString`                                  |

<h3 id="currency-rounding">Rounding</h3>

At its simplest, you can call the `.formatted(.number.rounded())` method on any number type (Float, Double, Decimal, or Integer) in order to get the system's default rounding behaviour.

```
Decimal(0.59).formatted(.currency(code: "GBP").rounded())   // "£0.59"
Decimal(0.599).formatted(.currency(code: "GBP").rounded())  // "£0.60"
Decimal(0.5999).formatted(.currency(code: "GBP").rounded()) // "£0.60"
````

Using the full instance method, you can access more granular settings: `.number.rounded(rule:increment:)`.

| Rounding Rule              | Description                                                                                        |
| -------------------------- | -------------------------------------------------------------------------------------------------- |
| `.awayFromZero`            | Round to the closest allowed value whose magnitude is greater than or equal to that of the source. |
| `.down`                    | Round to the closest allowed value that is less than or equal to the source.                       |
| `.toNearestOrAwayFromZero` | Round to the closest allowed value; if two values are equally close, the one with greater          |
| `.toNearestOrEven`          | Round to the closest allowed value; if two values are equally close, the even one is chosen.      |
| `.towardZero`              | Round to the closest allowed value whose magnitude is less than or equal to that of the source.    |
| `.up`                      | Round to the closest allowed value that is greater than or equal to the source.                    |

The `increment:` parameter is a `Double` and tells the system under the hood what to round the value by.

```
Decimal(0.59).formatted(.currency(code: "GBP").rounded())   // "£0.59"
Decimal(0.599).formatted(.currency(code: "GBP").rounded())  // "£0.60"
Decimal(0.5999).formatted(.currency(code: "GBP").rounded()) // "£0.60"

Decimal(5.001).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero)) // "£5.01"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero))  // "£5.01"

Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero, increment: 1))  // "£6"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .awayFromZero, increment: 10)) // "£10"

Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .down))                    // "£5.00"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .toNearestOrAwayFromZero)) // "£5.01"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .towardZero))              // "£5.00"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .up))                      // "£5.01"

Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .down, increment: 1)) // "£5"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .toNearestOrAwayFromZero, increment: 1)) // "£5"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .towardZero, increment: 1)) // "£5"
Decimal(5.01).formatted(.currency(code: "GBP").rounded(rule: .up, increment: 1)) // "£5"
```

<h3 id="currency-sign">Sign</h3>

Controls the visibility of the negative and positive sign.

| Sign Display Strategy          | Description                                                            |
| ------------------------------ | ---------------------------------------------------------------------- |
| `.automatic`                   | Automatically desides which strategy to use                            |
| `.never`                       | Never shows the positive (+) or negative (-) signs                     |
| `.always()`                    | Always shows the positive (+) or negative (-) signs                    |
| `.always(showsZero:)`          | Accepts a `Bool`, and controls if a `0` value gets a positive (+) sign |
| `.accountingAlways()`          | Uses the standardized account style for numbers                        |
| `.accountingAlways(showsZero)` | Accepts a `Bool`, and controls if a `0` value gets a positive (+) sign | 

```
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .automatic))                         // "£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .never))                             // "£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accounting))                        // "£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accountingAlways()))                // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accountingAlways(showZero: true)))  // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .accountingAlways(showZero: false))) // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .always()))                          // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .always(showZero: true)))            // "+£7.00"
Decimal(7).formatted(.currency(code: "GBP").sign(strategy: .always(showZero: false)))           // "+£7.00"
```

<h3 id="currency-decimal-separator">Decimal Separator</h3>

Controls the visibility of the decimal separator.

| Decimal Separator Display Strategy | Descriotion                                           |
| ---------------------------------- | ----------------------------------------------------- |
| `.automatic`                       | Only shows the decimal separator on fractional values |
| `.always`                          | Always shows the decimal separator                    | 

```
Decimal(3000).formatted(.currency(code: "GBP").decimalSeparator(strategy: .automatic)) // "£3,000.00"
Decimal(3000).formatted(.currency(code: "GBP").decimalSeparator(strategy: .always))    // "£3,000.00"
```

<h3 id="currency-grouping">Grouping</h3>

Controls if the thousands units are grouped or not.

| Grouping  | Descriotion                   |
| --------- | ----------------------------- |
| `.never`  | Never group thousands digits  |
| `.always` | Always group thousands digits | 

```
Int(3_000).formatted(.currency(code: "GBP").grouping(.never))     // "£3000.00"
Int(3_000).formatted(.currency(code: "GBP").grouping(.automatic)) // "£3,000.00"
```

<h3 id="currency-precision">Precision</h3>

There are seven options to set the precision of the output.

| Precision Option                               | Description                                                    |
| ---------------------------------------------- | -------------------------------------------------------------- |
| `.significantDigits(Int)`                      | Sets a fixed number of significant digits to show              |
| `.significantDigits(Range)`                    | Sets a range of significant digits to show                     |
| `.fractionLength(Int)`                         | Sets the number digits after the decimal separator             |
| `.fractionLength(Range)`                       | Sets a range of digits to show after the decimal separator     |
| `.integerLength(Int)`                          | Sets the number of digits to show before the decimal separator |
| `.integerLength(Range)`                        | Sets a range of digits to show before the decimal separator    |
| `.integerAndFractionLength(integer:fraction:)` | Sets both the integer and fractional digits to display         |
|                                                |                                                                |

```
// Please don't use Floating point numbers to store currency. Please.
Float(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(4))) // "£3,000.0029" <- This is why
Float(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(1 ... 4))) // "£3,000.0029"

Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(4)))       // "£3,000.0029"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.fractionLength(1 ... 4))) // "£3,000.0029"

Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(3))) // "£000.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(4))) // "£3,000.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(5))) // "£03,000.00"

Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(0...3))) // "£.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(0...4))) // "£3,000.00"
Decimal(3_000.003).formatted(.currency(code: "GBP").precision(.integerLength(0...5))) // "£03,000.00"

Decimal(3).formatted(.currency(code: "GBP").precision(.integerAndFractionLength(integer: 4, fraction: 4))) // "£0,003.0000"
Decimal(3).formatted(
    .currency(code: "GBP")
    .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£3.0"
Decimal(3.00004).formatted(
    .currency(code: "GBP")
    .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£3.00004"
Decimal(3.000000004).formatted(
    .currency(code: "GBP")
    .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
)
Decimal(30000.01).formatted(
    .currency(code: "GBP")
    .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£30,000.01"
Decimal(3000000.000001).formatted(
    .currency(code: "GBP")
    .precision(.integerAndFractionLength(integerLimits: 1 ... 5, fractionLimits: 1 ... 5))
) // "£0.0"

Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(1))) // "£10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(2))) // "£10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(3))) // "£10.1"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(4))) // "£10.10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(5))) // "£10.100"

Decimal(1).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3)))     // "£1"
Decimal(10).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3)))    // "£10"
Decimal(10.1).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3)))  // "£10.1"
Decimal(10.01).formatted(.currency(code: "GBP").precision(.significantDigits(1 ... 3))) // "£10"
```

<h3 id="currency-presentation">Presentation</h3>

Controls how verbose the currency display is when being presented

| Presentation Setting | Description                                               |
| -------------------- | --------------------------------------------------------- |
| `.fullName`          | Writes out the currency value in full                     |
| `.isoCode`           | Uses the ISO 4217 currency code for display               |
| `.narrow`            | Fits the string in the smallest horizontal space possible |
| `.standard`          | The default output style                                  | 

```
Decimal(10).formatted(.currency(code: "GBP").presentation(.fullName)) // "10.00 British pounds"
Decimal(10).formatted(.currency(code: "GBP").presentation(.isoCode))  // "GBP 10.00"
Decimal(10).formatted(.currency(code: "GBP").presentation(.narrow))   // "£10.00"
Decimal(10).formatted(.currency(code: "GBP").presentation(.standard)) // "£10.00"
```

<h3 id="currency-scale">Scale</h3>

Controls the scale of the number.

```
Decimal(10).formatted(.currency(code: "GBP").scale(1))    // "£10.00"
Decimal(10).formatted(.currency(code: "GBP").scale(1.5))  // "£15.00"
Decimal(10).formatted(.currency(code: "GBP").scale(-1.5)) // "-£15.00"
Decimal(10).formatted(.currency(code: "GBP").scale(10))   // "£100.00"
```

<h3 id="currency-locale">Setting the Locale</h3>

Controls the locale of the output.

```
Decimal(10).formatted(.currency(code: "GBP").presentation(.fullName).locale(Locale(identifier: "fr_FR"))) // "10,00 livres sterling"
```

<h3 id="currency-compositing">Compositing</h3>

Any of the above styles can be combined to fully customize the output.

```
Decimal(10).formatted(.currency(code: "GBP").scale(200.0).sign(strategy: .always()).presentation(.fullName)) // "+2,000.00 British pounds"
```

<h3 id="currency-attributed-string-output">Attributed String Output</h3>

Outputs and `AttributedString` instead of a `String`.

```
Decimal(10).formatted(.currency(code: "GBP").scale(200.0).sign(strategy: .always()).presentation(.fullName).attributed)
```