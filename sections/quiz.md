---
sitemap_ignore: true
---
## How do I even know where to start?

You can start off by reading [The Basics](/#the-basics).

If you have a specific need and aren't quite sure how to execute it, follow along:

#### I have a

{{< expand "Number" "⇅" >}}

{{< xcode13-badge >}}

All built-in number types are supported by these format styles (`Float`, `Double`, `Int`, and `Decimal`)

{{< expand "And I just want to customize the output" "⇅" >}}

{{< xcode13-badge >}}

See <a href="/number-styles/">Number Style</a>

| Property                                                    | Description                                                   |
| ----------------------------------------------------------- | ------------------------------------------------------------- |
| [Rounding](/number-styles/#numbers-rounding)                               | Customize the rounding behaviour                              |
| [Sign](/number-styles/#numbers-sign)                                       | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](/number-styles/#numbers-decimal-separator)             | Do you want to show or hide the decimal separator             |
| [Grouping](/number-styles/#numbers-grouping)                               | How do you want the thousands numbers to be grouped           |
| [Precision](/number-styles/#numbers-prescision)                            | How many fractional or significant digits do you want to show |
| [Notation](/number-styles/#numbers-notation)                               | Enable scientific or compact notation                         |
| [Scale](/number-styles/#numbers-scale)                                     | Scale the number up or down before display                    |
| [Locale](/number-styles/#numbers-locale)                                   | Set the `Locale` for one output                               |
| [Compositing](/number-styles/#numbers-compositing)                         | Mix and match any and all of the above                        |
| [AttributedString output](/number-styles/#numbers-attributed-string-output) | Output an `AttributedString`                                 |

{{< /expand >}}

{{< expand "And it's actually a Percentage" "⇅" >}}

{{< xcode13-badge >}}

See <a href="/number-styles/#percent-style">Percent Style</a>

{{< xcode13-badge >}}

{{< hint type=important >}}
When formatting a floating point number (Double/Float/Decimal), `1.0` is "100%", while formatting the integer `1` is only "1%"
{{< /hint >}}

| Property                                                     | Description                                                   |
| ------------------------------------------------------------ | ------------------------------------------------------------- |
| [Rounding](/number-styles/#percent-rounding)                                | Customize the rounding behaviour                              |
| [Sign](/number-styles/#percent-sign)                                        | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](/number-styles/#percent-decimal-separator)              | Do you want to show or hide the decimal separator             |
| [Grouping](/number-styles/#percent-grouping)                                | How do you want the thousands numbers to be grouped           |
| [Precision](/number-styles/#percent-prescision)                             | How many fractional or significant digits do you want to show |
| [Notation](/number-styles/#percent-notation)                                | Enable scientific or compact notation                         |
| [Scale](/number-styles/#percent-scale)                                      | Scale the number up or down before display                    |
| [Locale](/number-styles/#percent-locale)                                    | Set the `Locale` for one output                               |
| [Compositing](/number-styles/#percent-compositing)                          | Mix and match any and all of the above                        |
| [AttributedString output](/number-styles/#percent-attributed-string-output) | Output an `AttributedString`                                  |

{{< hint type=important >}}
The various percent formatters handle integers and floating point values differently.
- `Int(1)` outputs "1%"
- `Int(100)` outputs "100%"
- `Double(1.0)` outputs "100%"
- `Double(0.01)` outputs "1%"
{{< /hint >}}

{{< /expand >}}

{{< expand "And it's actually Money" "⇅" >}}

{{< xcode13-badge >}}

See <a href="/number-styles/#currency-style">Currency Style</a>

{{< xcode13-badge >}}

Currency requires you to set the ISO 4217 code for the target currency to output.

<a href="https://en.wikipedia.org/wiki/ISO_4217">See all ISO 4217 codes</a>

{{< hint type=caution >}}
Floating point types shouldn't be used to store or do calculations on numbers that required a lot of accuracy. This includes currency values.
{{< /hint >}}

| Property                                                      | Description                                                   |
| ------------------------------------------------------------- | ------------------------------------------------------------- |
| [Rounding](/number-styles/#currency-rounding)                                | Customize the rounding behaviour                              |
| [Sign](/number-styles/#currency-sign)                                        | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](/number-styles/#currency-decimal-separator)              | Do you want to show or hide the decimal separator             |
| [Grouping](/number-styles/#currency-grouping)                                | How do you want the thousands numbers to be grouped           |
| [Precision](/number-styles/#currency-prescision)                             | How many fractional or significant digits do you want to show |
| [Presentation](/number-styles/#currency-presentation)                        | Controls the style of the displayed currency                  |
| [Scale](/number-styles/#currency-scale)                                      | Scale the number up or down before display                    |
| [Locale](/number-styles/#currency-locale)                                    | Set the `Locale` for one output                               |
| [Compositing](/number-styles/#currency-compositing)                          | Mix and match any and all of the above                        |
| [AttributedString output](/number-styles/#currency-attributed-string-output) | Output an `AttributedString`                                  |

{{< /expand >}}

{{< /expand >}}

{{< expand "Single Date" "⇅" >}}

{{< xcode13-badge >}} {{< xcode14-badge >}}

{{< expand "Just the full date and/or time" "⇅" >}}

{{< xcode13-badge >}}

Apple added a date extension onto `Date` that lets you output the date and/or time in certain formats.

<a href="/date-styles/#date-and-time-single-date">See Date and Time Style</a>

{{< /expand >}}

{{< expand "I want to mix and match date components" "⇅" >}}

{{< xcode13-badge >}}

The `dateTime()` format style lets you compose a date string by choosing which date components you'd like to include. Each component can be further customized passing in some options.

See <a href="/date-styles/#datetime-compositing-single-date">composting using .dateTime</a>

{{< /expand >}}

{{< expand "I want a standard ISO8601" "⇅" >}}

{{< xcode13-badge >}}

Output date strings that conform to the <a href="https://en.wikipedia.org/wiki/ISO_8601" target="_blank">ISO 8601 standard</a>. 

See  <a href="/date-styles/#iso-8601-date-style-single-date">ISO8601 Style</a>

{{< /expand >}}

{{< expand "Exactly how far away it is" "⇅" >}}

{{< xcode13-badge >}}

Relative date formatting outputs a plain language string that describes how far away that date is to right now. You can also customize which date components are used in the output. 

This is similar to the components format style on date ranges, but that one uses date ranges instead of assuming the current date and time.

See <a href="/date-styles/#relative-date-style-single-date">Relative Style</a>

{{< /expand >}}

{{< expand "An date in a very specific format" "⇅" >}}

{{< xcode13-badge >}} {{< xcode14-badge >}}

If you need to output a very rigid date string that follows an exact format, you can use the verbatim format style to do that. Updated in Xcode 14.

See <a href="/date-styles/#verbatim-date-style-single-date">Verbatim Style</a>

{{< /expand >}}

{{< /expand >}}

{{< expand "Range of Dates" "⇅" >}}

{{< xcode13-badge >}}

{{< expand "Just show the earliest and latest dates" "⇅" >}}

The interval formatter just shows the earliest and latest dates in a range.

See <a href="/date-range-styles/#interval-date-style-date-range">Interval Style</a>

{{< /expand >}}

{{< expand "How long as passed between the earliest and latest dates" "⇅" >}}

{{< xcode13-badge >}}

Use the components format style if you want a plain language representation of the distance between the earliest and latest dates in a date range. This is similar to the relative date format style (but for date ranges).

See <a href="/date-range-styles/#components-date-style-date-range">Components Style</a>

{{< /expand >}}

{{< /expand >}}

{{< expand "An Array/List" "⇅" >}}

{{< xcode13-badge >}}

The list format style lets you take an array of data objects, and output them as a list on screen. You can also customize how each object is formatted within the list.

See <a href ="/list-style/">List style</a>

{{< /expand >}}

{{< expand "Measurement" "⇅" >}}

{{< xcode13-badge >}} {{< xcode14-badge >}}

Any unit that's supported by the `Measurement` API can be formatted with many different customization options. Updated in Xcode 14.

See <a href ="/measurement-style/">Measurement Style</a>

{{< /expand >}}

{{< expand "Person's Name" "⇅" >}}

{{< xcode13-badge >}}

A person's name is tricky to localize correctly, the PersonNameComponents format style can handle the complexities of localization for you.

See <a href ="/person-name-style/">Person Name Components</a>

{{< /expand >}}

{{< expand "A number of bytes" "⇅" >}}

{{< xcode13-badge >}}

Easily display how many gigabytes that byte count is.

See <a href ="/byte-count-style/">Byte Count Style</a>

{{< /expand >}}

{{< expand "Duration" "⇅" >}}

{{< xcode14-badge >}}

Easily format the `Duration` type.

See <a href ="/duration-style/">Duration Style</a>

{{< expand "Time Style" "⇅" >}}

{{< xcode14-badge >}}

Shows the `Duration` represented in a combination of hours, minutes, and seconds.

See <a href ="/duration-style/#time-style">Duration Style</a>

{{< /expand >}}

{{< expand "Units Style" "⇅" >}}

{{< xcode14-badge >}}

Shows the `Duration` using a specific set of units.

See <a href ="/duration-style/#units-style">Duration Style</a>

{{< /expand >}}

{{< /expand >}}


{{< expand "URL" "⇅" >}}

{{< xcode14-badge >}}

Format your Universal Resource Locator.

See <a href ="/url-style/">URL Style</a>

{{< /expand >}}

{{< expand "Need for something custom" "⇅" >}}

{{< xcode13-badge >}}

You can easily bend the `FormatStyle` protocol to your will and arbitrarily convert any type into any type.

See <a href ="/custom-styles/">Custom FormatStyle (with locale and attributed string support)</a>

{{< /expand >}}

{{< expand "The reverse, I want to parse a String into something" "⇅" >}}

Several of the included format styles also conform to `ParseableFormatStyle`, a protocol built to parse strings into their respective data types.

[You can read about it in more detail here.](https://ampersandsoftworks.com/posts/from-strings-to-data-using-parseableformatstyle/)

{{< expand "Parsing Dates" "⇅" >}}

{{< xcode13-badge >}}

By setting up either a `Date.FormatStyle` or `Date.ISO8601FormatStyle` with your date structure, you can parse dates easily.

[See Parsing Dates](/date-styles/#parsing-dates-from-strings)

[See Parsing ISO8601 Dates](/date-styles/#parsing-iso8601-dates-from-strings)

{{< /expand >}}

{{< expand "Parsing Decimal Numbers" "⇅" >}}

{{< xcode13-badge >}}

You can parse Decimals, Percentages, or Currency values into Decimals.

[See Parsing Decimals](/number-styles/#parsing-decimals-from-strings)

[See Parsing Decimal Percentages](/number-styles/#parsing-percentages-from-strings)

[See Parsing Decimal Currencies](/number-styles/#parsing-currencies-from-strings) 

{{< /expand >}}

{{< expand "Parsing Names" "⇅" >}}

{{< xcode13-badge >}}

Generally useful for parsing names from string respecting a `Locale`, it's easy to parse names.

[See Parsing Names](/person-name-style/#parsing-names-from-strings)

{{< /expand >}}

{{< expand "Parsing URLs" "⇅" >}}

{{< xcode14-badge >}}

Parse a URL string into a URL value.

[See Parsing URLs](/url-style/#parsing-urls)

{{< /expand >}}

{{< /expand >}}