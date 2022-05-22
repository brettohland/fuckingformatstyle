# Where to start? Take the quiz

You can start off by reading [The Basics](/#).

#### I have a

{{< expand "Number" "⇅" >}}

These formatters support all of the built-in number types: Int, Double, Float, Decimal.

  {{< expand "And I just want to customize the output" "⇅" >}}
  
  [Formatting a number](/#)
  
  | Property                       | Description                                                   |
  | ------------------------------ | ------------------------------------------------------------- |
  | [Rounding](#)                  | Customize the rounding behaviour                              |
  | [Sign visibility](#)           | Do you want to show or hide the + or - sign?                  |
  | [Decimal Separator](#)         | Do you want to show or hide the decimal separator             |
  | [Grouping](#)                  | How do you want the thousands numbers to be grouped           |
  | [Significant digits](#)        | How many fractional or significant digits do you want to show |
  | [Notation](#)                  | Enable scientific or compact notation                         |
  | [Scale](#)                     | Scale the number up or down before display                    |
  | [Mixing and Matching](#)       | Mix and match any and all of the above                        |
  | [Set the Locale](#)            | Set the `Locale` for one output                               | 
  | [Set the Calendar](#)          | Set the `Calendar` for the output                             |
  | [`AttributedString` output](#) | Output an `AttributedString`                                  |
  
  {{< /expand >}}

  {{< expand "And it's actually a Percentage" "⇅" >}}

  You can customize the following:

  {{< hint type=important >}}
  When formatting a floating point number (Double/Float/Decimal), `1.0` is "100%", while formatting the integer `1` is only "1%"
  {{< /hint >}}

  | Property                       | Description                                                   |
  | ------------------------------ | ------------------------------------------------------------- |
  | [Rounding](#)                  | Customize the rounding behaviour                              |
  | [Sign visibility](#)           | Do you want to show or hide the + or - sign?                  |
  | [Decimal Separator](#)         | Do you want to show or hide the decimal separator             |
  | [Grouping](#)                  | How do you want the thousands numbers to be grouped           |
  | [Prescision](#)                | How many fractional or significant digits do you want to show |
  | [Notation](#)                  | Enable scientific or compact notation                         |
  | [Scale](#)                     | Scale the number up or down before display                    |
  | [Mixing and Matching](#)       | Mix and match any and all of the above                        |
  | [Set the Locale](#)            | Set the `Locale` for one output                               | 
  | [Set the Calendar](#)          | Set the `Calendar` for the output                             |
  | [`AttributedString` output](#) | Output an `AttributedString`                                  |
  
  {{< hint type=important >}}
  The various percent formatters handle integers and floating point values differently.
  - `Int(1)` outputs "1%"
  - `Int(100)` outputs "100%"
  - `Double(1.0)` outputs "100%"
  - `Double(0.01)` outputs "1%"
  {{< /hint >}}
  
  {{< /expand >}}

  {{< expand "And it's actually Money" "⇅" >}}
  
  Currency requires you to set the ISO 4217 code for the target currency to output.
  
  [See all ISO 4217 codes](https://en.wikipedia.org/wiki/ISO_4217)
  
  {{< hint type=caution >}}
  Floating point types shouldn't be used to store or do calculations on numbers that required a lot of accuracy. This includes currency values.
  {{< /hint >}}
  
  | Property                       | Description                                                          |
  | ------------------------------ | -------------------------------------------------------------------- |
  | [Grouping](#)                  | How do you want the thousands to be grouped                          |
  | [Prescision](#)                | How many significant and fractional digits to show                   |
  | [Decimal Separator](#)         | Do you want to show or hide the decimal separator                    |
  | [Presentation](#)              | How much detail do you want to show in the output about the currency |
  | [Rounding](#)                  | Customize rounding behaviour                                         |
  | [Sign](#)                      | Set how you want the currency to display                             |
  | [Mixing and Matching](#)       | Mix and match any and all of the above                               |
  | [Set the Locale](#)            | Set the `Locale` for one output                                      | 
  | [Set the Calendar](#)          | Set the `Calendar` for the output                                    |
  | [`AttributedString` output](#) | Output an `AttributedString`                                         |
  
  {{< /expand >}}

{{< /expand >}}

{{< expand "Single Date" "⇅" >}}

  {{< expand "Just the full date and/or time" "⇅" >}}

  [See Date.FormatStyle](#)

  {{< /expand >}}
  
  {{< expand "I want to mix and match date components" "⇅" >}}

  [See DateTime formatting](#)

  {{< /expand >}}
  
  {{< expand "ISO 8601 Strings" "⇅" >}}

  [See ISO 8601 formatting](#)

  {{< /expand >}}
  
  {{< expand "Exactly how far away it is" "⇅" >}}

  [See relative date formatting](#)

  {{< /expand >}}
  
  {{< expand "An un-localized date in a very specific format" "⇅" >}}

  [See Verbatim Date formatting](#)

  {{< /expand >}}

{{< /expand >}}

{{< expand "Range of Dates" "⇅" >}}
  {{< expand "Just show the earliest and latest dates" "⇅" >}}

  [See Date Interval formatting](#)

  {{< /expand >}}
  
  {{< expand "How long as passed between the earliest and latest dates" "⇅" >}}
  
  [See Component formatting](#)

  {{< /expand >}}
{{< /expand >}}

{{< expand "An Array/List" "⇅" >}}

[See formatting a list](#)

{{< /expand >}}

{{< expand "Some Measurement" "⇅" >}}

[See Measurements](#)

{{< /expand >}}

{{< expand "Person's Name" "⇅" >}}

[See PersonNameComponents](#)

{{< /expand >}}

{{< expand "Byte Count" "⇅" >}}

[See ByteCountFormatter](#)

{{< /expand >}}

{{< expand "Need for something custom" "⇅" >}}

[See Custom FormatStyles](#)

{{< /expand >}}