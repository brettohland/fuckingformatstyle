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
| -------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| wide                 | Shows the fields in their full spelling.<br>For example, "2 hour, 10 minutes", "2小時10分鐘"                                  |
| abbreviated          | Shows the fields in the abbreviation. <br>For example, "2 hr, 10 min", "2小時10分鐘"                                          |
| condensedAbbreviated | Uses the abbreviated form but condensed if possible. <br> For example, "2hr 10min", "2小時10分鐘"                             |
| narrow               | Shows the fields in the shortest form possible. <br>For example, "2h 10m", "2時10分"                                         |
| spellOut             | Values are spelled out and fields are displayed in their full name.<br>For example, "two hours, ten minutes", "2小時10分鐘"  |

<pre class="splash"><code><span class="keyword token">let</span> testRange = <span class="type token">Date</span>(timeIntervalSince1970: <span class="number token">0</span>) ..&lt; <span class="type token">Date</span>(timeIntervalSinceReferenceDate: <span class="number token">0</span>)

testRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">abbreviated</span>, fields: [.<span class="dotAccess token">day</span>]))           <span class="comment token">// "11,323 days"</span>
testRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">narrow</span>, fields: [.<span class="dotAccess token">day</span>]))                <span class="comment token">// "11,323days"</span>
testRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">wide</span>, fields: [.<span class="dotAccess token">day</span>]))                  <span class="comment token">// "11,323 days"</span>
testRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">spellOut</span>, fields: [.<span class="dotAccess token">day</span>]))              <span class="comment token">// "eleven thousand three hundred twenty-three days"</span>
testRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">condensedAbbreviated</span>, fields: [.<span class="dotAccess token">day</span>]))  <span class="comment token">// "11,323d"</span>
testRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">abbreviated</span>, fields: [.<span class="dotAccess token">year</span>])
    .<span class="call token">calendar</span>(<span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">coptic</span>))) <span class="comment token">// "31 yrs"</span>

testRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">condensedAbbreviated</span>, fields: [.<span class="dotAccess token">day</span>, .<span class="dotAccess token">month</span>, .<span class="dotAccess token">year</span>, .<span class="dotAccess token">hour</span>, .<span class="dotAccess token">second</span>, .<span class="dotAccess token">week</span>])) <span class="comment token">// "31y"</span>

<span class="keyword token">let</span> appleReferenceDay = <span class="type token">Date</span>(timeIntervalSinceReferenceDate: <span class="number token">0</span>)
<span class="keyword token">let</span> twosday = <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>).<span class="call token">date</span>(from: twosdayDateComponents)!
<span class="keyword token">let</span> secondRange = appleReferenceDay .. &lt;twosday

<span class="comment token">// 21 yrs, 1 mth, 3 wks, 9 hr, 1,342 sec</span>
secondRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">abbreviated</span>, fields: [.<span class="dotAccess token">day</span>, .<span class="dotAccess token">month</span>, .<span class="dotAccess token">year</span>, .<span class="dotAccess token">hour</span>, .<span class="dotAccess token">second</span>, .<span class="dotAccess token">week</span>]))

<span class="comment token">// 21yrs 1mth 3wks 9hr 1,342sec</span>
secondRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">narrow</span>, fields: [.<span class="dotAccess token">day</span>, .<span class="dotAccess token">month</span>, .<span class="dotAccess token">year</span>, .<span class="dotAccess token">hour</span>, .<span class="dotAccess token">second</span>, .<span class="dotAccess token">week</span>]))

<span class="comment token">// 21 years, 1 month, 3 weeks, 9 hours, 1,342 seconds</span>
secondRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">wide</span>, fields: [.<span class="dotAccess token">day</span>, .<span class="dotAccess token">month</span>, .<span class="dotAccess token">year</span>, .<span class="dotAccess token">hour</span>, .<span class="dotAccess token">second</span>, .<span class="dotAccess token">week</span>]))

