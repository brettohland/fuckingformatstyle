---
sitemap_ignore: true
---
## SwiftUI Integration

{{< hint type=tip title=TL;DR >}}

Never write `Text("\()")` again. Just pass in the right `FormatStyle`

{{< /hint >}}

The `Text` view in SwiftUI has a custom initializer that accepts any `FormatStyle`.

<pre class="splash"><code><span class="keyword">struct</span> ContentView: <span class="type">View</span> {
    <span class="keyword">static let</span> twosdayDateComponents = <span class="type">DateComponents</span>(
        year: <span class="number">2022</span>,
        month: <span class="number">2</span>,
        day: <span class="number">22</span>,
        hour: <span class="number">2</span>,
        minute: <span class="number">22</span>,
        second: <span class="number">22</span>,
        nanosecond: <span class="number">22</span>
    )

    <span class="keyword">var</span> twosday: <span class="type">Date</span> {
        <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>).<span class="call">date</span>(from: <span class="type">ContentView</span>.<span class="property">twosdayDateComponents</span>)!
    }

    <span class="keyword">var</span> body: <span class="keyword">some</span> <span class="type">View</span> {
        <span class="type">VStack</span> {
            <span class="type">Text</span>(twosday, format: <span class="type">Date</span>.<span class="type">FormatStyle</span>(date: .<span class="dotAccess">complete</span>, time: .<span class="dotAccess">complete</span>))
            <span class="type">Text</span>(twosday, format: .<span class="dotAccess">dateTime</span>.<span class="call">hour</span>())
            <span class="type">Text</span>(twosday, format: .<span class="dotAccess">dateTime</span>.<span class="call">year</span>().<span class="call">month</span>().<span class="call">day</span>())
        }
        .<span class="call">padding</span>()
    }
}</code></pre>

Will show:

![](/images/text-date-formatter.png)
