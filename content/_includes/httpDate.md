---
sitemap_ignore: true
---
``` swift
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

twosday.formatted(.http) // "Tue, 22 Feb 2022 09:22:22 GMT"
```

{{< hint type=important >}}

The output format is entirely fixed per <a href="https://www.rfc-editor.org/rfc/rfc9110.html#http.date" target="_blank" rel="noopener">RFC 9110</a>. There are no customization options.

{{< /hint >}}

### Parsing HTTP Dates From Strings

`Date.HTTPFormatStyle` conforms to `ParseableFormatStyle`, making it easy to parse HTTP date strings.

``` swift
try? Date.HTTPFormatStyle().parse("Tue, 22 Feb 2022 09:22:22 GMT") // Feb 22, 2022, 2:22:22 AM

try? Date.HTTPFormatStyle().parseStrategy.parse("Tue, 22 Feb 2022 09:22:22 GMT") // Feb 22, 2022, 2:22:22 AM

try? Date("Tue, 22 Feb 2022 09:22:22 GMT", strategy: Date.HTTPFormatStyle().parseStrategy) // Feb 22, 2022 at 2:22 AM
```
