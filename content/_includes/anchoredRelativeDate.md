---
sitemap_ignore: true
---
### How It Works

The standard `Date.RelativeFormatStyle` always measures the distance between a date and the current moment. Every time you call `format`, "now" has changed. The anchored variant flips this around: you set a fixed **anchor date** at initialization, and then the date you pass into `format` becomes the reference point.

This means the output is entirely deterministic. Given the same anchor and the same input, you'll always get the same string back. This makes it a great fit for unit tests, SwiftUI previews, or any situation where you need stable, reproducible output.

``` swift
// Calendar.date only returns nil for mismatched calendars
let anchorDate = Calendar.current.date(byAdding: .day, value: -3, to: Date.now)!

let style = Date.AnchoredRelativeFormatStyle(anchor: anchorDate)

style.format(Date.now) // "3 days ago"
```

In the example above, the anchor is 3 days in the past. When you pass in `Date.now` as the reference point, the formatter tells you the anchor was "3 days ago" from that perspective.

{{< hint type=note >}}
Unlike `Date.RelativeFormatStyle`, there is no public `FormatStyle` extension for the anchored variant. This means you can't use it with the `.formatted()` convenience method on `Date`. You'll always need to create the style yourself and call `format()` directly.
{{< /hint >}}

### Available Options

The anchored style shares the same `presentation` and `unitsStyle` options as the standard relative format style.

| Presentation Style | Description                                                                                            |
|--------------------|--------------------------------------------------------------------------------------------------------|
| `.numeric`         | Uses a numeric description, such as "1 day ago" or "in 3 weeks". This is the default.                 |
| `.named`           | Uses named descriptions when available, such as "yesterday", "last week", or "next week".              |

| Unit Style     | Description                                                             |
|----------------|-------------------------------------------------------------------------|
| `.abbreviated` | Abbreviated units, such as "2 mos ago".                                 |
| `.narrow`      | The shortest units, such as "2 mos ago".                                |
| `.spellOut`    | Spelled out numbers, such as "two months ago".                          |
| `.wide`        | Full representation of units, such as "2 months ago". This is the default. |

``` swift
// Calendar.date only returns nil for mismatched calendars
let anchorDate = Calendar.current.date(byAdding: .day, value: -14, to: Date.now)!
let now = Date.now

let style = Date.AnchoredRelativeFormatStyle(anchor: anchorDate)

Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .numeric, unitsStyle: .abbreviated).format(now) // "2 wks ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .numeric, unitsStyle: .narrow).format(now) // "2 wks ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .numeric, unitsStyle: .spellOut).format(now) // "two weeks ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .numeric, unitsStyle: .wide).format(now) // "2 weeks ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .named, unitsStyle: .abbreviated).format(now) // "2 wks ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .named, unitsStyle: .narrow).format(now) // "2 wks ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .named, unitsStyle: .spellOut).format(now) // "two weeks ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .named, unitsStyle: .wide).format(now) // "2 weeks ago"
```

### Restricting the Displayed Units

Unlike the standard relative style, the anchored variant lets you control which calendar units the formatter is allowed to choose from by passing an `allowedFields` set. The formatter still picks a single best unit, but you decide which ones are on the table.

``` swift
// Calendar.date only returns nil for mismatched calendars
let anchorDate = Calendar.current.date(byAdding: .hour, value: -49, to: Date.now)!
let now = Date.now

Date.AnchoredRelativeFormatStyle(anchor: anchorDate).format(now)                                // "2 days ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, allowedFields: [.hour]).format(now)         // "49 hours ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, allowedFields: [.minute]).format(now)       // "2,940 minutes ago"
Date.AnchoredRelativeFormatStyle(anchor: anchorDate, allowedFields: [.day, .hour]).format(now)   // "2 days ago"
```

When multiple fields are allowed, the formatter picks the largest applicable unit. By narrowing the set, you can force it to express the distance in a smaller unit.

The available fields are: `.year`, `.month`, `.week`, `.day`, `.hour`, `.minute`, and `.second`.

### Setting the Locale & Calendar

You can set the locale by calling `.locale()` on an existing style.

``` swift
let franceLocale = Locale(identifier: "fr_FR")
// Calendar.date only returns nil for mismatched calendars
let anchorDate = Calendar.current.date(byAdding: .day, value: -14, to: Date.now)!

let style = Date.AnchoredRelativeFormatStyle(anchor: anchorDate, presentation: .named, unitsStyle: .spellOut)
style.locale(franceLocale).format(Date.now) // "il y a deux semaines"
```

The calendar can be set directly through the initializer.

``` swift
let anchoredInFrench = Date.AnchoredRelativeFormatStyle(
    // Calendar.date only returns nil for mismatched calendars
    anchor: Calendar.current.date(byAdding: .day, value: -14, to: Date.now)!,
    presentation: .named,
    unitsStyle: .spellOut,
    locale: Locale(identifier: "fr_FR"),
    calendar: Calendar(identifier: .gregorian),
    capitalizationContext: .beginningOfSentence
)

anchoredInFrench.format(Date.now) // "Il y a deux semaines"
```
