---
sitemap_ignore: true
---
### Available fields

- `day`
- `hour`
- `minute`
- `month`
- `second`
- `week`
- `year`

### Available Styles

| Style Option         | Description                                                                                                                 |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------|
| wide                 | Shows the fields in their full spelling.<br>For example, "2 hour, 10 minutes", "2小時10分鐘"                                |
| abbreviated          | Shows the fields in the abbreviation. <br>For example, "2 hr, 10 min", "2小時10分鐘"                                        |
| condensedAbbreviated | Uses the abbreviated form but condensed if possible. <br> For example, "2hr 10min", "2小時10分鐘"                           |
| narrow               | Shows the fields in the shortest form possible. <br>For example, "2h 10m", "2時10分"                                        |
| spellOut             | Values are spelled out and fields are displayed in their full name.<br>For example, "two hours, ten minutes", "2小時10分鐘" |

``` swift
let testRange = Date(timeIntervalSince1970: 0) ..< Date(timeIntervalSinceReferenceDate: 0)

testRange.formatted(.components(style: .abbreviated, fields: [.day]))           // "11,323 days"
testRange.formatted(.components(style: .narrow, fields: [.day]))                // "11,323days"
testRange.formatted(.components(style: .wide, fields: [.day]))                  // "11,323 days"
testRange.formatted(.components(style: .spellOut, fields: [.day]))              // "eleven thousand three hundred twenty-three days"
testRange.formatted(.components(style: .condensedAbbreviated, fields: [.day]))  // "11,323d"
testRange.formatted(.components(style: .abbreviated, fields: [.year])
    .calendar(Calendar(identifier: .coptic))) // "31 yrs"

testRange.formatted(.components(style: .condensedAbbreviated, fields: [.day, .month, .year, .hour, .second, .week])) // "31y"

let appleReferenceDay = Date(timeIntervalSinceReferenceDate: 0)
let twosday = Calendar(identifier: .gregorian).date(from: twosdayDateComponents)!
let secondRange = appleReferenceDay .. <twosday

// 21 yrs, 1 mth, 3 wks, 9 hr, 1,342 sec
secondRange.formatted(.components(style: .abbreviated, fields: [.day, .month, .year, .hour, .second, .week]))

// 21yrs 1mth 3wks 9hr 1,342sec
secondRange.formatted(.components(style: .narrow, fields: [.day, .month, .year, .hour, .second, .week]))

// 21 years, 1 month, 3 weeks, 9 hours, 1,342 seconds
secondRange.formatted(.components(style: .wide, fields: [.day, .month, .year, .hour, .second, .week]))

// twenty-one years, one month, three weeks, nine hours, one thousand three hundred forty-two seconds
secondRange.formatted(.components(style: .spellOut, fields: [.day, .month, .year, .hour, .second, .week]))

// 21y 1mo 3w 9h 1,342s
secondRange.formatted(.components(style: .condensedAbbreviated, fields: [.day, .month, .year, .hour, .second, .week]))
```

### Locale

You can set the locale by appending the `locale()` method onto the end of the format style.

``` swift
let franceLocale = Locale(identifier: "fr_FR")
// vingt-et-un ans, un mois, trois semaines, neuf heures et mille trois cent quarante-deux secondes
secondRange.formatted(.components(style: .spellOut, fields: [.day, .month, .year, .hour, .second, .week]).locale(franceLocale))
```

### Fully Customizing & Setting Calendar

You can set the calendar by using the `Date.ComponentFormatStyle` initializer and using the resulting format style.

``` swift
let componentsFormat = Date.ComponentsFormatStyle(
    style: .wide,
    locale: Locale(identifier: "fr_FR"),
    calendar: Calendar(identifier: .gregorian),
    fields: [
        .day,
        .month,
        .year,
        .hour,
        .second,
        .week,
    ]
)

componentsFormat.format(secondRange)    // "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"
secondRange.formatted(componentsFormat) // "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"

struct InFrench: FormatStyle {
    typealias FormatInput = Range<Date>
    typealias FormatOutput = String

    static let componentsFormat = Date.ComponentsFormatStyle(
        style: .wide,
        locale: Locale(identifier: "fr_FR"),
        calendar: Calendar(identifier: .gregorian),
        fields: [
            .day,
            .month,
            .year,
            .hour,
            .second,
            .week,
        ]
    )

    func format(_ value: Range<Date>) -> String {
        InFrench.componentsFormat.format(value)
    }
}

extension FormatStyle where Self == InFrench {
    static var inFrench: InFrench { .init() }
}

secondRange.formatted(.inFrench) // "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"
```

