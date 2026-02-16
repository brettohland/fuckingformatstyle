---
sitemap_ignore: true
---
### Available Options

You have the ability to set the style of the output

| Type Option | Description                                      |
|-------------|--------------------------------------------------|
| `.and`      | Appends a localized "and" to the end of the list |
| `.or`       | Appends a localized "or" to the end of the list  |

| Width Option | Description                                                         |
|--------------|---------------------------------------------------------------------|
| `.standard`  | The standard default, uses the full localized word.                 |
| `.short`     | Uses a narrow version of the word. For example "&" instead of "and" |
| `.narrow`    | Uses the least number of characters possible for the word. For example, omitting the word entirely. |

``` swift
letters.formatted(.list(type: .and, width: .narrow))   // "a, b, c, d"
letters.formatted(.list(type: .and, width: .standard)) // "a, b, c, and d"
letters.formatted(.list(type: .and, width: .short))    // "a, b, c, & d"

letters.formatted(.list(type: .or, width: .narrow))   // "a, b, c, or d"
letters.formatted(.list(type: .or, width: .standard)) // "a, b, c, or d"
letters.formatted(.list(type: .or, width: .short))    // "a, b, c, or d"
```

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

``` swift
let franceLocale = Locale(identifier: "fr_FR")

letters.formatted(.list(type: .and).locale(franceLocale)) // "a, b, c, et d"
letters.formatted(.list(type: .or).locale(franceLocale))  // "a, b, c, ou d"

letters.formatted(.list(type: .and, width: .narrow).locale(franceLocale))   // "a, b, c, d"
letters.formatted(.list(type: .and, width: .standard).locale(franceLocale)) // "a, b, c, et d"
letters.formatted(.list(type: .and, width: .short).locale(franceLocale))    // "a, b, c, et d"

letters.formatted(.list(type: .or, width: .narrow).locale(franceLocale))   // "a, b, c, ou d"
letters.formatted(.list(type: .or, width: .standard).locale(franceLocale)) // "a, b, c, ou d"
letters.formatted(.list(type: .or, width: .short).locale(franceLocale))    // "a, b, c, ou d"
```

### Customizing Item Display

In the case of more complex, or custom values in the array, you can pass in another Format Style that will format all items in the list.

For example, you can use any of the date format styles when dealing with an array of Dates.

``` swift
let importantDates = [
    Date(timeIntervalSinceReferenceDate: 0), // January 1, 2001
    Date(timeIntervalSince1970: 0)           // January 1, 1970
]
let yearOnlyFormat = Date.FormatStyle().year()

importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and)) // "2001 and 1970"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or))  // "2001 or 1970"

importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and, width: .standard)) // "2001 and 1970"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and, width: .narrow))   // "2001, 1970"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .and, width: .short))    // "2001 & 1970"

importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or, width: .standard)) // "2001 or 1970"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or, width: .narrow))   // "2001 or 1970"
importantDates.formatted(.list(memberStyle: yearOnlyFormat, type: .or, width: .short))    // "2001 or 1970"

let yearStyle = ListFormatStyle<Date.FormatStyle, Array<Date>>.init(memberStyle: .dateTime.year())
importantDates.formatted(yearStyle)
```

{{< hint type=tip >}}

The `memberStyle:` parameter accepts any `FormatStyle` value. This means that you can fully customize how each item within the list is formatted for display by using the options outlined throughout the rest of this site.

{{</hint>}}