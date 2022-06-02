---
---
 t```
let range = Date(timeIntervalSince1970: 0)..<Date(timeIntervalSinceReferenceDate: 2837)

range.formatted(.interval) // "12/31/69, 5:00 PM – 12/31/00, 5:47 PM"
```

### Setting the locale

You can customize the locale of the output by appending the `localized()` method onto the style.

```
let franceLocale = Locale(identifier: "fr_FR")
range.formatted(.interval.locale(franceLocale)) // "31/12/1969 à 17:00 – 31/12/2000 à 17:47"
```

### Customizing

The only way of customizing the output of the date, time, and calendar is to initialize a new instance of `Date.IntervalFormatStyle`.

| DateStyle      | Description                                                                               |
| -------------- | ----------------------------------------------------------------------------------------- |
| `.omitted`     | Excludes the date part.                                                                   |
| `.numeric`     | Shows date components in their numeric form. For example, "10/21/2015".                   | 
| `.abbreviated` | Shows date components in their abbreviated form if possible. For example, "Oct 21, 2015". |
| `.long`        | Shows date components in their long form if possible. For example, "October 21, 2015".    |
| `.complete`    | Shows the complete day. For example, "Wednesday, October 21, 2015".                       |

| TimeStyle    | Description                                    |
| ------------ | ---------------------------------------------- |
| `.omitted`   | Excludes the time part.                        |
| `.shortened` | For example, `04:29 PM`, `16:29`.              |
| `.standard`  | For example, `4:29:24 PM`, `16:29:24`.         |
| `.complete`  | For example, `4:29:24 PM PDT`, `16:29:24 GMT`. | 


```
struct NarrowIntervalStyle: FormatStyle {
    typealias FormatInput = Range<Date>
    typealias FormatOutput = String

    static let interval = Date.IntervalFormatStyle(
        date: .abbreviated,
        time: .shortened,
        locale: Locale(identifier: "en_US"),
        calendar: Calendar(identifier: .gregorian),
        timeZone: TimeZone(secondsFromGMT: 0)!
    )

    func format(_ value: Range<Date>) -> String {
        NarrowIntervalStyle.interval.format(value)
    }
}

extension FormatStyle where Self == NarrowIntervalStyle {
    static var narrowInterval: NarrowIntervalStyle { .init() }
}

range.formatted(.narrowInterval)
```

