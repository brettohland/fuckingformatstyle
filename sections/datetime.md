---
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
```

The symbols can be chained together to mix and match your desired string.

```
twosday.formatted(.dateTime.year().month().day().hour().minute().second()) // "Feb 22, 2022, 2:22:22 AM"
twosday.formatted(.dateTime.second().minute().hour().day().month().year()) // "Feb 22, 2022, 2:22:22 AM"
````

{{< hint type=important >}}

The order of the symbols in the final string are controlled by the date's `Locale` and not the order that they are called.

{{< /hint >}}

### Customization

Each symbol has customization options.

#### Day

```
twosday.formatted(.dateTime.day(.twoDigits)) // "22"
twosday.formatted(.dateTime.day(.ordinalOfDayInMonth)) // "4"
twosday.formatted(.dateTime.day(.defaultDigits)) // "22"
````

#### Day of Year

```
twosday.formatted(.dateTime.dayOfYear(.defaultDigits)) // "53"
twosday.formatted(.dateTime.dayOfYear(.threeDigits)) // "053"
twosday.formatted(.dateTime.dayOfYear(.twoDigits)) // "53"
````
#### Era

```
twosday.formatted(.dateTime.era(.abbreviated)) // "AD"
twosday.formatted(.dateTime.era(.narrow)) // "A"
twosday.formatted(.dateTime.era(.wide)) // "Anno Domini"
````

#### Hour

Each of the following methods accepts an `AMPMStyle`

| `AMPMStyle` | Description |
| omitted | Hides the day period marker (AM/PM). <br>For example, `8` (for 8 in the morning), `1` (for 1 in the afternoon) if used with `defaultDigits`. <br>Or `08`, `01` if used with `twoDigits`.|
| narrow | Narrow day period if the locale prefers using day period with hour. <br>For example, `8`, `8a`, `13`, `1p` if used with `defaultDigits`. <br>Or `08`, `08a`, `13`, `01p` if used with `twoDigits`.|
| abbreviated | Abbreviated day period if the locale prefers using day period with hour. <br>For example, `8`, `8 AM`, `13`, `1 PM` if used with `defaultDigits`. <br>Or `08`, `08 AM`, `13`, `01 PM` if used with `twoDigits`.|
| wide | Wide day period if the locale prefers using day period with hour. <br>For example, `8`, `8 A.M.`, `13`, `1 P.M.` if used with `defaultDigits`. <br>Or, `08`, `08 A.M.`, `13`, `01 P.M.` if used with `twoDigits`. |

| Option | Description |
| -- | --- |
| defaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) | The preferred numeric hour format for the locale with minimum digits. Whether the period symbol (AM/PM) will be shown depends on the locale. |
| twoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) | The preferred two-digit hour format for the locale, zero padded if necessary. Whether the period symbol (AM/PM) will be shown depends on the locale. |
| conversationalDefaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) |Behaves like `defaultDigits`: the preferred numeric hour format for the locale with minimum digits. May also use conversational period formats. |
| conversationalTwoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) | Behaves like `twoDigits`: two-digit hour format for the locale, zero padded if necessary. May also use conversational period formats. |

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
````

#### Minute

```
twosday.formatted(.dateTime.minute(.twoDigits)) // "22"
twosday.formatted(.dateTime.minute(.defaultDigits)) // "22"
````

#### Month

```
twosday.formatted(.dateTime.month(.defaultDigits)) // "2"
twosday.formatted(.dateTime.month(.twoDigits)) // "02"
twosday.formatted(.dateTime.month(.wide)) // "February"
twosday.formatted(.dateTime.month(.abbreviated)) // "Feb"
twosday.formatted(.dateTime.month(.narrow)) // "F"
````

#### Quarter

```
twosday.formatted(.dateTime.quarter(.narrow)) // "1"
twosday.formatted(.dateTime.quarter(.abbreviated)) // "Q1"
twosday.formatted(.dateTime.quarter(.wide)) // "1st quarter"
twosday.formatted(.dateTime.quarter(.twoDigits)) // "01"
twosday.formatted(.dateTime.quarter(.oneDigit)) // "1"
````

#### Second

```
twosday.formatted(.dateTime.second(.twoDigits)) // "22"
twosday.formatted(.dateTime.second(.defaultDigits)) // "22"
````

#### Second Fraction

```
twosday.formatted(.dateTime.secondFraction(.fractional(2))) // "00"
twosday.formatted(.dateTime.secondFraction(.milliseconds(1))) // "8542000"
```

#### Time Zone

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
````

#### Week

```
twosday.formatted(.dateTime.week(.defaultDigits)) // "9"
twosday.formatted(.dateTime.week(.twoDigits)) // "09"
twosday.formatted(.dateTime.week(.weekOfMonth)) // "9"
````

#### Weekday

```
twosday.formatted(.dateTime.weekday(.abbreviated)) // "Tue"
twosday.formatted(.dateTime.weekday(.twoDigits)) // "3"
twosday.formatted(.dateTime.weekday(.short)) // "Tu"
twosday.formatted(.dateTime.weekday(.oneDigit)) // "3"
twosday.formatted(.dateTime.weekday(.wide)) // "Tuesday"
twosday.formatted(.dateTime.weekday(.narrow)) // "T"
````

#### Year

```
twosday.formatted(.dateTime.year(.twoDigits)) // "22"
twosday.formatted(.dateTime.year(.defaultDigits)) // "2022"
twosday.formatted(.dateTime.year(.extended())) // "22"
twosday.formatted(.dateTime.year(.extended(minimumLength: 2))) // "2022"
twosday.formatted(.dateTime.year(.padded(10))) // "0000002022"
twosday.formatted(.dateTime.year(.relatedGregorian())) // "2022"
twosday.formatted(.dateTime.year(.relatedGregorian(minimumLength: 2))) // "22"
```

### Setting the Locale

You can set the Locale by appending the `.locale()` method onto the last Symbol.

```
let franceLocale = Locale(identifier: "fr_FR")
twosday.formatted(.dateTime.year().month().day().hour().minute().second().locale(franceLocale)) // "22 févr. 2022 à 02:22:22"
```

<h3>Attributed String Output</h3>

You can output an `AttributedString` by appending the `attributed` method onto the last symbol.

```
twosday.formatted(.dateTime.hour().minute().attributed)
``` 