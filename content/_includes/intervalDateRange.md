---
sitemap_ignore: true
---

| Symbol            | Description                             |
| ----------------- | --------------------------------------- |
| `.day()`          | The numerical day relative to the month |
| `.hour()`         | The hour                                |
| `.minute()`       | The minute                              |
| `.month()`        | The month of the year                   |
| `.second()`       | The second                              |
| `.timeZone`       | The time zone                           |
| `.weekday()`      | The named day of the week               |
| `.year()`         | The year                                |

<pre class="splash"><code><span class="keyword token">let</span> range = <span class="type token">Date</span>(timeIntervalSince1970: <span class="number token">0</span>)..&lt;<span class="type token">Date</span>(timeIntervalSinceReferenceDate: <span class="number token">2837</span>)

range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>) <span class="comment token">// "12/31/69, 5:00 PM – 12/31/00, 5:47 PM"</span>

range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">day</span>()) <span class="comment token">// "12/31/1969 – 12/31/2000"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">hour</span>()) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "12/31/1969, 5 p – 12/31/2000, 5 p"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">minute</span>()) <span class="comment token">// "12/31/1969, 0 – 12/31/2000, 47"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">month</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "12/1969 – 12/2000"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">month</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "12/1969 – 12/2000"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">month</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "December 1969 – December 2000"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">month</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "D 1969 – D 2000"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">month</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "Dec 1969 – Dec 2000"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">second</span>()) <span class="comment token">// "12/31/1969, 0 – 12/31/2000, 17"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>()) <span class="comment token">// "12/31/1969, MST – 12/31/2000, MT"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="dotAccess token">exemplarLocation</span>)) <span class="comment token">// "12/31/1969, Edmonton – 12/31/2000, Edmonton"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="dotAccess token">genericLocation</span>)) <span class="comment token">// "12/31/1969, Edmonton Time – 12/31/2000, Edmonton Time"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Time"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "12/31/1969, MST – 12/31/2000, MT"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "12/31/1969, caedm – 12/31/2000, caedm"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "12/31/1969, America/Edmonton – 12/31/2000, America/Edmonton"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "12/31/1969, -0700 – 12/31/2000, -0700"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "12/31/1969, -07:00 – 12/31/2000, -07:00"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "GMT-7"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "12/31/1969, GMT-07:00 – 12/31/2000, GMT-07:00"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Standard Time"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "12/31/1969, MST – 12/31/2000, MST"</span>
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">year</span>()) <span class="comment token">//"1969 – 2000"</span>

<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">day</span>().<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969 – 12/31/2000"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">hour</span>().<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">narrow</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, 5 p – 12/31/2000, 5 p"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">omitted</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">wide</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, 5 PM – 12/31/2000, 5 PM"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">minute</span>().<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, 0 – 12/31/2000, 47"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">defaultDigits</span>).<span class="call token">format</span>(range) <span class="comment token">// "12/1969 – 12/2000"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">twoDigits</span>).<span class="call token">format</span>(range) <span class="comment token">// "12/1969 – 12/2000"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">wide</span>).<span class="call token">format</span>(range) <span class="comment token">// "December 1969 – December 2000"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">narrow</span>).<span class="call token">format</span>(range) <span class="comment token">// "D 1969 – D 2000"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">abbreviated</span>).<span class="call token">format</span>(range) <span class="comment token">// "Dec 1969 – Dec 2000"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">second</span>().<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, 0 – 12/31/2000, 17"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>().<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, MST – 12/31/2000, MT"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="dotAccess token">exemplarLocation</span>).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, Edmonton – 12/31/2000, Edmonton"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="dotAccess token">genericLocation</span>).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, Edmonton Time – 12/31/2000, Edmonton Time"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">long</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Time"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">short</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, MST – 12/31/2000, MT"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">short</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, caedm – 12/31/2000, caedm"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">long</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, America/Edmonton – 12/31/2000, America/Edmonton"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">short</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, -0700 – 12/31/2000, -0700"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">long</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, -07:00 – 12/31/2000, -07:00"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">short</span>)).<span class="call token">format</span>(range) <span class="comment token">// "GMT-7"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">long</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, GMT-07:00 – 12/31/2000, GMT-07:00"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">long</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, Mountain Standard Time – 12/31/2000, Mountain Standard Time"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">short</span>)).<span class="call token">format</span>(range) <span class="comment token">// "12/31/1969, MST – 12/31/2000, MST"</span>
<span class="type token">Date</span>.<span class="type token">IntervalFormatStyle</span>().<span class="call token">year</span>().<span class="call token">format</span>(range) <span class="comment token">//"1969 – 2000"</span></code></pre>

### Setting the locale

You can customize the locale of the output by appending the `localized()` method onto the style.

<pre class="splash"><code><span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)
range.<span class="call token">formatted</span>(.<span class="dotAccess token">interval</span>.<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "31/12/1969 à 17:00 – 31/12/2000 à 17:47"</span></code></pre>

### Initialization Options

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