<span class="comment token">// twenty-one years, one month, three weeks, nine hours, one thousand three hundred forty-two seconds</span>
secondRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">spellOut</span>, fields: [.<span class="dotAccess token">day</span>, .<span class="dotAccess token">month</span>, .<span class="dotAccess token">year</span>, .<span class="dotAccess token">hour</span>, .<span class="dotAccess token">second</span>, .<span class="dotAccess token">week</span>]))

<span class="comment token">// 21y 1mo 3w 9h 1,342s</span>
secondRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">condensedAbbreviated</span>, fields: [.<span class="dotAccess token">day</span>, .<span class="dotAccess token">month</span>, .<span class="dotAccess token">year</span>, .<span class="dotAccess token">hour</span>, .<span class="dotAccess token">second</span>, .<span class="dotAccess token">week</span>]))</code></pre>

### Locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)
<span class="comment token">// vingt-et-un ans, un mois, trois semaines, neuf heures et mille trois cent quarante-deux secondes</span>
secondRange.<span class="call token">formatted</span>(.<span class="call token">components</span>(style: .<span class="dotAccess token">spellOut</span>, fields: [.<span class="dotAccess token">day</span>, .<span class="dotAccess token">month</span>, .<span class="dotAccess token">year</span>, .<span class="dotAccess token">hour</span>, .<span class="dotAccess token">second</span>, .<span class="dotAccess token">week</span>]).<span class="call token">locale</span>(franceLocale))</code></pre>

### Fully Customizing & Setting Calendar

You can set the calendar by using the `Date.ComponentFormatStyle` initializer and using the resulting format style.

<pre class="splash"><code><span class="keyword token">let</span> componentsFormat = <span class="type token">Date</span>.<span class="type token">ComponentsFormatStyle</span>(
    style: .<span class="dotAccess token">wide</span>,
    locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>),
    calendar: <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>),
    fields: [
        .<span class="dotAccess token">day</span>,
        .<span class="dotAccess token">month</span>,
        .<span class="dotAccess token">year</span>,
        .<span class="dotAccess token">hour</span>,
        .<span class="dotAccess token">second</span>,
        .<span class="dotAccess token">week</span>,
    ]
)

componentsFormat.<span class="call token">format</span>(secondRange)    <span class="comment token">// "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"</span>
secondRange.<span class="call token">formatted</span>(componentsFormat) <span class="comment token">// "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"</span>

<span class="keyword token">struct</span> InFrench: <span class="type token">FormatStyle</span> {
    <span class="keyword token">typealias</span> FormatInput = <span class="type token">Range</span>&lt;<span class="type token">Date</span>&gt;
    <span class="keyword token">typealias</span> FormatOutput = <span class="type token">String</span>

    <span class="keyword token">static let</span> componentsFormat = <span class="type token">Date</span>.<span class="type token">ComponentsFormatStyle</span>(
        style: .<span class="dotAccess token">wide</span>,
        locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>),
        calendar: <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">gregorian</span>),
        fields: [
            .<span class="dotAccess token">day</span>,
            .<span class="dotAccess token">month</span>,
            .<span class="dotAccess token">year</span>,
            .<span class="dotAccess token">hour</span>,
            .<span class="dotAccess token">second</span>,
            .<span class="dotAccess token">week</span>,
        ]
    )

    <span class="keyword token">func</span> format(<span class="keyword token">_</span> value: <span class="type token">Range</span>&lt;<span class="type token">Date</span>&gt;) -&gt; <span class="type token">String</span> {
        <span class="type token">InFrench</span>.<span class="property token">componentsFormat</span>.<span class="call token">format</span>(value)
    }
}

<span class="keyword token">extension</span> <span class="type token">FormatStyle</span> <span class="keyword token">where</span> <span class="type token">Self</span> == <span class="type token">InFrench</span> {
    <span class="keyword token">static var</span> inFrench: <span class="type token">InFrench</span> { .<span class="keyword token">init</span>() }
}

secondRange.<span class="call token">formatted</span>(.<span class="dotAccess token">inFrench</span>) <span class="comment token">// "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"</span></code></pre>


