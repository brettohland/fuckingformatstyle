---
sitemap_ignore: true
---
### Format Strings

The `Date.VerbatimFormatStyle` accepts a `Date.FormatString` as a parameter inside of it's initializer. Inside of which, you can include any of symbol tokens (with options) along with other regular characters.

```
let twosdayDateComponents = DateComponents(
    year: 2022,
    month: 2,
    day: 22,
    hour: 2,
    minute: 22,
    second: 22,
    nanosecond: 22
)
let twosday = Calendar(identifier: .gregorian).date(from: twosdayDateComponents)!

let verbatim = Date.VerbatimFormatStyle(
    format: "\(hour: .twoDigits(clock: .twentyFourHour, hourCycle: .oneBased)):\(minute: .twoDigits)",
    timeZone: TimeZone.current,
    calendar: .current
)

verbatim.format(twosday) // "02:22"
```

### Symbol Tokens

Similar to the `.dateTime` you have a wide variety of symbols and customization options.

{{< hint type=note >}}

Oddly enough, each of these options are thoroughly documented by Apple (this is where the following content comes from) in their header files. Unfortunately, none of this documentation has been added to the official docs online and within Xcode.

{{< /hint >}}


#### Era

| Option         | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| `.abbreviated` | Abbreviated Era name. For example, "AD", "Reiwa", "令和".   |
| `.wide`        | Wide era name. For example, "Anno Domini", "Reiwa", "令和". |
| `.narrow`      | Narrow era name. For example, For example, "A", "R", "R".   |

#### Year

| Option                              | Description                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.defaultDigits`                    | Minimum number of digits that shows the full year. For example, `2`, `20`, `201`, `2017`, `20173`.                                                                                                                                                                                                                                                                              |
| `.twoDigits`                        | Two low-order digits. Padded or truncated if necessary. For example, `02`, `20`, `01`, `17`, `73`.                                                                                                                                                                                                                                                                              |
| `.padded(_ length: Int)`            | Three or more digits. Padded if necessary. For example, `002`, `020`, `201`, `2017`, `20173`.                                                                                                                                                                                                                                                                                   |
| `.relatedGregorian(minimumLength:)` | Related Gregorian year. For non-Gregorian calendars, this corresponds to the extended Gregorian year in which the calendar’s year begins. Related Gregorian years are often displayed, for example, when formatting dates in the Japanese calendar — e.g. "2012(平成24)年1月15日" — or in the Chinese calendar — e.g. "2012壬辰年腊月初四".                                     |
| `.extended(minimumLength:)`         | Extended year. This is a single number designating the year of this calendar system, encompassing all supra-year fields. For example, for the Julian calendar system, year numbers are positive, with an era of BCE or CE. An extended year value for the Julian calendar system assigns positive values to CE years and negative values to BCE years, with 1 BCE being year 0. |

#### YearForWeekOfYear

| Option                   | Description                                                                                                                          |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------ |
| `.defaultDigits`         | Minimum number of digits that shows the full year in "Week of Year"-based calendars. For example, `2`, `20`, `201`, `2017`, `20173`. |
| `.twoDigits`             | Two low-order digits.  Padded or truncated if necessary. For example, `02`, `20`, `01`, `17`, `73`.                                  |
| `.padded(_ length: Int)` | Three or more digits. Padded if necessary. For example, `002`, `020`, `201`, `2017`, `20173`.                                        |

#### CyclicYear

Calendars such as the Chinese lunar calendar (and related calendars) and the Hindu calendars use 60-year cycles of year names. If the calendar does not provide cyclic year name data, or if the year value to be formatted is out of the range of years for which cyclic name data is provided, then numeric formatting is used (behaves like `Year`).

| Option         | Description                                        |
| -------------- | -------------------------------------------------- |
| `.abbreviated` | Abbreviated cyclic year name. For example, "甲子". |
| `.wide`        | Wide cyclic year name. For example, "甲子".        |
| `.narrow`      | Narrow cyclic year name. For example, "甲子".      |
    

#### Quarter

| Option         | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| `.oneDigit`    | Numeric: one digit quarter. For example `2`.                |
| `.twoDigits`   | Numeric: two digits with zero padding. For example `02`.    |
| `.abbreviated` | Abbreviated quarter. For example `Q2`.                      |
| `.wide`        | The quarter spelled out in full, for example `2nd quarter`. |
| `.narrow`      | Narrow quarter. For example `2`.                            |


#### Month

| Option           | Description                                                                                                                                 |     |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | --- |
| `.defaultDigits` | Minimum number of digits that shows the numeric month. Intended to be used in conjunction with `Day.defaultDigits`. For example, `9`, `12`. |     |
| `.twoDigits`     | 2 digits, zero pad if needed. For example, `09`, `12`.                                                                                      |     |
| `.abbreviated`   | Abbreviated month name. For example, "Sep".                                                                                                 |     |
| `.wide`          | Wide month name. For example, "September".                                                                                                  | ``  |
| `.narrow`        | Narrow month name. For example, "S".                                                                                                        |     |
    
#### Week

Week symbols. Use with `YearForWeekOfYear` for the year field instead of `Year`.

| Option           | Description                                                                        |
| ---------------- | ---------------------------------------------------------------------------------- |
| `.defaultDigits` | Numeric week of year. For example, `8`, `27`.                                      |
| `.twoDigits`     | Two-digit numeric week of year, zero padded as necessary. For example, `08`, `27`. |
| `.weekOfMonth`   | One-digit numeric week of month, starting from 1. For example, `1`.                |

#### Day

| Option                           | Description                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| -------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.defaultDigits`                 | Minimum number of digits that shows the full numeric day of month. For example, `1`, `18`.                                                                                                                                                                                                                                                                                                                                                   |
| `.twoDigits`                     | Two-digit, zero-padded if necessary. For example, `01`, `18`.                                                                                                                                                                                                                                                                                                                                                                                |
| `.ordinalOfDayInMonth`           | Ordinal of day in month. For example, the 2nd Wed in July would yield `2`.                                                                                                                                                                                                                                                                                                                                                                   |
| `.ulianModified(minimumLength:)` | The field length specifies the minimum number of digits, with zero-padding as necessary. <br> This is different from the conventional Julian day number in two regards. First, it demarcates days at local zone midnight, rather than noon GMT. Second, it is a local number; that is, it depends on the local time zone. It can be thought of as a single number that encompasses all the date-related fields. <br> For example, `2451334`. |

    
#### DayOfYear

