---
---
### DateStyle and TimeStyle

To customize the display, you have the option of including a `DateStyle` or a `TimeStyle` parameter.

| DateStyle Option | Description                                                     |
| ---------------- | --------------------------------------------------------------- |
| `.omitted`       | Omits the date from display                                     |
| `.numeric`       | Displays the date components as numbers                         |
| `.abbreviated`   | Displays the year, month, and numerical day. Month is shortened |
| `.long`          | Displays the year, month, and numerical day. Month is in full   | 
| `.complete`      | Displays the year, month, weedkay, and numberical day in full   |

| TimeStyle Option | Description                                        |
| ---------------- | -------------------------------------------------- |
| `.complete`      | Shows the hour, minute, second, and time zone      |
| `.shortened`     | Shortened hour, minute, and second for your locale |
| `.omitted`       | Omits the time from display                        | 

<pre class="splash"><code>twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">abbreviated</span>, time: .<span class="dotAccess">omitted</span>) <span class="comment">// "Feb 22, 2022"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">complete</span>, time: .<span class="dotAccess">omitted</span>) <span class="comment">// "Tuesday, February 22, 2022"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">long</span>, time: .<span class="dotAccess">omitted</span>) <span class="comment">// "February 22, 2022"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">numeric</span>, time: .<span class="dotAccess">omitted</span>) <span class="comment">// "2/22/2022"</span>

twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">omitted</span>, time: .<span class="dotAccess">complete</span>) <span class="comment">// "2:22:22 AM MST"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">omitted</span>, time: .<span class="dotAccess">shortened</span>) <span class="comment">// "2:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">omitted</span>, time: .<span class="dotAccess">standard</span>) <span class="comment">// "2:22:22 AM"</span>

twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">abbreviated</span>, time: .<span class="dotAccess">complete</span>) <span class="comment">// "Feb 22, 2022, 2:22:22 AM MST"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">abbreviated</span>, time: .<span class="dotAccess">shortened</span>) <span class="comment">// "Feb 22, 2022, 2:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">abbreviated</span>, time: .<span class="dotAccess">standard</span>) <span class="comment">// "Feb 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">complete</span>, time: .<span class="dotAccess">complete</span>) <span class="comment">// "Tuesday, February 22, 2022, 2:22:22 AM MST"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">complete</span>, time: .<span class="dotAccess">shortened</span>) <span class="comment">// "Tuesday, February 22, 2022, 2:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">complete</span>, time: .<span class="dotAccess">standard</span>) <span class="comment">// "Tuesday, February 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">long</span>, time: .<span class="dotAccess">complete</span>) <span class="comment">// "February 22, 2022, 2:22:22 AM MST"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">long</span>, time: .<span class="dotAccess">shortened</span>) <span class="comment">// "February 22, 2022, 2:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">long</span>, time: .<span class="dotAccess">standard</span>) <span class="comment">// "February 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">numeric</span>, time: .<span class="dotAccess">complete</span>) <span class="comment">// "2/22/2022, 2:22:22 AM MST"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">numeric</span>, time: .<span class="dotAccess">shortened</span>) <span class="comment">// "2/22/2022, 2:22 AM"</span>
twosday.<span class="call">formatted</span>(date: .<span class="dotAccess">numeric</span>, time: .<span class="dotAccess">standard</span>) <span class="comment">// "2/22/2022, 2:22:22 AM"</span></code></pre>`

### Setting the Locale & Calendar

In order to set the Locale and Calendar of the output string, you need to initialize an instance of `Date.FormatStyle`.

<pre class="splash"><code><span class="keyword">let</span> frenchHebrew = <span class="type">Date</span>.<span class="type">FormatStyle</span>(
    date: .<span class="dotAccess">complete</span>,
    time: .<span class="dotAccess">complete</span>,
    locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>),
    calendar: <span class="type">Calendar</span>(identifier: .<span class="dotAccess">hebrew</span>),
    timeZone: <span class="type">TimeZone</span>(secondsFromGMT: <span class="number">0</span>)!,
    capitalizationContext: .<span class="dotAccess">standalone</span>
)

twosday.<span class="call">formatted</span>(frenchHebrew) <span class="comment">// "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"</span>
frenchHebrew.<span class="call">format</span>(twosday) <span class="comment">// "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"</span></code></pre>

You can also extend the `FormatStyle` protocol as a way of simplifying access to your new custom `Date.FormatStyle`

<pre class="splash"><code><span class="keyword">struct</span> FrenchHebrewStyle: <span class="type">FormatStyle</span> {
    <span class="keyword">typealias</span> FormatInput = <span class="type">Date</span>
    <span class="keyword">typealias</span> FormatOutput = <span class="type">String</span>

    <span class="keyword">static let</span> frenchHebrew = <span class="type">Date</span>.<span class="type">FormatStyle</span>(
        date: .<span class="dotAccess">complete</span>,
        time: .<span class="dotAccess">complete</span>,
        locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>),
        calendar: <span class="type">Calendar</span>(identifier: .<span class="dotAccess">hebrew</span>),
        timeZone: <span class="type">TimeZone</span>(secondsFromGMT: <span class="number">0</span>)!,
        capitalizationContext: .<span class="dotAccess">standalone</span>
    )

    <span class="keyword">func</span> format(<span class="keyword">_</span> value: <span class="type">Date</span>) -&gt; <span class="type">String</span> {
        <span class="type">FrenchHebrewStyle</span>.<span class="property">frenchHebrew</span>.<span class="call">format</span>(value)
    }
}

<span class="keyword">extension</span> <span class="type">FormatStyle</span> <span class="keyword">where</span> <span class="type">Self</span> == <span class="type">FrenchHebrewStyle</span> {
    <span class="keyword">static var</span> frenchHebrew: <span class="type">FrenchHebrewStyle</span> { .<span class="keyword">init</span>() }
}

twosday.<span class="call">formatted</span>(.<span class="dotAccess">frenchHebrew</span>) <span class="comment">// "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"</span></code></pre>`
