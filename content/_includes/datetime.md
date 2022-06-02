---
sitemap_ignore: true
---
| Symbol            | Description                             |
| ----------------- | --------------------------------------- |
| `.day()`          | The numerical day relative to the month |
| `.dayOfTheYear()` | The numerical day relative to the year  |
| `.era()`          | The era of the date                     |
| `.hour()`         | The hour                                |
| `.minute()`       | The minute                              |
| `.month()`        | The month of the year                   |
| `.quarter()`      | The quarter                             |
| `.second()`       | The second                              |
| `.timeZone`       | The time zone                           |
| `.week()`         | The week                                |
| `.weekday()`      | The named day of the week               |
| `.year()`         | The year                                |

{{< hint type=important >}}

The `Locale` for the examples are all `en_CA` (English, Canada) and are using the Gregorian Calendar.

{{< /hint >}}

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">day</span>()) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">dayOfYear</span>()) <span class="comment">// "53"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">era</span>()) <span class="comment">// "AD"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>()) <span class="comment">// "2 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">minute</span>()) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">month</span>()) <span class="comment">// "Feb"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">quarter</span>()) <span class="comment">// "Q1"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">second</span>()) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">secondFraction</span>(.<span class="call">fractional</span>(<span class="number">2</span>))) <span class="comment">// "00"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">secondFraction</span>(.<span class="call">milliseconds</span>(<span class="number">1</span>))) <span class="comment">// "8542000"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>()) <span class="comment">// "MST"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">week</span>()) <span class="comment">// "9"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">weekday</span>()) <span class="comment">// "Tue"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>()) <span class="comment">// "2022"</span></code></pre>

The symbols can be chained together to mix and match your desired string.

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>().<span class="call">month</span>().<span class="call">day</span>().<span class="call">hour</span>().<span class="call">minute</span>().<span class="call">second</span>()) <span class="comment">// "Feb 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">second</span>().<span class="call">minute</span>().<span class="call">hour</span>().<span class="call">day</span>().<span class="call">month</span>().<span class="call">year</span>()) <span class="comment">// "Feb 22, 2022, 2:22:22 AM"</span></code></pre>

{{< hint type=important >}}

The order of the symbols in the final string are controlled by the date's `Locale` and not the order that they are called.

{{< /hint >}}

### Customization

Each symbol has customization options.

#### Day

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">day</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">day</span>(.<span class="dotAccess">ordinalOfDayInMonth</span>)) <span class="comment">// "4"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">day</span>(.<span class="dotAccess">defaultDigits</span>)) <span class="comment">// "22"</span></code></pre>

#### Day of Year

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">dayOfYear</span>(.<span class="dotAccess">defaultDigits</span>)) <span class="comment">// "53"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">dayOfYear</span>(.<span class="dotAccess">threeDigits</span>)) <span class="comment">// "053"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">dayOfYear</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "53"</span></code></pre>
#### Era

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">era</span>(.<span class="dotAccess">abbreviated</span>)) <span class="comment">// "AD"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">era</span>(.<span class="dotAccess">narrow</span>)) <span class="comment">// "A"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">era</span>(.<span class="dotAccess">wide</span>)) <span class="comment">// "Anno Domini"</span></code></pre>

#### Hour

Each of the following methods accepts an `AMPMStyle`.

| AMPMStyle | Description                                                                                                                                                                                                       | 
| ----------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| omitted     | Hides the day period marker (AM/PM). <br>For example, `8` (for 8 in the morning), `1` (for 1 in the afternoon) if used with `defaultDigits`. <br>Or `08`, `01` if used with `twoDigits`.                          |
| narrow      | Narrow day period if the locale prefers using day period with hour. <br>For example, `8`, `8a`, `13`, `1p` if used with `defaultDigits`. <br>Or `08`, `08a`, `13`, `01p` if used with `twoDigits`.                |
| abbreviated | Abbreviated day period if the locale prefers using day period with hour. <br>For example, `8`, `8 AM`, `13`, `1 PM` if used with `defaultDigits`. <br>Or `08`, `08 AM`, `13`, `01 PM` if used with `twoDigits`.   |
| wide        | Wide day period if the locale prefers using day period with hour. <br>For example, `8`, `8 A.M.`, `13`, `1 P.M.` if used with `defaultDigits`. <br>Or, `08`, `08 A.M.`, `13`, `01 P.M.` if used with `twoDigits`. |