| Option           | Description                                                                                      |
| ---------------- | ------------------------------------------------------------------------------------------------ |
| `.defaultDigits` | Minimum number of digits that shows the full numeric day of year. For example, `7`, `33`, `345`. |
| `.twoDigits`     | Two-digit day of year, with zero-padding as necessary. For example, `07`, `33`, `345`.           |
| `.threeDigits`   | Three-digit day of year, with zero-padding as necessary. For example, `007`, `033`, `345`.       |
    

#### Weekday

| Option         | Description                                                                             |
| -------------- | --------------------------------------------------------------------------------------- |
| `.abbreviated` | Abbreviated day of week name. For example, "Tue".                                       |
| `.wide`        | Wide day of week name. For example, "Tuesday".                                          |
| `.narrow`      | Narrow day of week name. For example, "T".                                              |
| `.short`       | Short day of week name. For example, "Tu".                                              |
| `.oneDigit`    | Local day of week number/name. The value depends on the local starting day of the week. |
| `.twoDigits`   | Local day of week number/name, format style; two digits, zero-padded if necessary.      |
    
#### DayPeriod

The time period (for example, "a.m." or "p.m."). May be upper or lower case depending on the locale and other options.

Each of the options can be passed a `width` case.

- abbreviated
- wide
- narrow

