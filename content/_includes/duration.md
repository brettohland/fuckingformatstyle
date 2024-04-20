---
sitemap_ignore: true
---

There are two format styles available for the `Duration` type:

<h2 id="time-style">Time Style {{< xcode14-badge >}}</h2>

Time format style allows you to output your `Duration` as a combination of hours, minutes, and seconds, which is set by the `pattern` parameter on the style.

You can either initialize a new instance of `Duration.TimeFormatStyle`, or use the `.time(pattern:)` extension on FormatStyle.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>() <span class="comment token">// "0:16:40"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="dotAccess token">hourMinute</span>)) <span class="comment token">// "0:17"</span>
<span class="type token">Duration</span>.<span class="type token">TimeFormatStyle</span>(pattern: .<span class="dotAccess token">hourMinute</span>).<span class="call token">format</span>(<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>)) <span class="comment token">// "0:17"</span></code></pre>

{{< hint type=note >}}

You'll notice that this is the default style when calling `.formatted()` on any `Duration` without specifying a style.

{{< /hint >}}

### Available Patterns

There are six total patterns available, broken out into two types: properties and methods.

The properties are the "defaults" for each type of pattern and will choose the configuration for you.

| Pattern           | Description                                                     |
| ----------------- | --------------------------------------------------------------- |
| `.hourMinute`       | Displays the hour and minute values for the Duration          |
| `.hourMinuteSecond` | Displays the hour, minute, and second values for the Duration |
| `.minuteSecond`     | Displays the minute and second values for the Duration        |

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="dotAccess token">hourMinute</span>)) <span class="comment token">// "0:17"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="dotAccess token">hourMinuteSecond</span>)) <span class="comment token">// "0:16:40"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="dotAccess token">minuteSecond</span>)) <span class="comment token">// "16:40"</span></code></pre>

The method variants allow you to fully customize the behaviour of each of the patterns:

| Pattern               | Description                                                   |
| --------------------- | ------------------------------------------------------------- |
| `.hourMinute()`       | Displays the hour and minute values for the Duration          |
| `.hourMinuteSecond()` | Displays the hour, minute, and second values for the Duration |
| `.minuteSecond()`     | Displays the minute and second values for the Duration        |

The following are the parameter options for `hourMinute`:

| Parameter         | Description                                                                                                                       |
| ----------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `padHourToLength` | Pads the output to include that number of digits.                                                                                 |
| `roundSeconds`    | The rounding rule to use on the seconds value ([See Rounding for all options](#numbers-rounding)). Defaults to `.toNearestOrEven` |

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="call token">hourMinute</span>(padHourToLength: <span class="number token">3</span>, roundSeconds: .<span class="dotAccess token">awayFromZero</span>))) <span class="comment token">// "000:17"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="call token">hourMinute</span>(padHourToLength: <span class="number token">1</span>, roundSeconds: .<span class="dotAccess token">down</span>))) <span class="comment token">// "000:16"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="call token">hourMinute</span>(padHourToLength: <span class="number token">1</span>, roundSeconds: .<span class="dotAccess token">toNearestOrAwayFromZero</span>))) <span class="comment token">// "0:17"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="call token">hourMinute</span>(padHourToLength: <span class="number token">1</span>, roundSeconds: .<span class="dotAccess token">toNearestOrEven</span>))) <span class="comment token">// "0:17"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="call token">hourMinute</span>(padHourToLength: <span class="number token">1</span>, roundSeconds: .<span class="dotAccess token">towardZero</span>))) <span class="comment token">// "0:16"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="call token">hourMinute</span>(padHourToLength: <span class="number token">1</span>, roundSeconds: .<span class="dotAccess token">up</span>))) <span class="comment token">// "0:17"</span></code></pre>
The following are the parameter options are for 'minuteSecond`:

