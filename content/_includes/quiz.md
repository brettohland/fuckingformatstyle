---
sitemap_ignore: true
---
## How do I even know where to start?

You can start off by reading [The Basics](/#the-basics).

If you have a specific need and aren't quite sure how to execute it, follow along:

#### I have a

{{< expand "Number" "⇅" >}}

All built-in number types are supported by these format styles (`Float`, `Double`, `Int`, and `Decimal`)

{{< expand "And I just want to customize the output" "⇅" >}}

See <a href="/#number-style">Number Style</a>

| Property                                                    | Description                                                   |
| ----------------------------------------------------------- | ------------------------------------------------------------- |
| [Rounding](#numbers-rounding)                               | Customize the rounding behaviour                              |
| [Sign](#numbers-sign)                                       | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](#numbers-decimal-separator)             | Do you want to show or hide the decimal separator             |
| [Grouping](#numbers-grouping)                               | How do you want the thousands numbers to be grouped           |
| [Precision](#numbers-prescision)                            | How many fractional or significant digits do you want to show |
| [Notation](#numbers-notation)                               | Enable scientific or compact notation                         |
| [Scale](#numbers-scale)                                     | Scale the number up or down before display                    |
| [Locale](#numbers-locale)                                   | Set the `Locale` for one output                               |
| [Compositing](#numbers-compositing)                         | Mix and match any and all of the above                        |
| [AttributedString output](#numbers-attributed-string-output) | Output an `AttributedString`                                 |

{{< /expand >}}

{{< expand "And it's actually a Percentage" "⇅" >}}

See <a href="/#percent-style">Percent Style</a>

{{< hint type=important >}}
When formatting a floating point number (Double/Float/Decimal), `1.0` is "100%", while formatting the integer `1` is only "1%"
{{< /hint >}}

| Property                                                     | Description                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------- |
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

{{< hint type=important >}}
The various percent formatters handle integers and floating point values differently.
- `Int(1)` outputs "1%"
- `Int(100)` outputs "100%"
- `Double(1.0)` outputs "100%"
- `Double(0.01)` outputs "1%"
{{< /hint >}}

{{< /expand >}}

{{< expand "And it's actually Money" "⇅" >}}

See <a href="/#currency-style">Currency Style</a>

Currency requires you to set the ISO 4217 code for the target currency to output.

<a href="https://en.wikipedia.org/wiki/ISO_4217">See all ISO 4217 codes</a>

{{< hint type=caution >}}
Floating point types shouldn't be used to store or do calculations on numbers that required a lot of accuracy. This includes currency values.
{{< /hint >}}

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

{{< /expand >}}

{{< /expand >}}

{{< expand "Single Date" "⇅" >}}

{{< expand "Just the full date and/or time" "⇅" >}}

Apple added a date extension onto `Date` that lets you output the date and/or time in certain formats.

<a href="/#date-and-time-single-date">See Date and Time Style</a>

{{< /expand >}}

{{< expand "I want to mix and match date components" "⇅" >}}

The `dateTime()` format style lets you compose a date string by choosing which date components you'd like to include. Each component can be further customized passing in some options.

See <a href="/#datetime-compositing-single-date">composting using .dateTime</a>

{{< /expand >}}

{{< expand "I want a standard ISO8601" "⇅" >}}

Output date strings that conform to the <a href="https://en.wikipedia.org/wiki/ISO_8601" target="_blank">ISO 8601 standard</a>. 

See  <a href="/#iso-8601-date-style-single-date">ISO8601 Style</a>

{{< /expand >}}

{{< expand "Exactly how far away it is" "⇅" >}}

Relative date formatting outputs a plain language string that describes how far away that date is to right now. You can also customize which date components are used in the output. 

This is similar to the components format style on date ranges, but that one uses date ranges instead of assuming the current date and time.

See <a href="/#relative-date-style-single-date">Relative Style</a>

{{< /expand >}}

{{< expand "An un-localized date in a very specific format" "⇅" >}}

If you need to output a very rigid date string that follows an exact format, you can use the verbatim format style to do that.

See <a href="/#verbatim-date-style-single-date">Verbatim Style</a>

{{< /expand >}}

{{< /expand >}}

{{< expand "Range of Dates" "⇅" >}}

{{< expand "Just show the earliest and latest dates" "⇅" >}}

The interval formatter just shows the earliest and latest dates in a range. There's limited customization options.

See <a href="/#interval-date-style-date-range">Interval Style</a>

{{< /expand >}}

{{< expand "How long as passed between the earliest and latest dates" "⇅" >}}

Use the components format style if you want a plain language representation of the distance between the earliest and latest dates in a date range. This is similar to the relative date format style (but for date ranges).

See <a href="/#components-date-style-date-range">Components Style</a>

{{< /expand >}}

{{< /expand >}}

{{< expand "An Array/List" "⇅" >}}

The list format style lets you take an array of data objects, and output them as a list on screen. You can also customize how each object is formatted within the list.

See <a href ="/#list-style">List style</a>

{{< /expand >}}

{{< expand "Some Measurement" "⇅" >}}

Any unit that's supported by the `Measurement` API can be formatted with many different customization options.

See <a href ="/#measurement-style">Measurement Style</a>

{{< /expand >}}

{{< expand "Person's Name" "⇅" >}}

A person's name is tricky to localize correctly, the PersonNameComponents format style can handle the complexities of localization for you.

See <a href ="/#person-name-component-style">Person Name Components</a>

{{< /expand >}}

{{< expand "A number of bytes" "⇅" >}}

Easily display how many gigabytes that byte count is.

See <a href ="/#byte-count-style">Byte Count Style</a>

{{< /expand >}}

{{< expand "Need for something custom" "⇅" >}}

You can easily bend the `FormatStyle` protocol to your will and arbitrarily convert any type into any type.

See <a href ="/#custom-format-style">Custom FormatStyle (with locale and attributed string support)</a>

{{< /expand >}}
