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

You can access the date format style in two ways:

1. Instantiate a new instance of the `Date.FormatStyle` struct
2. Use the `.dateTime` extension on `FormatStyle`

Either way, you can then use method chaining to customize the output.

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">day</span>()) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">dayOfYear</span>()) <span class="comment token">// "53"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">era</span>()) <span class="comment token">// "AD"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>()) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">minute</span>()) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">month</span>()) <span class="comment token">// "Feb"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">quarter</span>()) <span class="comment token">// "Q1"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">second</span>()) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">secondFraction</span>(.<span class="call token">fractional</span>(<span class="number token">2</span>))) <span class="comment token">// "00"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">secondFraction</span>(.<span class="call token">milliseconds</span>(<span class="number token">1</span>))) <span class="comment token">// "8542000"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>()) <span class="comment token">// "MST"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">week</span>()) <span class="comment token">// "9"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">weekday</span>()) <span class="comment token">// "Tue"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>()) <span class="comment token">// "2022"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">day</span>()) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">dayOfYear</span>()) <span class="comment token">// "53"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">era</span>()) <span class="comment token">// "AD"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>()) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">minute</span>()) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">month</span>()) <span class="comment token">// "Feb"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">quarter</span>()) <span class="comment token">// "Q1"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">second</span>()) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">secondFraction</span>(.<span class="call token">fractional</span>(<span class="number token">2</span>))) <span class="comment token">// "00"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">secondFraction</span>(.<span class="call token">milliseconds</span>(<span class="number token">1</span>))) <span class="comment token">// "8542000"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>()) <span class="comment token">// "MST"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">week</span>()) <span class="comment token">// "9"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">weekday</span>()) <span class="comment token">// "Tue"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>()) <span class="comment token">// "2022"</span></code></pre>

The symbols can be chained together to mix and match your desired string.

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(
    <span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>().<span class="call token">month</span>().<span class="call token">day</span>().<span class="call token">hour</span>().<span class="call token">minute</span>().<span class="call token">second</span>()
) <span class="comment token">// "Feb 22, 2022, 2:22:22 AM"</span>

twosday.<span class="call token">formatted</span>(
    <span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">second</span>().<span class="call token">minute</span>().<span class="call token">hour</span>().<span class="call token">day</span>().<span class="call token">month</span>().<span class="call token">year</span>()
) <span class="comment token">// "Feb 22, 2022, 2:22:22 AM"</span>

twosday.<span class="call token">formatted</span>(
    .<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>().<span class="call token">month</span>().<span class="call token">day</span>().<span class="call token">hour</span>().<span class="call token">minute</span>().<span class="call token">second</span>()
) <span class="comment token">// "Feb 22, 2022, 2:22:22 AM"</span>
twosday.<span class="call token">formatted</span>(
    .<span class="dotAccess token">dateTime</span>.<span class="call token">second</span>().<span class="call token">minute</span>().<span class="call token">hour</span>().<span class="call token">day</span>().<span class="call token">month</span>().<span class="call token">year</span>()
) <span class="comment token">// "Feb 22, 2022, 2:22:22 AM"</span></code></pre>

{{< hint type=important >}}

The order of the symbols in the final string are controlled by the date's `Locale` and not the order that they are called.

{{< /hint >}}

## Customization

Each symbol has customization options.