| Parameter                 | Description                                                                                                                       |
| ------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| `padMinuteToLength`       | Pads the output to include that number of digits.                                                                                 |
| `fractionalSecondsLength` | The number of digits to include when displaying fractional seconds.                                                               |
| `roundFractionalSeconds`  | The rounding rule to use on the seconds value ([See Rounding for all options](#numbers-rounding)). Defaults to `.toNearestOrEven` |

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(
    .<span class="call token">time</span>(
        pattern: .<span class="call token">hourMinuteSecond</span>(
            padHourToLength: <span class="number token">3</span>,
            fractionalSecondsLength: <span class="number token">3</span>,
            roundFractionalSeconds: .<span class="dotAccess token">awayFromZero</span>
        )
    )
) <span class="comment token">// "000:16:40.000"</span>

<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(
    .<span class="call token">time</span>(
        pattern: .<span class="call token">minuteSecond</span>(
            padMinuteToLength: <span class="number token">3</span>,
            fractionalSecondsLength: <span class="number token">3</span>,
            roundFractionalSeconds: .<span class="dotAccess token">awayFromZero</span>
        )
    )
) <span class="comment token">// "016:40.000"</span></code></pre>

### Setting the Locale

You can set the `Locale` of the style by adding the `.locale()` method to your `.time(pattern:)` method, or including the locale parameter in the `Duration.TimeFormatStyle` initializer.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="dotAccess token">hourMinute</span>).<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))) <span class="comment token">// "0:17"</span>

<span class="keyword token">let</span> frenchTimeFormatStyle = <span class="type token">Duration</span>.<span class="type token">TimeFormatStyle</span>(pattern: .<span class="dotAccess token">minuteSecond</span>, locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))

frenchTimeFormatStyle.<span class="call token">format</span>(<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>)) <span class="comment token">// "16:40"</span></code></pre>

### Attributed String Output

You can output `AttributedString` values by adding the `.attributed` method.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">time</span>(pattern: .<span class="dotAccess token">hourMinuteSecond</span>).<span class="property token">attributed</span>)</code></pre>

<h2 id="units-style">Unit Style {{< xcode14-badge >}}</h2>

The units style allows you to declare and customize the specific units to display for your duration. 

You can either initialize a new instance of `Duration.UnitsFormatStyle`, or use the `.units()` extension on FormatStyle.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>()) <span class="comment token">// "1 min, 40 sec"</span>
<span class="type token">Duration</span>.<span class="type token">UnitsFormatStyle</span>(allowedUnits: [.<span class="dotAccess token">hours</span>, .<span class="dotAccess token">minutes</span>, .<span class="dotAccess token">seconds</span>], width: .<span class="dotAccess token">abbreviated</span>).<span class="call token">format</span>(.<span class="call token">seconds</span>(<span class="number token">100</span>)) <span class="comment token">// "1 min, 40 sec"</span></code></pre>

In both cases, there are two variants the initializer or style method. 

| Parameter          | Description                                                 |
| ------------------ | ----------------------------------------------------------- |
| `.allowed`         | A Set stating the possible units to display.                |
| `width`            | The "width" of the output string.                           |
| `maximumUnitCount` | The maximum number of time units to display.                |
| `zeroValueUnits`   | How to handle units with zero values.                       |
| `valueLength`      | How to pad or truncate values for display.                  |
| `fractionalPart`   | How to display fractional values if the unit can't be shown |

| Parameter           | Description                                                 |
| ------------------- | ----------------------------------------------------------- |
| `.allowed`          | A Set stating the possible units to display.                |
| `width`             | The "width" of the output string.                           |
| `maximumUnitCount`  | The maximum number of time units to display.                |
| `zeroValueUnits`    | How to handle units with zero values.                       |
| `valueLengthLimits` | How to pad or truncate values for display.                  |
| `fractionalPart`    | How to display fractional values if the unit can't be shown |

If you can't spot it at a glance, the difference is the `valueLength`/`valueLengthLimits` parameter which configures how each unit is padded or truncated. `valueLength` accepts an optional `Integer`, while `valueLengthLimits` takes an optional `ValueRange` value. 

