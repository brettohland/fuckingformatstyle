---
sitemap_ignore: true
---
## SwiftUI Integration

{{< hint type=tip title=TL;DR >}}

Never write `Text("\()")` again. Just pass in the right `FormatStyle`

{{< /hint >}}

The `Text` view in SwiftUI has a custom initializer that accepts any `FormatStyle`.

```
struct ContentView: View {
    static let twosdayDateComponents = DateComponents(
        year: 2022,
        month: 2,
        day: 22,
        hour: 2,
        minute: 22,
        second: 22,
        nanosecond: 22
    )

    var twosday: Date {
        Calendar(identifier: .gregorian).date(from: ContentView.twosdayDateComponents)!
    }

    var body: some View {
        VStack {
            Text(twosday, format: Date.FormatStyle(date: .complete, time: .complete))
            Text(twosday, format: .dateTime.hour())
            Text(twosday, format: .dateTime.year().month().day())
        }
        .padding()
    }
}
```

Will show:

![](/images/text-date-formatter.png)