| Option                                                                    | Description                                                                                                                                          |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- |
| defaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle)               | The preferred numeric hour format for the locale with minimum digits. Whether the period symbol (AM/PM) will be shown depends on the locale.         |
| twoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle)                   | The preferred two-digit hour format for the locale, zero padded if necessary. Whether the period symbol (AM/PM) will be shown depends on the locale. |
| conversationalDefaultDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle) | Behaves like `defaultDigits`: the preferred numeric hour format for the locale with minimum digits. May also use conversational period formats.      |
| conversationalTwoDigits(amPM: Date.FormatStyle.Symbol.Hour.AMPMStyle)     | Behaves like `twoDigits`: two-digit hour format for the locale, zero padded if necessary. May also use conversational period formats.                |


<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess">wide</span>))) <span class="comment">// "2 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess">narrow</span>))) <span class="comment">// "2 a"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess">abbreviated</span>))) <span class="comment">// "2 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess">omitted</span>))) <span class="comment">// "02"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalTwoDigits</span>(amPM: .<span class="dotAccess">wide</span>))) <span class="comment">// "02 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalTwoDigits</span>(amPM: .<span class="dotAccess">narrow</span>))) <span class="comment">// "02 a"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalTwoDigits</span>(amPM: .<span class="dotAccess">abbreviated</span>))) <span class="comment">// "02 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">conversationalTwoDigits</span>(amPM: .<span class="dotAccess">omitted</span>))) <span class="comment">// "02"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">defaultDigits</span>(amPM: .<span class="dotAccess">wide</span>))) <span class="comment">// "2 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">defaultDigits</span>(amPM: .<span class="dotAccess">narrow</span>))) <span class="comment">// "2 a"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">defaultDigits</span>(amPM: .<span class="dotAccess">abbreviated</span>))) <span class="comment">// "2 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">defaultDigits</span>(amPM: .<span class="dotAccess">omitted</span>))) <span class="comment">// "02"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">twoDigits</span>(amPM: .<span class="dotAccess">wide</span>))) <span class="comment">// "02 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">twoDigits</span>(amPM: .<span class="dotAccess">narrow</span>))) <span class="comment">// "02 a"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">twoDigits</span>(amPM: .<span class="dotAccess">abbreviated</span>))) <span class="comment">// "02 AM"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>(.<span class="call">twoDigits</span>(amPM: .<span class="dotAccess">omitted</span>))) <span class="comment">// "02"</span></code></pre>

#### Minute

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">minute</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">minute</span>(.<span class="dotAccess">defaultDigits</span>)) <span class="comment">// "22"</span></code></pre>

#### Month

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">month</span>(.<span class="dotAccess">defaultDigits</span>)) <span class="comment">// "2"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">month</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "02"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">month</span>(.<span class="dotAccess">wide</span>)) <span class="comment">// "February"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">month</span>(.<span class="dotAccess">abbreviated</span>)) <span class="comment">// "Feb"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">month</span>(.<span class="dotAccess">narrow</span>)) <span class="comment">// "F"</span></code></pre>

#### Quarter

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">quarter</span>(.<span class="dotAccess">narrow</span>)) <span class="comment">// "1"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">quarter</span>(.<span class="dotAccess">abbreviated</span>)) <span class="comment">// "Q1"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">quarter</span>(.<span class="dotAccess">wide</span>)) <span class="comment">// "1st quarter"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">quarter</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "01"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">quarter</span>(.<span class="dotAccess">oneDigit</span>)) <span class="comment">// "1"</span></code></pre>