---

#### allowed

This parameter, passed in as a `Set< Duration.UnitsFormatStyle.Unit>`, declares which units to use in the final display. By default, if a unit has a value of "0", then it will be omitted from the final string. You can override this functionality with the `zeroValueUnits` parameter.

The following units are available (from smallest to largest):

- `.nanoseconds`
- `.microseconds`
- `.miliseconds`
- `.seconds`
- `.minutes`
- `.hours`
- `.days`
- `.weeks`

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">nanoseconds</span>])) <span class="comment token">// "500,000,000 ns"</span>
<span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">microseconds</span>])) <span class="comment token">// "500,000 μs"</span>
<span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">milliseconds</span>])) <span class="comment token">// "500 ms"</span>
<span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">seconds</span>])) <span class="comment token">// "0 sec"</span>
<span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">minutes</span>])) <span class="comment token">// "0 min"</span>
<span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">hours</span>])) <span class="comment token">// "0 hr"</span>
<span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">days</span>])) <span class="comment token">// "0 days"</span>
<span class="type token">Duration</span>.<span class="call token">milliseconds</span>(<span class="number token">500</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(allowed: [.<span class="dotAccess token">weeks</span>])) <span class="comment token">// "0 wks"</span>

<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000_000</span>.<span class="number token">00123</span>).<span class="call token">formatted</span>(
    .<span class="call token">units</span>(
        allowed: [
            .<span class="dotAccess token">nanoseconds</span>,
            .<span class="dotAccess token">milliseconds</span>,
            .<span class="dotAccess token">milliseconds</span>,
            .<span class="dotAccess token">seconds</span>,
            .<span class="dotAccess token">minutes</span>,
            .<span class="dotAccess token">hours</span>,
            .<span class="dotAccess token">days</span>,
            .<span class="dotAccess token">weeks</span>
        ]
    )
) <span class="comment token">// "1 wk, 4 days, 13 hr, 46 min, 40 sec, 1 ms, 230,000 ns"</span>

<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1</span>).<span class="call token">formatted</span>(
    .<span class="call token">units</span>(
        allowed: [
            .<span class="dotAccess token">nanoseconds</span>,
            .<span class="dotAccess token">milliseconds</span>,
            .<span class="dotAccess token">milliseconds</span>,
            .<span class="dotAccess token">seconds</span>,
            .<span class="dotAccess token">minutes</span>,
            .<span class="dotAccess token">hours</span>,
            .<span class="dotAccess token">days</span>,
            .<span class="dotAccess token">weeks</span>
        ]
    )
) <span class="comment token">// "1 sec"</span></code></pre>

---

#### width

This parameter controls how verbose/wordy and condensed the string output is.

| Parameter               | Description                                                                   |
| ----------------------- | ----------------------------------------------------------------------------- |
| `.wide`                 | Shows the full unit name, eg. "3 hours"                                       |
| `.abbreviated`          | Shows the shortened version of the unit "3 hrs"                               |
| `.condensedAbbreviated` | Shows the shortened version, without a space between the value and unit "3hr" |
| `.narrow`               | Shows the shortest possible unit name                                         |


<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(width: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "1 min, 40 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(width: .<span class="dotAccess token">condensedAbbreviated</span>)) <span class="comment token">// "1 min,40 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(width: .<span class="dotAccess token">narrow</span>)) <span class="comment token">// "1m 40s"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(width: .<span class="dotAccess token">wide</span>)) <span class="comment token">// "1 minute, 40 seconds"</span></code></pre>

---

#### maximumUnitCount

Controls the number of units to display in the final string. This works in tandem with the `.units` property.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10000</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(maximumUnitCount: <span class="number token">1</span>)) <span class="comment token">// "3 hr"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10000</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(maximumUnitCount: <span class="number token">2</span>)) <span class="comment token">// "2 hr, 47 min"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10000</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(maximumUnitCount: <span class="number token">3</span>)) <span class="comment token">// "2 hr, 46 min, 40 sec"</span></code></pre>