- [Day](#day)
- [Day of Year](#day-of-year)
- [Era](#era)
- [Hour](#hour)
- [Minute](#minute)
- [Month](#month)
- [Quarter](#quarter)
- [Second](#second)
- [Fractional Second](#fractional-second)
- [Time Zone](#time-zone)
- [Week](#week)
- [Weekday](#weekday)
- [Year](#year)

### Day

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">day</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">day</span>(.<span class="dotAccess token">ordinalOfDayInMonth</span>)) <span class="comment token">// "4"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">day</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">day</span>(.<span class="call token">julianModified</span>())) <span class="comment token">// "2459633"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">day</span>(.<span class="call token">julianModified</span>(minimumLength: <span class="number token">8</span>))) <span class="comment token">// "02459633"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">day</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">day</span>(.<span class="dotAccess token">ordinalOfDayInMonth</span>)) <span class="comment token">// "4"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">day</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">day</span>(.<span class="call token">julianModified</span>())) <span class="comment token">// "2459633"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">day</span>(.<span class="call token">julianModified</span>(minimumLength: <span class="number token">8</span>))) <span class="comment token">// "02459633"</span></code></pre>

### Day of Year

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">dayOfYear</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "53"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">dayOfYear</span>(.<span class="dotAccess token">threeDigits</span>)) <span class="comment token">// "053"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">dayOfYear</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "53"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">dayOfYear</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "53"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">dayOfYear</span>(.<span class="dotAccess token">threeDigits</span>)) <span class="comment token">// "053"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">dayOfYear</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "53"</span></code></pre>
### Era

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">era</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "AD"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">era</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "A"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">era</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "Anno Domini"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">era</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "AD"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">era</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "A"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">era</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "Anno Domini"</span></code></pre>

### Hour

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


<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "2 a"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "02 a"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "2 a"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "02 a"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "2 a"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalDefaultDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "02 a"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">conversationalTwoDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "2 a"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "2 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">defaultDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">wide</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">narrow</span>))) <span class="comment token">// "02 a"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">abbreviated</span>))) <span class="comment token">// "02 AM"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">hour</span>(.<span class="call token">twoDigits</span>(amPM: .<span class="dotAccess token">omitted</span>))) <span class="comment token">// "02"</span></code></pre>

### Minute

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">minute</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">minute</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "22"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">minute</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">minute</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "22"</span></code></pre>

### Month

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">month</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "2"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">month</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">month</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "February"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">month</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "Feb"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">month</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "F"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "2"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "02"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "February"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "Feb"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">month</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "F"</span></code></pre>

### Quarter

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">quarter</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "1"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">quarter</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "Q1"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">quarter</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "1st quarter"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">quarter</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "01"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">quarter</span>(.<span class="dotAccess token">oneDigit</span>)) <span class="comment token">// "1"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">quarter</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "1"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">quarter</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "Q1"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">quarter</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "1st quarter"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">quarter</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "01"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">quarter</span>(.<span class="dotAccess token">oneDigit</span>)) <span class="comment token">// "1"</span></code></pre>

### Second

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">second</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">second</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "22"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">second</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">second</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "22"</span></code></pre>

### Fractional Second

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">secondFraction</span>(.<span class="call token">fractional</span>(<span class="number token">2</span>))) <span class="comment token">// "00"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">secondFraction</span>(.<span class="call token">milliseconds</span>(<span class="number token">1</span>))) <span class="comment token">// "8542000"</span>

twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">secondFraction</span>(.<span class="call token">fractional</span>(<span class="number token">2</span>))) <span class="comment token">// "00"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">secondFraction</span>(.<span class="call token">milliseconds</span>(<span class="number token">1</span>))) <span class="comment token">// "8542000"</span></code></pre>

### Time Zone

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="dotAccess token">exemplarLocation</span>)) <span class="comment token">// "Edmonton"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="dotAccess token">genericLocation</span>)) <span class="comment token">// "Edmonton Time"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "Mountain Time"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "MT"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "caedm"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "America/Edmonton"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "-07:00"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "-07:00"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "MST"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "Mountain Standard Time"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "GMT-7"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "GMT-07:00"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="dotAccess token">exemplarLocation</span>)) <span class="comment token">// "Edmonton"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="dotAccess token">genericLocation</span>)) <span class="comment token">// "Edmonton Time"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "Mountain Time"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">genericName</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "MT"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "caedm"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">identifier</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "America/Edmonton"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "-07:00"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">iso8601</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "-07:00"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "MST"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">specificName</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "Mountain Standard Time"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">short</span>))) <span class="comment token">// "GMT-7"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">timeZone</span>(.<span class="call token">localizedGMT</span>(.<span class="dotAccess token">long</span>))) <span class="comment token">// "GMT-07:00"</span></code></pre>

### Week

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">week</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "9"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">week</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "09"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">week</span>(.<span class="dotAccess token">weekOfMonth</span>)) <span class="comment token">// "9"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">week</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "9"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">week</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "09"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">week</span>(.<span class="dotAccess token">weekOfMonth</span>)) <span class="comment token">// "9"</span></code></pre>

### Weekday

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">weekday</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "Tue"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">weekday</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "3"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">weekday</span>(.<span class="dotAccess token">short</span>)) <span class="comment token">// "Tu"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">weekday</span>(.<span class="dotAccess token">oneDigit</span>)) <span class="comment token">// "3"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">weekday</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "Tuesday"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">weekday</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "T"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">weekday</span>(.<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "Tue"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">weekday</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "3"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">weekday</span>(.<span class="dotAccess token">short</span>)) <span class="comment token">// "Tu"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">weekday</span>(.<span class="dotAccess token">oneDigit</span>)) <span class="comment token">// "3"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">weekday</span>(.<span class="dotAccess token">wide</span>)) <span class="comment token">// "Tuesday"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">weekday</span>(.<span class="dotAccess token">narrow</span>)) <span class="comment token">// "T"</span></code></pre>

### Year

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "2022"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>(.<span class="call token">extended</span>())) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>(.<span class="call token">extended</span>(minimumLength: <span class="number token">2</span>))) <span class="comment token">// "2022"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>(.<span class="call token">padded</span>(<span class="number token">10</span>))) <span class="comment token">// "0000002022"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>(.<span class="call token">relatedGregorian</span>())) <span class="comment token">// "2022"</span>
twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>(.<span class="call token">relatedGregorian</span>(minimumLength: <span class="number token">2</span>))) <span class="comment token">// "22"</span>

twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>(.<span class="dotAccess token">twoDigits</span>)) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>(.<span class="dotAccess token">defaultDigits</span>)) <span class="comment token">// "2022"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>(.<span class="call token">extended</span>())) <span class="comment token">// "22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>(.<span class="call token">extended</span>(minimumLength: <span class="number token">2</span>))) <span class="comment token">// "2022"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>(.<span class="call token">padded</span>(<span class="number token">10</span>))) <span class="comment token">// "0000002022"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>(.<span class="call token">relatedGregorian</span>())) <span class="comment token">// "2022"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">year</span>(.<span class="call token">relatedGregorian</span>(minimumLength: <span class="number token">2</span>))) <span class="comment token">// "22"</span></code></pre>

## Setting the Locale

You can set the Locale by appending the `.locale()` method onto the last Symbol.

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))) <span class="comment token">// "22/02/2022 à 2:22"</span>
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))) <span class="comment token">// "22/02/2022 à 2:22"</span></code></pre>

<h3>Attributed String Output</h3>

You can output an `AttributedString` by appending the `attributed` method onto the last symbol.

<pre class="splash"><code>twosday.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="property token">attributed</span>)
twosday.<span class="call token">formatted</span>(<span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="property token">attributed</span>)</code></pre> 

## Parsing Dates From Strings

`Date.FormatStyle` conforms to `ParseableFormatStyle` and can be set up to parse `Date` objects from a `String`.

<pre class="splash"><code><span class="keyword token">try</span>? <span class="type token">Date</span>.<span class="type token">FormatStyle</span>()
    .<span class="call token">day</span>()
    .<span class="call token">month</span>()
    .<span class="call token">year</span>()
    .<span class="call token">hour</span>()
    .<span class="call token">minute</span>()
    .<span class="call token">second</span>()
    .<span class="call token">parse</span>(<span class="string token">"Feb 22, 2022, 2:22:22 AM"</span>) <span class="comment token">// Feb 22, 2022, 2:22:22 AM</span>

<span class="keyword token">try</span>? <span class="type token">Date</span>.<span class="type token">FormatStyle</span>()
    .<span class="call token">day</span>()
    .<span class="call token">month</span>()
    .<span class="call token">year</span>()
    .<span class="call token">hour</span>()
    .<span class="call token">minute</span>()
    .<span class="call token">second</span>()
    .<span class="dotAccess token">parseStrategy</span>.<span class="call token">parse</span>(<span class="string token">"Feb 22, 2022, 2:22:22 AM"</span>) <span class="comment token">// Feb 22, 2022, 2:22:22 AM</span>

<span class="keyword token">try</span>? <span class="type token">Date</span>(
    <span class="string token">"Feb 22, 2022, 2:22:22 AM"</span>,
    strategy: <span class="type token">Date</span>.<span class="type token">FormatStyle</span>().<span class="call token">day</span>().<span class="call token">month</span>().<span class="call token">year</span>().<span class="call token">hour</span>().<span class="call token">minute</span>().<span class="call token">second</span>().<span class="property token">parseStrategy</span>
) <span class="comment token">// Feb 22, 2022 at 2:22 AM</span></code></pre>
