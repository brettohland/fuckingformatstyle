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

<pre class="splash"><code><span class="keyword">let</span> testRange = <span class="type">Date</span>(timeIntervalSince1970: <span class="number">0</span>) ..&lt; <span class="type">Date</span>(timeIntervalSinceReferenceDate: <span class="number">0</span>)

testRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">abbreviated</span>, fields: [.<span class="dotAccess">day</span>]))           <span class="comment">// "11,323 days"</span>
testRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">narrow</span>, fields: [.<span class="dotAccess">day</span>]))                <span class="comment">// "11,323days"</span>
testRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">wide</span>, fields: [.<span class="dotAccess">day</span>]))                  <span class="comment">// "11,323 days"</span>
testRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">spellOut</span>, fields: [.<span class="dotAccess">day</span>]))              <span class="comment">// "eleven thousand three hundred twenty-three days"</span>
testRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">condensedAbbreviated</span>, fields: [.<span class="dotAccess">day</span>]))  <span class="comment">// "11,323d"</span>

testRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">condensedAbbreviated</span>, fields: [.<span class="dotAccess">day</span>, .<span class="dotAccess">month</span>, .<span class="dotAccess">year</span>, .<span class="dotAccess">hour</span>, .<span class="dotAccess">second</span>, .<span class="dotAccess">week</span>])) <span class="comment">// "31y"</span>

<span class="keyword">let</span> appleReferenceDay = <span class="type">Date</span>(timeIntervalSinceReferenceDate: <span class="number">0</span>)
<span class="keyword">let</span> twosday = <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>).<span class="call">date</span>(from: twosdayDateComponents)!
<span class="keyword">let</span> secondRange = appleReferenceDay .. &lt;twosday

<span class="comment">// 21 yrs, 1 mth, 3 wks, 9 hr, 1,342 sec</span>
secondRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">abbreviated</span>, fields: [.<span class="dotAccess">day</span>, .<span class="dotAccess">month</span>, .<span class="dotAccess">year</span>, .<span class="dotAccess">hour</span>, .<span class="dotAccess">second</span>, .<span class="dotAccess">week</span>]))

<span class="comment">// 21yrs 1mth 3wks 9hr 1,342sec</span>
secondRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">narrow</span>, fields: [.<span class="dotAccess">day</span>, .<span class="dotAccess">month</span>, .<span class="dotAccess">year</span>, .<span class="dotAccess">hour</span>, .<span class="dotAccess">second</span>, .<span class="dotAccess">week</span>]))

<span class="comment">// 21 years, 1 month, 3 weeks, 9 hours, 1,342 seconds</span>
secondRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">wide</span>, fields: [.<span class="dotAccess">day</span>, .<span class="dotAccess">month</span>, .<span class="dotAccess">year</span>, .<span class="dotAccess">hour</span>, .<span class="dotAccess">second</span>, .<span class="dotAccess">week</span>]))

<span class="comment">// twenty-one years, one month, three weeks, nine hours, one thousand three hundred forty-two seconds</span>
secondRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">spellOut</span>, fields: [.<span class="dotAccess">day</span>, .<span class="dotAccess">month</span>, .<span class="dotAccess">year</span>, .<span class="dotAccess">hour</span>, .<span class="dotAccess">second</span>, .<span class="dotAccess">week</span>]))

<span class="comment">// 21y 1mo 3w 9h 1,342s</span>
secondRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">condensedAbbreviated</span>, fields: [.<span class="dotAccess">day</span>, .<span class="dotAccess">month</span>, .<span class="dotAccess">year</span>, .<span class="dotAccess">hour</span>, .<span class="dotAccess">second</span>, .<span class="dotAccess">week</span>]))</code></pre>

### Locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)
<span class="comment">// vingt-et-un ans, un mois, trois semaines, neuf heures et mille trois cent quarante-deux secondes</span>
secondRange.<span class="call">formatted</span>(.<span class="call">components</span>(style: .<span class="dotAccess">spellOut</span>, fields: [.<span class="dotAccess">day</span>, .<span class="dotAccess">month</span>, .<span class="dotAccess">year</span>, .<span class="dotAccess">hour</span>, .<span class="dotAccess">second</span>, .<span class="dotAccess">week</span>]).<span class="call">locale</span>(franceLocale))</code></pre>

### Fully Customizing & Setting Calendar

You can set the calendar by using the `Date.ComponentFormatStyle` initializer and using the resulting format style.

<pre class="splash"><code><span class="keyword">let</span> componentsFormat = <span class="type">Date</span>.<span class="type">ComponentsFormatStyle</span>(
    style: .<span class="dotAccess">wide</span>,
    locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>),
    calendar: <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>),
    fields: [
        .<span class="dotAccess">day</span>,
        .<span class="dotAccess">month</span>,
        .<span class="dotAccess">year</span>,
        .<span class="dotAccess">hour</span>,
        .<span class="dotAccess">second</span>,
        .<span class="dotAccess">week</span>,
    ]
)

componentsFormat.<span class="call">format</span>(secondRange)    <span class="comment">// "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"</span>
secondRange.<span class="call">formatted</span>(componentsFormat) <span class="comment">// "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"</span>

<span class="keyword">struct</span> InFrench: <span class="type">FormatStyle</span> {
    <span class="keyword">typealias</span> FormatInput = <span class="type">Range</span>&lt;<span class="type">Date</span>&gt;
    <span class="keyword">typealias</span> FormatOutput = <span class="type">String</span>

    <span class="keyword">static let</span> componentsFormat = <span class="type">Date</span>.<span class="type">ComponentsFormatStyle</span>(
        style: .<span class="dotAccess">wide</span>,
        locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>),
        calendar: <span class="type">Calendar</span>(identifier: .<span class="dotAccess">gregorian</span>),
        fields: [
            .<span class="dotAccess">day</span>,
            .<span class="dotAccess">month</span>,
            .<span class="dotAccess">year</span>,
            .<span class="dotAccess">hour</span>,
            .<span class="dotAccess">second</span>,
            .<span class="dotAccess">week</span>,
        ]
    )

    <span class="keyword">func</span> format(<span class="keyword">_</span> value: <span class="type">Range</span>&lt;<span class="type">Date</span>&gt;) -&gt; <span class="type">String</span> {
        <span class="type">InFrench</span>.<span class="property">componentsFormat</span>.<span class="call">format</span>(value)
    }
}

<span class="keyword">extension</span> <span class="type">FormatStyle</span> <span class="keyword">where</span> <span class="type">Self</span> == <span class="type">InFrench</span> {
    <span class="keyword">static var</span> inFrench: <span class="type">InFrench</span> { .<span class="keyword">init</span>() }
}

secondRange.<span class="call">formatted</span>(.<span class="dotAccess">inFrench</span>) <span class="comment">// "21 ans, 1 mois, 3 semaines, 9 heures et 1 342 secondes"</span></code></pre>