---

#### zeroValueUnits

Controls how units with a value of zero are shown or not, and if set to `.show`, how many zeros to use in their display.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(zeroValueUnits: .<span class="dotAccess token">hide</span>)) <span class="comment token">// "1 min, 40 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(zeroValueUnits: .<span class="call token">show</span>(length: <span class="number token">1</span>))) <span class="comment token">// "0 hr, 1 min, 40 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(zeroValueUnits: .<span class="call token">show</span>(length: <span class="number token">3</span>))) <span class="comment token">// "000 hr, 001 min, 040 sec"</span></code></pre>

---

#### valueLength and valueLengthLimits

Controls how many digits of each unit to display. `valueLength` accepts a fixed integer, while `valueLengthLimits` accepts a range.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(valueLength: <span class="number token">1</span>)) <span class="comment token">// "16 min, 40 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(valueLength: <span class="number token">3</span>)) <span class="comment token">// "016 min, 040 sec"</span>

<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10_000</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(valueLengthLimits: <span class="number token">1</span>...)) <span class="comment token">// This is a bug (Feedback FB10607619)</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10_000</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(valueLengthLimits: ...<span class="number token">3</span>)) <span class="comment token">// "2 hr, 46 min, 40 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">100</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(valueLengthLimits: <span class="number token">2</span> ... <span class="number token">3</span>)) <span class="comment token">// "01 min, 40 sec"</span></code></pre>

{{< hint type=warning >}}
As of Xcode 14.0 beta 3 (14A5270f), there's a bug when you use a `ValueRange` of `1...`. In the above example, the output is "16.0 measure-unit/duration-minute, 40.0 measure-unit/duration-second” instead of “16 min, 40 sec”. Feedback FB10607619 has been submitted.
{{< /hint >}}

---

#### fractionalPart

Controls how fractional values are handled for display.

<pre class="splash"><code><span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="dotAccess token">hide</span>)) <span class="comment token">// "10 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">hide</span>(rounded: .<span class="dotAccess token">up</span>))) <span class="comment token">// "11 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">hide</span>(rounded: .<span class="dotAccess token">towardZero</span>))) <span class="comment token">// "10 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">hide</span>(rounded: .<span class="dotAccess token">toNearestOrEven</span>))) <span class="comment token">// "10 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">hide</span>(rounded: .<span class="dotAccess token">toNearestOrAwayFromZero</span>))) <span class="comment token">// "10 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">hide</span>(rounded: .<span class="dotAccess token">down</span>))) <span class="comment token">// "10 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">hide</span>(rounded: .<span class="dotAccess token">awayFromZero</span>))) <span class="comment token">// "11 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">0</span>))) <span class="comment token">// "10 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">5</span>))) <span class="comment token">// "10.00230 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, rounded: .<span class="dotAccess token">up</span>))) <span class="comment token">// "10.003 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, rounded: .<span class="dotAccess token">towardZero</span>))) <span class="comment token">// "10.002 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, rounded: .<span class="dotAccess token">toNearestOrEven</span>))) <span class="comment token">// "10.002 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, rounded: .<span class="dotAccess token">toNearestOrAwayFromZero</span>))) <span class="comment token">// "10.002 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, rounded: .<span class="dotAccess token">down</span>))) <span class="comment token">// "10.002 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, rounded: .<span class="dotAccess token">awayFromZero</span>))) <span class="comment token">// "10.003 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, increment: <span class="number token">1</span>))) <span class="comment token">// "10.000 sec"</span>
<span class="type token">Duration</span>.<span class="call token">seconds</span>(<span class="number token">10</span>.<span class="number token">0_023</span>).<span class="call token">formatted</span>(.<span class="call token">units</span>(fractionalPart: .<span class="call token">show</span>(length: <span class="number token">3</span>, increment: <span class="number token">0.001</span>))) <span class="comment token">// "10.002 sec"</span></code></pre>