#### Second

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">second</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">second</span>(.<span class="dotAccess">defaultDigits</span>)) <span class="comment">// "22"</span></code></pre>

#### Second Fraction

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">secondFraction</span>(.<span class="call">fractional</span>(<span class="number">2</span>))) <span class="comment">// "00"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">secondFraction</span>(.<span class="call">milliseconds</span>(<span class="number">1</span>))) <span class="comment">// "8542000"</span></code></pre>

#### Time Zone

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="dotAccess">exemplarLocation</span>)) <span class="comment">// "Edmonton"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="dotAccess">genericLocation</span>)) <span class="comment">// "Edmonton Time"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">genericName</span>(.<span class="dotAccess">long</span>))) <span class="comment">// "Mountain Time"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">genericName</span>(.<span class="dotAccess">short</span>))) <span class="comment">// "MT"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">identifier</span>(.<span class="dotAccess">short</span>))) <span class="comment">// "caedm"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">identifier</span>(.<span class="dotAccess">long</span>))) <span class="comment">// "America/Edmonton"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">iso8601</span>(.<span class="dotAccess">long</span>))) <span class="comment">// "-07:00"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">iso8601</span>(.<span class="dotAccess">short</span>))) <span class="comment">// "-07:00"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">specificName</span>(.<span class="dotAccess">short</span>))) <span class="comment">// "MST"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">timeZone</span>(.<span class="call">specificName</span>(.<span class="dotAccess">long</span>))) <span class="comment">// "Mountain Standard Time"</span></code></pre>

#### Week

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">week</span>(.<span class="dotAccess">defaultDigits</span>)) <span class="comment">// "9"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">week</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "09"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">week</span>(.<span class="dotAccess">weekOfMonth</span>)) <span class="comment">// "9"</span></code></pre>

#### Weekday

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">weekday</span>(.<span class="dotAccess">abbreviated</span>)) <span class="comment">// "Tue"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">weekday</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "3"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">weekday</span>(.<span class="dotAccess">short</span>)) <span class="comment">// "Tu"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">weekday</span>(.<span class="dotAccess">oneDigit</span>)) <span class="comment">// "3"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">weekday</span>(.<span class="dotAccess">wide</span>)) <span class="comment">// "Tuesday"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">weekday</span>(.<span class="dotAccess">narrow</span>)) <span class="comment">// "T"</span></code></pre>

#### Year

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>(.<span class="dotAccess">twoDigits</span>)) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>(.<span class="dotAccess">defaultDigits</span>)) <span class="comment">// "2022"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>(.<span class="call">extended</span>())) <span class="comment">// "22"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>(.<span class="call">extended</span>(minimumLength: <span class="number">2</span>))) <span class="comment">// "2022"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>(.<span class="call">padded</span>(<span class="number">10</span>))) <span class="comment">// "0000002022"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>(.<span class="call">relatedGregorian</span>())) <span class="comment">// "2022"</span>
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>(.<span class="call">relatedGregorian</span>(minimumLength: <span class="number">2</span>))) <span class="comment">// "22"</span></code></pre>

### Setting the Locale

You can set the Locale by appending the `.locale()` method onto the last Symbol.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)
twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">year</span>().<span class="call">month</span>().<span class="call">day</span>().<span class="call">hour</span>().<span class="call">minute</span>().<span class="call">second</span>().<span class="call">locale</span>(franceLocale)) <span class="comment">// "22 févr. 2022 à 02:22:22"</span></code></pre>

<h3>Attributed String Output</h3>

You can output an `AttributedString` by appending the `attributed` method onto the last symbol.

<pre class="splash"><code>twosday.<span class="call">formatted</span>(.<span class="dotAccess">dateTime</span>.<span class="call">hour</span>().<span class="call">minute</span>().<span class="property">attributed</span>)</code></pre> 
