---
---
 t<pre class="splash"><code><span class="keyword">let</span> range = <span class="type">Date</span>(timeIntervalSince1970: <span class="number">0</span>)..&lt;<span class="type">Date</span>(timeIntervalSinceReferenceDate: <span class="number">2837</span>)

range.<span class="call">formatted</span>(.<span class="dotAccess">interval</span>) <span class="comment">// "12/31/69, 5:00 PM – 12/31/00, 5:47 PM"</span></code></pre>

### Setting the locale

You can customize the locale of the output by appending the `localized()` method onto the style.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)
range.<span class="call">formatted</span>(.<span class="dotAccess">interval</span>.<span class="call">locale</span>(franceLocale)) <span class="comment">// "31/12/1969 à 17:00 – 31/12/2000 à 17:47"</span></code></pre>

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


<pre class="splash"><code><span class="keyword">struct</span> NarrowIntervalStyle: <span class="type">FormatStyle</span> {
    <span class="keyword">typealias</span> FormatInput = <span class="type">Range</span>&lt;<span class="type">Date</span>&gt;
    <span class="keyword">typealias</span> FormatOutput = <span class="type">String</span>

    <span class="keyword">static let</span> interval = <span class="type">Date</span>.<span class="type">IntervalFormatStyle</span>(
        date: .<span class="dotAccess">abbreviated</span>,
        time: .<span class="dotAccess">shortened</span>,
        locale: <span class="type">Locale</span>(identifier: <span class="string">"en_US"</span>),
        calendar: <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>),
        timeZone: <span class="type">TimeZone</span>(secondsFromGMT: <span class="number">0</span>)!
    )

    <span class="keyword">func</span> format(<span class="keyword">_</span> value: <span class="type">Range</span>&lt;<span class="type">Date</span>&gt;) -&gt; <span class="type">String</span> {
        <span class="type">NarrowIntervalStyle</span>.<span class="property">interval</span>.<span class="call">format</span>(value)
    }
}

<span class="keyword">extension</span> <span class="type">FormatStyle</span> <span class="keyword">where</span> <span class="type">Self</span> == <span class="type">NarrowIntervalStyle</span> {
    <span class="keyword">static var</span> narrowInterval: <span class="type">NarrowIntervalStyle</span> { .<span class="keyword">init</span>() }
}

range.<span class="call">formatted</span>(.<span class="dotAccess">narrowInterval</span>)</code></pre>


