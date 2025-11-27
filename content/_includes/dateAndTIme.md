---
sitemap_ignore: true
---
### DateStyle and TimeStyle

To customize the display, you have the option of including a `DateStyle` or a `TimeStyle` parameter.

| DateStyle Option | Description                                                     |
|------------------|-----------------------------------------------------------------|
| `.omitted`       | Omits the date from display                                     |
| `.numeric`       | Displays the date components as numbers                         |
| `.abbreviated`   | Displays the year, month, and numerical day. Month is shortened |
| `.long`          | Displays the year, month, and numerical day. Month is in full   |
| `.complete`      | Displays the year, month, weedkay, and numberical day in full   |

| TimeStyle Option | Description                                        |
|------------------|----------------------------------------------------|
| `.complete`      | Shows the hour, minute, second, and time zone      |
| `.shortened`     | Shortened hour, minute, and second for your locale |
| `.omitted`       | Omits the time from display                        |

``` swift
twosday.formatted(date: .abbreviated, time: .omitted) // "Feb 22, 2022"
twosday.formatted(date: .complete, time: .omitted) // "Tuesday, February 22, 2022"
twosday.formatted(date: .long, time: .omitted) // "February 22, 2022"
twosday.formatted(date: .numeric, time: .omitted) // "2/22/2022"

twosday.formatted(date: .omitted, time: .complete) // "2:22:22 AM MST"
twosday.formatted(date: .omitted, time: .shortened) // "2:22 AM"
twosday.formatted(date: .omitted, time: .standard) // "2:22:22 AM"

twosday.formatted(date: .abbreviated, time: .complete) // "Feb 22, 2022, 2:22:22 AM MST"
twosday.formatted(date: .abbreviated, time: .shortened) // "Feb 22, 2022, 2:22 AM"
twosday.formatted(date: .abbreviated, time: .standard) // "Feb 22, 2022, 2:22:22 AM"
twosday.formatted(date: .complete, time: .complete) // "Tuesday, February 22, 2022, 2:22:22 AM MST"
twosday.formatted(date: .complete, time: .shortened) // "Tuesday, February 22, 2022, 2:22 AM"
twosday.formatted(date: .complete, time: .standard) // "Tuesday, February 22, 2022, 2:22:22 AM"
twosday.formatted(date: .long, time: .complete) // "February 22, 2022, 2:22:22 AM MST"
twosday.formatted(date: .long, time: .shortened) // "February 22, 2022, 2:22 AM"
twosday.formatted(date: .long, time: .standard) // "February 22, 2022, 2:22:22 AM"
twosday.formatted(date: .numeric, time: .complete) // "2/22/2022, 2:22:22 AM MST"
twosday.formatted(date: .numeric, time: .shortened) // "2/22/2022, 2:22 AM"
twosday.formatted(date: .numeric, time: .standard) // "2/22/2022, 2:22:22 AM"
```

### Setting the Locale & Calendar

In order to set the Locale and Calendar of the output string, you need to initialize an instance of `Date.FormatStyle`.

``` swift
let frenchHebrew = Date.FormatStyle(
    date: .complete,
    time: .complete,
    locale: Locale(identifier: "fr_FR"),
    calendar: Calendar(identifier: .hebrew),
    timeZone: TimeZone(secondsFromGMT: 0)!,
    capitalizationContext: .standalone
)

twosday.formatted(frenchHebrew) // "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"
frenchHebrew.format(twosday) // "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"
```

You can also extend the `FormatStyle` protocol as a way of simplifying access to your new custom `Date.FormatStyle`

``` swift
struct FrenchHebrewStyle: FormatStyle {
    typealias FormatInput = Date
    typealias FormatOutput = String

    static let frenchHebrew = Date.FormatStyle(
        date: .complete,
        time: .complete,
        locale: Locale(identifier: "fr_FR"),
        calendar: Calendar(identifier: .hebrew),
        timeZone: TimeZone(secondsFromGMT: 0)!,
        capitalizationContext: .standalone
    )

    func format(_ value: Date) -> String {
        FrenchHebrewStyle.frenchHebrew.format(value)
    }
}

extension FormatStyle where Self == FrenchHebrewStyle {
    static var frenchHebrew: FrenchHebrewStyle { .init() }
}

twosday.formatted(.frenchHebrew) // "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"
```

### Localizing Number Systems

In cases where a given `Locale` has multiple number systems available, numeric format styles will default to using the number system which matches the your system's `Locale.current` value. You're able to explicitly set the number system for the Format Style to use by initializing a new `Locale` with the number system set using the BCP-47 or ICU Identifiers:

#### ICU

``` swift
// Without
let defaultHebrew = Locale(identifier: "he")
Date.now.formatted(.dateTime.year().month().day().locale(defaultHebrew)) // "23 בספט׳ 2023"

// With
let hebrew = Locale(identifier: "he@numbers=hebr;calendar=hebrew")
Date.now.formatted(.dateTime.year().month().day().locale(hebrew)) // "כ״ג בספט׳ ב׳כ״ג"
```