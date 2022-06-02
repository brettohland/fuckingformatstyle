---
sitemap_ignore: true
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

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">abbreviated</span>, time: .<span class="dotAccess token">omitted</span>) <span class="comment token">// "Feb 22, 2022"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">complete</span>, time: .<span class="dotAccess token">omitted</span>) <span class="comment token">// "Tuesday, February 22, 2022"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">long</span>, time: .<span class="dotAccess token">omitted</span>) <span class="comment token">// "February 22, 2022"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">numeric</span>, time: .<span class="dotAccess token">omitted</span>) <span class="comment token">// "2/22/2022"</span>

twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">omitted</span>, time: .<span class="dotAccess token">complete</span>) <span class="comment token">// "2:22:22 AM MST"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">omitted</span>, time: .<span class="dotAccess token">shortened</span>) <span class="comment token">// "2:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">omitted</span>, time: .<span class="dotAccess token">standard</span>) <span class="comment token">// "2:22:22 AM"</span>

twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">abbreviated</span>, time: .<span class="dotAccess token">complete</span>) <span class="comment token">// "Feb 22, 2022, 2:22:22 AM MST"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">abbreviated</span>, time: .<span class="dotAccess token">shortened</span>) <span class="comment token">// "Feb 22, 2022, 2:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">abbreviated</span>, time: .<span class="dotAccess token">standard</span>) <span class="comment token">// "Feb 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">complete</span>, time: .<span class="dotAccess token">complete</span>) <span class="comment token">// "Tuesday, February 22, 2022, 2:22:22 AM MST"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">complete</span>, time: .<span class="dotAccess token">shortened</span>) <span class="comment token">// "Tuesday, February 22, 2022, 2:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">complete</span>, time: .<span class="dotAccess token">standard</span>) <span class="comment token">// "Tuesday, February 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">long</span>, time: .<span class="dotAccess token">complete</span>) <span class="comment token">// "February 22, 2022, 2:22:22 AM MST"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">long</span>, time: .<span class="dotAccess token">shortened</span>) <span class="comment token">// "February 22, 2022, 2:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">long</span>, time: .<span class="dotAccess token">standard</span>) <span class="comment token">// "February 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">numeric</span>, time: .<span class="dotAccess token">complete</span>) <span class="comment token">// "2/22/2022, 2:22:22 AM MST"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">numeric</span>, time: .<span class="dotAccess token">shortened</span>) <span class="comment token">// "2/22/2022, 2:22 AM"</span>
twosday.<span class="call token">formatted</span>(date: .<span class="dotAccess token">numeric</span>, time: .<span class="dotAccess token">standard</span>) <span class="comment token">// "2/22/2022, 2:22:22 AM"</span></code></pre>

### Setting the Locale & Calendar

In order to set the Locale and Calendar of the output string, you need to initialize an instance of `Date.FormatStyle`.

<pre class="splash"><code><span class="keyword token">let</span> frenchHebrew = <span class="type token">Date</span>.<span class="type token">FormatStyle</span>(
    date: .<span class="dotAccess token">complete</span>,
    time: .<span class="dotAccess token">complete</span>,
    locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>),
    calendar: <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">hebrew</span>),
    timeZone: <span class="type token">TimeZone</span>(secondsFromGMT: <span class="number token">0</span>)!,
    capitalizationContext: .<span class="dotAccess token">standalone</span>
)

twosday.<span class="call token">formatted</span>(frenchHebrew) <span class="comment token">// "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"</span>
frenchHebrew.<span class="call token">format</span>(twosday) <span class="comment token">// "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"</span></code></pre>

You can also extend the `FormatStyle` protocol as a way of simplifying access to your new custom `Date.FormatStyle`

<pre class="splash"><code><span class="keyword token">struct</span> FrenchHebrewStyle: <span class="type token">FormatStyle</span> {
    <span class="keyword token">typealias</span> FormatInput = <span class="type token">Date</span>
    <span class="keyword token">typealias</span> FormatOutput = <span class="type token">String</span>

    <span class="keyword token">static let</span> frenchHebrew = <span class="type token">Date</span>.<span class="type token">FormatStyle</span>(
        date: .<span class="dotAccess token">complete</span>,
        time: .<span class="dotAccess token">complete</span>,
        locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>),
        calendar: <span class="type token">Calendar</span>(identifier: .<span class="dotAccess token">hebrew</span>),
        timeZone: <span class="type token">TimeZone</span>(secondsFromGMT: <span class="number token">0</span>)!,
        capitalizationContext: .<span class="dotAccess token">standalone</span>
    )

    <span class="keyword token">func</span> format(<span class="keyword token">_</span> value: <span class="type token">Date</span>) -&gt; <span class="type token">String</span> {
        <span class="type token">FrenchHebrewStyle</span>.<span class="property token">frenchHebrew</span>.<span class="call token">format</span>(value)
    }
}

<span class="keyword token">extension</span> <span class="type token">FormatStyle</span> <span class="keyword token">where</span> <span class="type token">Self</span> == <span class="type token">FrenchHebrewStyle</span> {
    <span class="keyword token">static var</span> frenchHebrew: <span class="type token">FrenchHebrewStyle</span> { .<span class="keyword token">init</span>() }
}

twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">frenchHebrew</span>) <span class="comment token">// "Mardi 22 février 2022 ap. J.-C. 9:22:22 UTC"</span></code></pre>
