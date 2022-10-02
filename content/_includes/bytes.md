---
sitemap_ignore: true
---

{{< hint type=warning >}}

**This style is broken in certain ways in Xcode 13** (but fixed in Xcode 14). Providing any unit above gigabyte will cause a crash with the message: "Fatal error: invalid Units value".

Experiment for yourself to see if you can make this work for you, but you may want to fall back to the older `ByteCountFormatter` in this case.

{{< /hint >}}

### Available Options

Both format styles have the following options available:

| Option                    | Description                                           |
| ------------------------- | ----------------------------------------------------- |
| `style`                   | Specifies display of file or storage byte counts      |
| `allowedUnits`            | Which units to display                                |
| `spellsOutZero`           | Specifies if an empty value is shows as "0" or "Zero" |
| `includesActualByteCount` | Specifies if the original count in bytes is included  |

| Style      | Description                                                                                                                                                           |
| ---------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `.file`    | Specifies display of file byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the decimal style, but that may change over time.  |
| `.memory`  | Specifies display of memory byte counts. The actual behavior for this is platform-specific; in macOS 10.8, this uses the binary style, but that may change over time. |
| `.decimal` | Causes 1000 bytes to be shown as 1 KB. It is better to use `.memory` or `.file` in most cases                                                                         |
| `.binary`  | Causes 1024 bytes to be shown as 1 KB. It is better to use `.memory` or `.file` in most cases                                                                         |

| Units         | Description                                             |
| ------------- | ------------------------------------------------------- |
| `.all`        | Will use all values as appropriate                      |
| `.default`    | Uses the default value (`.all`)                         |
| `.bytes`      | As bytes                                                |
| `.kb`         | As kilobytes (1,000 bytes)                              |
| `.mb`         | As megabytes (1,000,000 bytes)                          |
| `.gb`         | As gigabytes (1,000,000,000 bytes)                      |
| `.tb`         | As terabytes (1,000,000,000,000 bytes)                  |
| `.pb`         | As petabytes (1,000,000,000,000,000 bytes)              |
| `.eb`         | As exabytes (1,000,000,000,000,000,000 bytes)           |
| `.zb`         | As zetabytes (1,000,000,000,000,000,000,000 bytes)      |
| `.ybOrHigher` | As yottabytes (1,000,000,000,000,000,000,000,000 bytes) |

{{< hint type=important >}}

You can provide a `Set<ByteCountFormatStyle.Units>` for the `units` parameter instead of an individual unit. Doing so will cause the style to use the unit that will provide the smallest number of digits.

{{< /hint >}}

<p>&nbsp;</p>

<pre class="splash"><code><span class="type token">Swift</span>

<span class="comment token">// MARK: - Int64</span>

<span class="keyword token">let</span> terabyte: <span class="type token">Int64</span> = <span class="number token">1_000_000_000_000</span>

<span class="keyword token">var</span> integerByteCountStyle = <span class="type token">ByteCountFormatStyle</span>()
integerByteCountStyle.<span class="property token">style</span> = .<span class="dotAccess token">file</span>
integerByteCountStyle.<span class="property token">allowedUnits</span> = [.<span class="dotAccess token">gb</span>, .<span class="dotAccess token">tb</span>]
integerByteCountStyle.<span class="property token">includesActualByteCount</span> = <span class="keyword token">true</span>

integerByteCountStyle.<span class="call token">format</span>(terabyte) <span class="comment token">// "1 TB (1,000,000,000,000 bytes)"</span>
terabyte.<span class="call token">formatted</span>(integerByteCountStyle) <span class="comment token">// "1 TB (1,000,000,000,000 bytes)"</span>

terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>)) <span class="comment token">// "931.32 GB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">decimal</span>)) <span class="comment token">// "1 TB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>)) <span class="comment token">// "1 TB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>)) <span class="comment token">// "931.32 GB"</span>

terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">bytes</span>)) <span class="comment token">// "1,000,000,000,000 bytes"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">bytes</span>)) <span class="comment token">// "1,000,000,000,000 bytes"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">kb</span>)) <span class="comment token">// "976,562,500 kB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">mb</span>)) <span class="comment token">// "953,674.3 MB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">gb</span>)) <span class="comment token">// "931.32 GB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">tb</span>)) <span class="comment token">// "0.91 TB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">pb</span>)) <span class="comment token">// "0 PB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">zb</span>)) <span class="comment token">// "0 PB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">ybOrHigher</span>)) <span class="comment token">// 0 PB</span>

