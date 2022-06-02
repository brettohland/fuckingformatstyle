---
---
### Available Options

There are two sets of options available, the presentation style and the units style.

| Presentation Style | Description                                                                                                  |
| ------------------ | ------------------------------------------------------------------------------------------------------------ |
| `.numeric`         | A style that uses a numeric style to describe relative dates, such as “1 day ago” or “in 3 weeks”.           |
| `.named`           | A style that uses named styles to describe relative dates, such as “yesterday”, “last week”, or “next week”. |

| Unit Style     | Description                                                             |
| -------------- | ----------------------------------------------------------------------- |
| `.abbreviated` | A style that uses abbreviated units, such as “2 mo. ago”.               |
| `.narrow`      | A style that uses the shortest units, such as “2 mo. ago”.              |
| `.spellOut`    | A style that spells out units, such as “two months ago”.                |
| `.wide`        | A style that uses full representation of units, such as “2 months ago”. |

```
let thePast = Calendar(identifier: .gregorian).date(byAdding: .day, value: -14, to: Date())!

thePast.formatted(.relative(presentation: .numeric, unitsStyle: .abbreviated)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .numeric, unitsStyle: .narrow)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .numeric, unitsStyle: .spellOut)) // "two weeks ago"
thePast.formatted(.relative(presentation: .numeric, unitsStyle: .wide)) // "2 weeks ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .abbreviated)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .narrow)) // "2 wk. ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .spellOut)) // "two weeks ago"
thePast.formatted(.relative(presentation: .named, unitsStyle: .wide)) // "2 weeks ago"
```

### Setting the Locale & Calendar

The locale can be set by appending the `.locale()` method at the end of your `.formatted()` method call.

```
let franceLocale = Locale(identifier: "fr_FR")
thePast.formatted(.relative(presentation: .named, unitsStyle: .spellOut).locale(franceLocale)) // "il y a deux semaines"
```

The calendar can only be set by initializing a new instance of the `Date.RelativeFormatStyle` struct.

```
let relativeInFrench = Date.RelativeFormatStyle(
    presentation: .named,
    unitsStyle: .spellOut,
    locale: Locale(identifier: "fr_FR"),
    calendar: Calendar(identifier: .gregorian),
    capitalizationContext: .beginningOfSentence
)

thePast.formatted(relativeInFrench) // "Il y a deux semaines"
relativeInFrench.format(thePast) // "Il y a deux semaines"
```

You can easily re-use and access this custom format style by extending `FormatStyle`.

```
struct InFrench: FormatStyle {
    typealias FormatInput = Date
    typealias FormatOutput = String

    static let relativeInFrench = Date.RelativeFormatStyle(
        presentation: .named,
        unitsStyle: .spellOut,
        locale: Locale(identifier: "fr_FR"),
        calendar: Calendar(identifier: .gregorian),
        capitalizationContext: .beginningOfSentence
    )

    func format(_ value: Date) -> String {
        InFrench.relativeInFrench.format(value)
    }
}

extension FormatStyle where Self == InFrench {
    static var inFrench: InFrench { .init() }
}

thePast.formatted(.inFrench) // "Il y a deux semaines"
```