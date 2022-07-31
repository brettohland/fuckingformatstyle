---
sitemap_ignore: true
---
| Symbol            | Description                             |
| ----------------- | --------------------------------------- |
| `.day()`          | The numerical day relative to the month |
| `.dayOfTheYear()` | The numerical day relative to the year  |
| `.era()`          | The era of the date                     |
| `.hour()`         | The hour                                |
| `.minute()`       | The minute                              |
| `.month()`        | The month of the year                   |
| `.quarter()`      | The quarter                             |
| `.second()`       | The second                              |
| `.timeZone`       | The time zone                           |
| `.week()`         | The week                                |
| `.weekday()`      | The named day of the week               |
| `.year()`         | The year                                |

{{< hint type=important >}}

The `Locale` for the examples are all `en_CA` (English, Canada) and are using the Gregorian Calendar.

{{< /hint >}}

You can access the date format style in two ways:

1. Instantiate a new instance of the `Date.FormatStyle` struct
2. Use the `.dateTime` extension on `FormatStyle`

Either way, you can then use method chaining to customize the output.

```
twosday.formatted(.dateTime.day()) // "22"
twosday.formatted(.dateTime.dayOfYear()) // "53"
twosday.formatted(.dateTime.era()) // "AD"
twosday.formatted(.dateTime.hour()) // "2 AM"
twosday.formatted(.dateTime.minute()) // "22"
twosday.formatted(.dateTime.month()) // "Feb"
twosday.formatted(.dateTime.quarter()) // "Q1"
twosday.formatted(.dateTime.second()) // "22"
twosday.formatted(.dateTime.secondFraction(.fractional(2))) // "00"
twosday.formatted(.dateTime.secondFraction(.milliseconds(1))) // "8542000"
twosday.formatted(.dateTime.timeZone()) // "MST"
twosday.formatted(.dateTime.week()) // "9"
twosday.formatted(.dateTime.weekday()) // "Tue"
twosday.formatted(.dateTime.year()) // "2022"

twosday.formatted(Date.FormatStyle().day()) // "22"
twosday.formatted(Date.FormatStyle().dayOfYear()) // "53"
twosday.formatted(Date.FormatStyle().era()) // "AD"
twosday.formatted(Date.FormatStyle().hour()) // "2 AM"
twosday.formatted(Date.FormatStyle().minute()) // "22"
twosday.formatted(Date.FormatStyle().month()) // "Feb"
twosday.formatted(Date.FormatStyle().quarter()) // "Q1"
twosday.formatted(Date.FormatStyle().second()) // "22"
twosday.formatted(Date.FormatStyle().secondFraction(.fractional(2))) // "00"
twosday.formatted(Date.FormatStyle().secondFraction(.milliseconds(1))) // "8542000"
twosday.formatted(Date.FormatStyle().timeZone()) // "MST"
twosday.formatted(Date.FormatStyle().week()) // "9"
twosday.formatted(Date.FormatStyle().weekday()) // "Tue"
twosday.formatted(Date.FormatStyle().year()) // "2022"
```

The symbols can be chained together to mix and match your desired string.

```
twosday.formatted(
    Date.FormatStyle().year().month().day().hour().minute().second()
) // "Feb 22, 2022, 2:22:22 AM"

twosday.formatted(
    Date.FormatStyle().second().minute().hour().day().month().year()
) // "Feb 22, 2022, 2:22:22 AM"

twosday.formatted(
    .dateTime.year().month().day().hour().minute().second()
) // "Feb 22, 2022, 2:22:22 AM"
twosday.formatted(
    .dateTime.second().minute().hour().day().month().year()
) // "Feb 22, 2022, 2:22:22 AM"
```

{{< hint type=important >}}

The order of the symbols in the final string are controlled by the date's `Locale` and not the order that they are called.

{{< /hint >}}

## Customization

Each symbol has customization options.

