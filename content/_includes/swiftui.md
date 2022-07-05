---
sitemap_ignore: true
---
{{< hint type=tip title=TL;DR >}}

Never write `Text("\()")` again. Just pass in the right `FormatStyle`

{{< /hint >}}

The `Text` view in SwiftUI has a custom initializer that accepts any `FormatStyle`.

<pre class="splash"><code><span class="keyword token">struct</span> ContentView: <span class="type token">View</span> {
    <span class="keyword token">static let</span> twosdayDateComponents = <span class="type token">DateComponents</span>(
        year: <span class="number token">2022</span>,
        month: <span class="number token">2</span>,
        day: <span class="number token">22</span>,
        hour: <span class="number token">2</span>,
        minute: <span class="number token">22</span>,
        second: <span class="number token">22</span>,
        nanosecond: <span class="number token">22</span>
    )

    <span class="keyword token">var</span> twosday: <span class="type token">Date</span> {
        <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>).<span class="call token">date</span>(from: <span class="type token">ContentView</span>.<span class="property token">twosdayDateComponents</span>)!
    }

    <span class="keyword token">var</span> body: <span class="keyword token">some</span> <span class="type token">View</span> {
        <span class="type token">VStack</span> {
            <span class="type token">Text</span>(twosday, format: <span class="type token">Date</span>.<span class="type token">FormatStyle</span>(date: .<span class="dotAccess token">complete</span>, time: .<span class="dotAccess token">complete</span>))
            <span class="type token">Text</span>(twosday, format: .<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>())
            <span class="type token">Text</span>(twosday, format: .<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>().<span class="call token">month</span>().<span class="call token">day</span>())
        }
        .<span class="call token">padding</span>()
    }
}</code></pre>

Will show:

![](/images/text-date-formatter.png)