<span class="type token">Int64</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: [.<span class="dotAccess token">kb</span>, .<span class="dotAccess token">mb</span>])) <span class="comment token">// "1 kB"</span>
<span class="type token">Int64</span>(<span class="number token">1_000_000</span>).<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: [.<span class="dotAccess token">kb</span>, .<span class="dotAccess token">mb</span>])) <span class="comment token">// "1 MB"</span>

<span class="type token">Int64</span>.<span class="property token">zero</span>.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, spellsOutZero: <span class="keyword token">true</span>)) <span class="comment token">// "Zero kB"</span>
<span class="type token">Int64</span>.<span class="property token">zero</span>.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, spellsOutZero: <span class="keyword token">false</span>)) <span class="comment token">// "0 bytes"</span>

<span class="type token">Int64</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, includesActualByteCount: <span class="keyword token">true</span>)) <span class="comment token">// "1 kB (1,000 bytes)"

// MARK: - Measurement</span>

<span class="keyword token">let</span> terabyteMeasurement = <span class="type token">Measurement</span>(value: <span class="number token">1</span>, unit: <span class="type token">UnitInformationStorage</span>.<span class="property token">terabytes</span>)

terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>)) <span class="comment token">// "931.32 GB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">decimal</span>)) <span class="comment token">// "1 TB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>)) <span class="comment token">// "1 TB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>)) <span class="comment token">// "931.32 GB"</span>

terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">bytes</span>)) <span class="comment token">// "1,000,000,000,000 bytes"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">bytes</span>)) <span class="comment token">// "1,000,000,000,000 bytes"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">kb</span>)) <span class="comment token">// "976,562,500 kB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">mb</span>)) <span class="comment token">// "953,674.3 MB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">gb</span>)) <span class="comment token">// "931.32 GB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">tb</span>)) <span class="comment token">// "0.91 TB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">pb</span>)) <span class="comment token">// "0 PB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">zb</span>)) <span class="comment token">// "0 PB"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">ybOrHigher</span>)) <span class="comment token">// 0 PB</span>

<span class="keyword token">let</span> kilobyteMeasurement = <span class="type token">Measurement</span>(value: <span class="number token">1</span>, unit: <span class="type token">UnitInformationStorage</span>.<span class="property token">kilobytes</span>)
<span class="keyword token">let</span> megabyteMeasurement = <span class="type token">Measurement</span>(value: <span class="number token">1</span>, unit: <span class="type token">UnitInformationStorage</span>.<span class="property token">megabytes</span>)

kilobyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: [.<span class="dotAccess token">kb</span>, .<span class="dotAccess token">mb</span>])) <span class="comment token">// "1 kB"</span>
megabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: [.<span class="dotAccess token">kb</span>, .<span class="dotAccess token">mb</span>])) <span class="comment token">// "1 MB"</span>

<span class="keyword token">let</span> zeroMeasurement = <span class="type token">Measurement</span>(value: <span class="number token">0</span>, unit: <span class="type token">UnitInformationStorage</span>.<span class="property token">bytes</span>)

zeroMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, spellsOutZero: <span class="keyword token">true</span>)) <span class="comment token">// "Zero kB"</span>
zeroMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, spellsOutZero: <span class="keyword token">false</span>)) <span class="comment token">// "0 bytes"</span>

megabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, includesActualByteCount: <span class="keyword token">true</span>)) <span class="comment token">// "1 MB (1,000,000 bytes)"</span></code></pre>

### Customizing the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="type token">Swift</span>
<span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)

terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "931,32 Go"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">decimal</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1To"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1To"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "931,32 Go"</span>

terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "931,32 Go"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">decimal</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1To"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1To"</span>
terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "931,32 Go"</span></code></pre>

<h3>Attributed String Output</h3>

You can output attributed strings by appending the `attributed` method onto the end of the format style.

<pre class="splash"><code><span class="type token">Swift</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>).<span class="property token">attributed</span>)

terabyteMeasurement.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>).<span class="property token">attributed</span>)</code></pre>
