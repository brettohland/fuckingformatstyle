---
sitemap_ignore: true
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

<pre class="splash"><code><span class="keyword">let</span> thePast = <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>).<span class="call">date</span>(byAdding: .<span class="dotAccess">day</span>, value: -<span class="number">14</span>, to: <span class="type">Date</span>())!

thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">numeric</span>, unitsStyle: .<span class="dotAccess">abbreviated</span>)) <span class="comment">// "2 wk. ago"</span>
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">numeric</span>, unitsStyle: .<span class="dotAccess">narrow</span>)) <span class="comment">// "2 wk. ago"</span>
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">numeric</span>, unitsStyle: .<span class="dotAccess">spellOut</span>)) <span class="comment">// "two weeks ago"</span>
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">numeric</span>, unitsStyle: .<span class="dotAccess">wide</span>)) <span class="comment">// "2 weeks ago"</span>
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">named</span>, unitsStyle: .<span class="dotAccess">abbreviated</span>)) <span class="comment">// "2 wk. ago"</span>
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">named</span>, unitsStyle: .<span class="dotAccess">narrow</span>)) <span class="comment">// "2 wk. ago"</span>
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">named</span>, unitsStyle: .<span class="dotAccess">spellOut</span>)) <span class="comment">// "two weeks ago"</span>
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">named</span>, unitsStyle: .<span class="dotAccess">wide</span>)) <span class="comment">// "2 weeks ago"</span></code></pre>

### Setting the Locale & Calendar

The locale can be set by appending the `.locale()` method at the end of your `.formatted()` method call.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)
thePast.<span class="call">formatted</span>(.<span class="call">relative</span>(presentation: .<span class="dotAccess">named</span>, unitsStyle: .<span class="dotAccess">spellOut</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "il y a deux semaines"</span></code></pre>

The calendar can only be set by initializing a new instance of the `Date.RelativeFormatStyle` struct.

<pre class="splash"><code><span class="keyword">let</span> relativeInFrench = <span class="type">Date</span>.<span class="type">RelativeFormatStyle</span>(
    presentation: .<span class="dotAccess">named</span>,
    unitsStyle: .<span class="dotAccess">spellOut</span>,
    locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>),
    calendar: <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>),
    capitalizationContext: .<span class="dotAccess">beginningOfSentence</span>
)

thePast.<span class="call">formatted</span>(relativeInFrench) <span class="comment">// "Il y a deux semaines"</span>
relativeInFrench.<span class="call">format</span>(thePast) <span class="comment">// "Il y a deux semaines"</span></code></pre>

You can easily re-use and access this custom format style by extending `FormatStyle`.

<pre class="splash"><code><span class="keyword">struct</span> InFrench: <span class="type">FormatStyle</span> {
    <span class="keyword">typealias</span> FormatInput = <span class="type">Date</span>
    <span class="keyword">typealias</span> FormatOutput = <span class="type">String</span>

    <span class="keyword">static let</span> relativeInFrench = <span class="type">Date</span>.<span class="type">RelativeFormatStyle</span>(
        presentation: .<span class="dotAccess">named</span>,
        unitsStyle: .<span class="dotAccess">spellOut</span>,
        locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>),
        calendar: <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>),
        capitalizationContext: .<span class="dotAccess">beginningOfSentence</span>
    )

    <span class="keyword">func</span> format(<span class="keyword">_</span> value: <span class="type">Date</span>) -&gt; <span class="type">String</span> {
        <span class="type">InFrench</span>.<span class="property">relativeInFrench</span>.<span class="call">format</span>(value)
    }
}

<span class="keyword">extension</span> <span class="type">FormatStyle</span> <span class="keyword">where</span> <span class="type">Self</span> == <span class="type">InFrench</span> {
    <span class="keyword">static var</span> inFrench: <span class="type">InFrench</span> { .<span class="keyword">init</span>() }
}

thePast.<span class="call">formatted</span>(.<span class="dotAccess">inFrench</span>) <span class="comment">// "Il y a deux semaines"</span></code></pre>
