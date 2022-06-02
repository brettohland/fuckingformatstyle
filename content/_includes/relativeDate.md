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

<pre class="splash"><code><span class="keyword token">let</span> thePast = <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>).<span class="call token">date</span>(byAdding: .<span class="dotAccess token">day</span>, value: -<span class="number token">14</span>, to: <span class="type token">Date</span>())!

thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">numeric</span>, unitsStyle: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "2 wk. ago"</span>
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">numeric</span>, unitsStyle: .<span class="dotAccess token">narrow</span>)) <span class="comment token">// "2 wk. ago"</span>
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">numeric</span>, unitsStyle: .<span class="dotAccess token">spellOut</span>)) <span class="comment token">// "two weeks ago"</span>
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">numeric</span>, unitsStyle: .<span class="dotAccess token">wide</span>)) <span class="comment token">// "2 weeks ago"</span>
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">named</span>, unitsStyle: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "2 wk. ago"</span>
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">named</span>, unitsStyle: .<span class="dotAccess token">narrow</span>)) <span class="comment token">// "2 wk. ago"</span>
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">named</span>, unitsStyle: .<span class="dotAccess token">spellOut</span>)) <span class="comment token">// "two weeks ago"</span>
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">named</span>, unitsStyle: .<span class="dotAccess token">wide</span>)) <span class="comment token">// "2 weeks ago"</span></code></pre>

### Setting the Locale & Calendar

The locale can be set by appending the `.locale()` method at the end of your `.formatted()` method call.

<pre class="splash"><code><span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)
thePast.<span class="call token">formatted</span>(.<span class="call token">relative</span>(presentation: .<span class="dotAccess token">named</span>, unitsStyle: .<span class="dotAccess token">spellOut</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "il y a deux semaines"</span></code></pre>

The calendar can only be set by initializing a new instance of the `Date.RelativeFormatStyle` struct.

<pre class="splash"><code><span class="keyword token">let</span> relativeInFrench = <span class="type token">Date</span>.<span class="type token">RelativeFormatStyle</span>(
    presentation: .<span class="dotAccess token">named</span>,
    unitsStyle: .<span class="dotAccess token">spellOut</span>,
    locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>),
    calendar: <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>),
    capitalizationContext: .<span class="dotAccess token">beginningOfSentence</span>
)

thePast.<span class="call token">formatted</span>(relativeInFrench) <span class="comment token">// "Il y a deux semaines"</span>
relativeInFrench.<span class="call token">format</span>(thePast) <span class="comment token">// "Il y a deux semaines"</span></code></pre>

You can easily re-use and access this custom format style by extending `FormatStyle`.

<pre class="splash"><code><span class="keyword token">struct</span> InFrench: <span class="type token">FormatStyle</span> {
    <span class="keyword token">typealias</span> FormatInput = <span class="type token">Date</span>
    <span class="keyword token">typealias</span> FormatOutput = <span class="type token">String</span>

    <span class="keyword token">static let</span> relativeInFrench = <span class="type token">Date</span>.<span class="type token">RelativeFormatStyle</span>(
        presentation: .<span class="dotAccess token">named</span>,
        unitsStyle: .<span class="dotAccess token">spellOut</span>,
        locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>),
        calendar: <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>),
        capitalizationContext: .<span class="dotAccess token">beginningOfSentence</span>
    )

    <span class="keyword token">func</span> format(<span class="keyword token">_</span> value: <span class="type token">Date</span>) -&gt; <span class="type token">String</span> {
        <span class="type token">InFrench</span>.<span class="property token">relativeInFrench</span>.<span class="call token">format</span>(value)
    }
}

<span class="keyword token">extension</span> <span class="type token">FormatStyle</span> <span class="keyword token">where</span> <span class="type token">Self</span> == <span class="type token">InFrench</span> {
    <span class="keyword token">static var</span> inFrench: <span class="type token">InFrench</span> { .<span class="keyword token">init</span>() }
}

thePast.<span class="call token">formatted</span>(.<span class="dotAccess token">inFrench</span>) <span class="comment token">// "Il y a deux semaines"</span></code></pre>
