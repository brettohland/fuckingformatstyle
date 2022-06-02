---
sitemap_ignore: true
---
 t<pre class="splash"><code><span class="keyword token">let</span> range = <span class="type token">Date</span>(timeIntervalSince1970: <span class="number token">0</span>)..&lt;<span class="type token">Date</span>(timeIntervalSinceReferenceDate: <span class="number token">2837</span>)

range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>) <span class="comment token">// "12/31/69, 5:00 PM – 12/31/00, 5:47 PM"</span></code></pre>

### Setting the locale

You can customize the locale of the output by appending the `localized()` method onto the style.

<pre class="splash"><code><span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "31/12/1969 à 17:00 – 31/12/2000 à 17:47"</span></code></pre>

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


<pre class="splash"><code><span class="keyword token">struct</span> NarrowIntervalStyle: <span class="type token">FormatStyle</span> {
    <span class="keyword token">typealias</span> FormatInput = <span class="type token">Range</span>&lt;<span class="type token">Date</span>&gt;
    <span class="keyword token">typealias</span> FormatOutput = <span class="type token">String</span>

    <span class="keyword token">static let</span> interval = <span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>(
        date: .<span class="dotAccess token">abbreviated</span>,
        time: .<span class="dotAccess token">shortened</span>,
        locale: <span class="type token">Locale</span>(identifier: <span class="string token">"en_US"</span>),
        calendar: <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>),
        timeZone: <span class="type token">TimeZone</span>(secondsFromGMT: <span class="number token">0</span>)!
    )

    <span class="keyword token">func</span> format(<span class="keyword token">_</span> value: <span class="type token">Range</span>&lt;<span class="type token">Date</span>&gt;) -&gt; <span class="type token">String</span> {
        <span class="type token">NarrowIntervalStyle</span>.<span class="property token">interval</span>.<span class="call token">format</span>(value)
    }
}

<span class="keyword token">extension</span> <span class="type token">FormatStyle</span> <span class="keyword token">where</span> <span class="type token">Self</span> == <span class="type token">NarrowIntervalStyle</span> {
    <span class="keyword token">static var</span> narrowInterval: <span class="type token">NarrowIntervalStyle</span> { .<span class="keyword token">init</span>() }
}

range.<span class="call token">formatted</span>(.<span class="dotAccess token">narrowInterval</span>)</code></pre>