- [Day](#day)
- [Day of Year](#day-of-year)
- [Era](#era)
- [Hour](#hour)
- [Minute](#minute)
- [Month](#month)
- [Quarter](#quarter)
- [Second](#second)
- [Fractional Second](#fractional-second)
- [Time Zone](#time-zone)
- [Week](#week)
- [Weekday](#weekday)
- [Year](#year)

### Day

```
twosday.formatted(.dateTime.day(.twoDigits)) // "22"
twosday.formatted(.dateTime.day(.ordinalOfDayInMonth)) // "4"
twosday.formatted(.dateTime.day(.defaultDigits)) // "22"
twosday.formatted(.dateTime.day(.julianModified())) // "2459633"
twosday.formatted(.dateTime.day(.julianModified(minimumLength: 8))) // "02459633"

twosday.formatted(Date.FormatStyle().day(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().day(.ordinalOfDayInMonth)) // "4"
twosday.formatted(Date.FormatStyle().day(.defaultDigits)) // "22"
twosday.formatted(Date.FormatStyle().day(.julianModified())) // "2459633"
twosday.formatted(Date.FormatStyle().day(.julianModified(minimumLength: 8))) // "02459633"
```

### Day of Year

```
twosday.formatted(.dateTime.dayOfYear(.defaultDigits)) // "53"
twosday.formatted(.dateTime.dayOfYear(.threeDigits)) // "053"
twosday.formatted(.dateTime.dayOfYear(.twoDigits)) // "53"

twosday.formatted(Date.FormatStyle().dayOfYear(.defaultDigits)) // "53"
twosday.formatted(Date.FormatStyle().dayOfYear(.threeDigits)) // "053"
twosday.formatted(Date.FormatStyle().dayOfYear(.twoDigits)) // "53"
```
### Era

```
twosday.formatted(.dateTime.era(.abbreviated)) // "AD"
twosday.formatted(.dateTime.era(.narrow)) // "A"
twosday.formatted(.dateTime.era(.wide)) // "Anno Domini"

twosday.formatted(Date.FormatStyle().era(.abbreviated)) // "AD"
twosday.formatted(Date.FormatStyle().era(.narrow)) // "A"
twosday.formatted(Date.FormatStyle().era(.wide)) // "Anno Domini"
```

### Hour

Each of the following methods accepts an `AMPMStyle`.

| AMPMStyle | Description                                                                                                                                                                                                       | 
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| omitted     | Hides the day period marker (AM/PM). <br>For example, `8` (for 8 in the morning), `1` (for 1 in the afternoon) if used with `defaultDigits`. <br>Or `08`, `01` if used with `twoDigits`.                          |
| narrow      | Narrow day period if the locale prefers using day period with hour. <br>For example, `8`, `8a`, `13`, `1p` if used with `defaultDigits`. <br>Or `08`, `08a`, `13`, `01p` if used with `twoDigits`.                |
| abbreviated | Abbreviated day period if the locale prefers using day period with hour. <br>For example, `8`, `8 AM`, `13`, `1 PM` if used with `defaultDigits`. <br>Or `08`, `08 AM`, `13`, `01 PM` if used with `twoDigits`.   |
| wide        | Wide day period if the locale prefers using day period with hour. <br>For example, `8`, `8 A.M.`, `13`, `1 P.M.` if used with `defaultDigits`. <br>Or, `08`, `08 A.M.`, `13`, `01 P.M.` if used with `twoDigits`. |

| Option                                                                    | Description                                                                                                                                          |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| defaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle)               | The preferred numeric hour format for the locale with minimum digits. Whether the period symbol (AM/PM) will be shown depends on the locale.         |
| twoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle)                   | The preferred two-digit hour format for the locale, zero padded if necessary. Whether the period symbol (AM/PM) will be shown depends on the locale. |
| conversationalDefaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) | Behaves like `defaultDigits`: the preferred numeric hour format for the locale with minimum digits. May also use conversational period formats.      |
| conversationalTwoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle)     | Behaves like `twoDigits`: two-digit hour format for the locale, zero padded if necessary. May also use conversational period formats.                |


```
twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(.dateTime.hour(.conversationalDefaultDigits(amPM: .omitted))) // "02"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(.dateTime.hour(.conversationalTwoDigits(amPM: .omitted))) // "02"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(.dateTime.hour(.defaultDigits(amPM: .omitted))) // "02"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(.dateTime.hour(.twoDigits(amPM: .omitted))) // "02"

twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalDefaultDigits(amPM: .omitted))) // "02"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.conversationalTwoDigits(amPM: .omitted))) // "02"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .wide))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .narrow))) // "2 a"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .abbreviated))) // "2 AM"
twosday.formatted(Date.FormatStyle().hour(.defaultDigits(amPM: .omitted))) // "02"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .wide))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .narrow))) // "02 a"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .abbreviated))) // "02 AM"
twosday.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .omitted))) // "02"
```

### Minute

```
twosday.formatted(.dateTime.minute(.twoDigits)) // "22"
twosday.formatted(.dateTime.minute(.defaultDigits)) // "22"

twosday.formatted(Date.FormatStyle().minute(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().minute(.defaultDigits)) // "22"
```

### Month

```
twosday.formatted(.dateTime.month(.defaultDigits)) // "2"
twosday.formatted(.dateTime.month(.twoDigits)) // "02"
twosday.formatted(.dateTime.month(.wide)) // "February"
twosday.formatted(.dateTime.month(.abbreviated)) // "Feb"
twosday.formatted(.dateTime.month(.narrow)) // "F"

twosday.formatted(Date.FormatStyle().month(.defaultDigits)) // "2"
twosday.formatted(Date.FormatStyle().month(.twoDigits)) // "02"
twosday.formatted(Date.FormatStyle().month(.wide)) // "February"
twosday.formatted(Date.FormatStyle().month(.abbreviated)) // "Feb"
twosday.formatted(Date.FormatStyle().month(.narrow)) // "F"
```

### Quarter

```
twosday.formatted(.dateTime.quarter(.narrow)) // "1"
twosday.formatted(.dateTime.quarter(.abbreviated)) // "Q1"
twosday.formatted(.dateTime.quarter(.wide)) // "1st quarter"
twosday.formatted(.dateTime.quarter(.twoDigits)) // "01"
twosday.formatted(.dateTime.quarter(.oneDigit)) // "1"

twosday.formatted(Date.FormatStyle().quarter(.narrow)) // "1"
twosday.formatted(Date.FormatStyle().quarter(.abbreviated)) // "Q1"
twosday.formatted(Date.FormatStyle().quarter(.wide)) // "1st quarter"
twosday.formatted(Date.FormatStyle().quarter(.twoDigits)) // "01"
twosday.formatted(Date.FormatStyle().quarter(.oneDigit)) // "1"
```

### Second

```
twosday.formatted(.dateTime.second(.twoDigits)) // "22"
twosday.formatted(.dateTime.second(.defaultDigits)) // "22"

twosday.formatted(Date.FormatStyle().second(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().second(.defaultDigits)) // "22"
```

### Fractional Second

```
twosday.formatted(Date.FormatStyle().secondFraction(.fractional(2))) // "00"
twosday.formatted(Date.FormatStyle().secondFraction(.milliseconds(1))) // "8542000"

twosday.formatted(.dateTime.secondFraction(.fractional(2))) // "00"
twosday.formatted(.dateTime.secondFraction(.milliseconds(1))) // "8542000"
```

### Time Zone

```
twosday.formatted(.dateTime.timeZone(.exemplarLocation)) // "Edmonton"
twosday.formatted(.dateTime.timeZone(.genericLocation)) // "Edmonton Time"
twosday.formatted(.dateTime.timeZone(.genericName(.long))) // "Mountain Time"
twosday.formatted(.dateTime.timeZone(.genericName(.short))) // "MT"
twosday.formatted(.dateTime.timeZone(.identifier(.short))) // "caedm"
twosday.formatted(.dateTime.timeZone(.identifier(.long))) // "America/Edmonton"
twosday.formatted(.dateTime.timeZone(.iso8601(.long))) // "-07:00"
twosday.formatted(.dateTime.timeZone(.iso8601(.short))) // "-07:00"
twosday.formatted(.dateTime.timeZone(.specificName(.short))) // "MST"
twosday.formatted(.dateTime.timeZone(.specificName(.long))) // "Mountain Standard Time"
twosday.formatted(.dateTime.timeZone(.localizedGMT(.short))) // "GMT-7"
twosday.formatted(.dateTime.timeZone(.localizedGMT(.long))) // "GMT-07:00"

twosday.formatted(Date.FormatStyle().timeZone(.exemplarLocation)) // "Edmonton"
twosday.formatted(Date.FormatStyle().timeZone(.genericLocation)) // "Edmonton Time"
twosday.formatted(Date.FormatStyle().timeZone(.genericName(.long))) // "Mountain Time"
twosday.formatted(Date.FormatStyle().timeZone(.genericName(.short))) // "MT"
twosday.formatted(Date.FormatStyle().timeZone(.identifier(.short))) // "caedm"
twosday.formatted(Date.FormatStyle().timeZone(.identifier(.long))) // "America/Edmonton"
twosday.formatted(Date.FormatStyle().timeZone(.iso8601(.long))) // "-07:00"
twosday.formatted(Date.FormatStyle().timeZone(.iso8601(.short))) // "-07:00"
twosday.formatted(Date.FormatStyle().timeZone(.specificName(.short))) // "MST"
twosday.formatted(Date.FormatStyle().timeZone(.specificName(.long))) // "Mountain Standard Time"
twosday.formatted(Date.FormatStyle().timeZone(.localizedGMT(.short))) // "GMT-7"
twosday.formatted(Date.FormatStyle().timeZone(.localizedGMT(.long))) // "GMT-07:00"
```

### Week

```
twosday.formatted(.dateTime.week(.defaultDigits)) // "9"
twosday.formatted(.dateTime.week(.twoDigits)) // "09"
twosday.formatted(.dateTime.week(.weekOfMonth)) // "9"

twosday.formatted(Date.FormatStyle().week(.defaultDigits)) // "9"
twosday.formatted(Date.FormatStyle().week(.twoDigits)) // "09"
twosday.formatted(Date.FormatStyle().week(.weekOfMonth)) // "9"
```

### Weekday

```
twosday.formatted(.dateTime.weekday(.abbreviated)) // "Tue"
twosday.formatted(.dateTime.weekday(.twoDigits)) // "3"
twosday.formatted(.dateTime.weekday(.short)) // "Tu"
twosday.formatted(.dateTime.weekday(.oneDigit)) // "3"
twosday.formatted(.dateTime.weekday(.wide)) // "Tuesday"
twosday.formatted(.dateTime.weekday(.narrow)) // "T"

twosday.formatted(Date.FormatStyle().weekday(.abbreviated)) // "Tue"
twosday.formatted(Date.FormatStyle().weekday(.twoDigits)) // "3"
twosday.formatted(Date.FormatStyle().weekday(.short)) // "Tu"
twosday.formatted(Date.FormatStyle().weekday(.oneDigit)) // "3"
twosday.formatted(Date.FormatStyle().weekday(.wide)) // "Tuesday"
twosday.formatted(Date.FormatStyle().weekday(.narrow)) // "T"
```

### Year

```
twosday.formatted(.dateTime.year(.twoDigits)) // "22"
twosday.formatted(.dateTime.year(.defaultDigits)) // "2022"
twosday.formatted(.dateTime.year(.extended())) // "22"
twosday.formatted(.dateTime.year(.extended(minimumLength: 2))) // "2022"
twosday.formatted(.dateTime.year(.padded(10))) // "0000002022"
twosday.formatted(.dateTime.year(.relatedGregorian())) // "2022"
twosday.formatted(.dateTime.year(.relatedGregorian(minimumLength: 2))) // "22"

twosday.formatted(Date.FormatStyle().year(.twoDigits)) // "22"
twosday.formatted(Date.FormatStyle().year(.defaultDigits)) // "2022"
twosday.formatted(Date.FormatStyle().year(.extended())) // "22"
twosday.formatted(Date.FormatStyle().year(.extended(minimumLength: 2))) // "2022"
twosday.formatted(Date.FormatStyle().year(.padded(10))) // "0000002022"
twosday.formatted(Date.FormatStyle().year(.relatedGregorian())) // "2022"
twosday.formatted(Date.FormatStyle().year(.relatedGregorian(minimumLength: 2))) // "22"
```

## Setting the Locale

You can set the Locale by appending the `.locale()` method onto the last Symbol.

```
twosday.formatted(.dateTime.locale(Locale(identifier: "fr_FR"))) // "22/02/2022 à 2:22"
twosday.formatted(Date.FormatStyle().locale(Locale(identifier: "fr_FR"))) // "22/02/2022 à 2:22"
```

<h3>Attributed String Output</h3>

You can output an `AttributedString` by appending the `attributed` method onto the last symbol.

```
twosday.formatted(.dateTime.attributed)
twosday.formatted(Date.FormatStyle().attributed)
``` 

## Parsing Dates From Strings

`Date.FormatStyle` conforms to `ParseableFormatStyle` and can be set up to parse `Date` objects from a `String`.

```
try? Date.FormatStyle()
    .day()
    .month()
    .year()
    .hour()
    .minute()
    .second()
    .parse("Feb 22, 2022, 2:22:22 AM") // Feb 22, 2022, 2:22:22 AM

try? Date.FormatStyle()
    .day()
    .month()
    .year()
    .hour()
    .minute()
    .second()
    .parseStrategy.parse("Feb 22, 2022, 2:22:22 AM") // Feb 22, 2022, 2:22:22 AM

try? Date(
    "Feb 22, 2022, 2:22:22 AM",
    strategy: Date.FormatStyle().day().month().year().hour().minute().second().parseStrategy
) // Feb 22, 2022 at 2:22 AM

```