| Option                | Description                                                                                                                                                                           |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.standard(_ width:)` | Standard day period. For example, <br> Abbreviated: `12 am.`<br> Wide: `12 am`<br> Narrow: `12a`.                                                                                     |
| `.with12s(_ width:)`  | Day period including designations for noon and midnight. For example, <br>Abbreviated: `mid`<br>Wide: `midnight`<br>Narrow: `md`.<br>                                                 |
| `.conversational`     | Conversational day period. For example,<br>Abbreviated: `at night`, `nachm.`, `ip.`<br>Wide: `at night`, `nachmittags`, `iltapäivällä`.<br>Narrow: `at night`, `nachm.`, `iltap`.<br> |

#### Minute

| Option           | Description                                                                                |
| ---------------- | ------------------------------------------------------------------------------------------ |
| `.defaultDigits` | Minimum digits to show the numeric minute. Truncated, not rounded. For example, `8`, `59`. |
| `.twoDigits`     | Two-digit numeric, zero padded if needed. For example, `08`, `59`.                         |
    

#### Second

| Option           | Description                                                                                |
| ---------------- | ------------------------------------------------------------------------------------------ |
| `.defaultDigits` | Minimum digits to show the numeric second. Truncated, not rounded. For example, `8`, `12`. |
| `.twoDigits`     | Two digits numeric, zero padded if needed, not rounded. For example, `08`, `12`.           |
    

#### SecondFraction

| Option                  | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| ----------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `.fractional(_ val:)`   | Fractional second (numeric).<br>Truncates, like other numeric time fields, but in this case to the number of digits specified by the associated `Int`.<br>For example, specifying `4` for seconds value `12.34567` yields `12.3456`.                                                                                                                                                                                                                                                                                                                                     |
| `.milliseconds(_ val:)` | Milliseconds in day (numeric).<br>The associated `Int` specifies the minimum number of digits, with zero-padding as necessary. The maximum number of digits is 9.<br> This field behaves exactly like a composite of all time-related fields, not including the zone fields. As such, it also reflects discontinuities of those fields on DST transition days. On a day of DST onset, it will jump forward. On a day of DST cessation, it will jump backward. This reflects the fact that is must be combined with the offset field to obtain a unique local time value. |

#### TimeZone

Each talkes a `Width` case.

- `short`
- `long`

| Option                    | Description                                                                                                                                                                                                              |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `.specificName(_ width:)` | Specific non-location format. Falls back to `shortLocalizedGMT` if unavailable. For example, <br>short: "PDT" <br>long: "Pacific Daylight Time".                                                                         |
| `.genericName(_ width:)`  | Generic non-location format. Falls back to `genericLocation` if unavailable. For example, <br>short: "PT". Fallback again to `localizedGMT(.short)` if `genericLocation(.short)` is unavaiable. <br>long: "Pacific Time" |
| `.localizedGMT(_ width:)` | Short localized GMT format. For example, <br>short: "GMT-8" <br>long: "GMT-8:00"                                                                                                                                         |
| `.identifier(_ width:)`   | The time zone ID. For example, <br>short: "uslax" <br>long: "America/Los_Angeles".                                                                                                                                       |
| `.exemplarLocation`       | The exemplar city (location) for the time zone. The localized exemplar city name for the special zone or unknown is used as the fallback if it is unavailable. <br>For example, "Los Angeles".                           |
| `.genericLocation`        | The generic location format. Falls back to `longLocalizedGMT` if unavailable. Recommends for presenting possible time zone choices for user selection. <br>For example, "Los Angeles Time".                              |

#### StandaloneQuarter

| Option         | Description                                                                            |
| -------------- | -------------------------------------------------------------------------------------- |
| `.oneDigit`    | Standalone one-digit numeric quarter. For example `2`.                                 |
| `.twoDigits`   | Two-digit standalone numeric quarter with zero padding if necessary, for example `02`. |
| `.abbreviated` | Standalone abbreviated quarter. For example `Q2`.                                      |
| `.wide`        | Standalone wide quarter. For example "2nd quarter".                                    |
| `.narrow`      | Standalone narrow quarter. For example "2".                                            |
    

#### StandaloneMonth

| Option           | Description                                                                                                        |
| ---------------- | ------------------------------------------------------------------------------------------------------------------ |
| `.defaultDigits` | Stand-alone minimum digits numeric month. Number/name (intended to be used without `Day`). For example, `9`, `12`. |
| `.twoDigits`     | Stand-alone two-digit numeric month. Two digits, zero pad if needed. For example, `09`, `12`.                      |
| `.abbreviated`   | Stand-alone abbreviated month.For example, "Sep".                                                                  |
| `.wide`          | Stand-alone wide month. For example, "September".                                                                  |
| `.narrow`        | Stand-alone narrow month. For example, "S".                                                                        |
    
#### StandaloneWeekday

| Option         | Description                                                           |
| -------------- | --------------------------------------------------------------------- |
| `.oneDigit`    | Standalone local day of week number/name.                             |
| `.abbreviated` | Standalone local day of week number/name. For example, "Tue".         |
| `.wide`        | Standalone wide local day of week number/name.For example, "Tuesday". |
| `.narrow`      | Standalone narrow local day of week number/name. For example, "T".    |
| `.short`       | Standalone short local day of week number/name. For example, "Tu".    |
    
#### VerbatimHour

Hour symbols that does not take users' preferences into account, and is displayed as-is.

Each accepts an `HourCycle` and a `Clock`.

| `.HourCycle` | Description                                                                                |
| ------------ | ------------------------------------------------------------------------------------------ |
| `.zeroBased` | The hour ranges from 0 to 11 in a 12-hour clock. Ranges from 0 to 23 in a 24-hour clock.   |
| `.oneBased`  | The hour ranges from 1 to 12 in the 12-hour clock. Ranges from 1 to 24 in a 24-hour clock. |

| `.Clock`          | Description                                                                                                                                                                                                                    |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `.twelveHour`     | In a 12-hour clock system, the 24-hour day is divided into two periods, a.m. and p.m, and each period consists of 12 hours.<br>- Note: Does not include the period marker (AM/PM). Specify a `PeriodSymbol` if that's desired. |
| `.twentyFourHour` | In a 24-hour clock system, the day runs from midnight to midnight, dividing into 24 hours.<br>- Note: If using `twentyFourHour` together with `PeriodSymbol`, the period is ignored.                                           |

| Option                               | Description                                                                                                                                                                                                                                              |
| ------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.defaultDigits(clock:, hourCycle:)` | Minimum digits to show the numeric hour. For example, `1`, `12`.<br>Or `23` if using the `twentyFourHour` clock.<br>- Note: This format does not take user's locale preferences into account. Consider using `defaultDigits` if applicable.              |
| `.twoDigits(clock:, hourCycle:)`     | Numeric two-digit hour, zero padded if necessary.<br>For example, `01`, `12`.<br>Or `23` if using the `twentyFourHour` clock.<br>- Note: This format does not take user's locale preferences into account. Consider using `defaultDigits` if applicable. |
