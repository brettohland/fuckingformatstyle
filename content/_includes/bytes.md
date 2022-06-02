---
sitemap_ignore: true
---
### Available Options

The format style has four possible options:

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

{{< hint type=warning >}}

Currently, using any value above `.gb` will cause a crash with the message: "Fatal error: invalid Units value". (Feedback FB10031442 has been submitted to Apple.)

If you're looking to convert between two units, you can use the `Measurement` API and convert between `UnitInformationStorage` values.

{{< /hint >}}

<pre class="splash"><code><span class="keyword token">let</span> terabyte: <span class="type token">Int64</span> = <span class="number token">1_000_000_000_000</span>

<span class="keyword token">let</span> formatter = <span class="type token">ByteCountFormatter</span>()
formatter.<span class="property token">countStyle</span> = .<span class="dotAccess token">binary</span>
formatter.<span class="property token">allowedUnits</span>
formatter.<span class="property token">includesActualByteCount</span>
formatter.<span class="property token">countStyle</span> = .<span class="dotAccess token">file</span>

terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>))  <span class="comment token">// "931.32 GB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">decimal</span>)) <span class="comment token">// "1 TB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>))    <span class="comment token">// "1 TB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>))  <span class="comment token">// "931.32 GB"</span>

terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>, allowedUnits: .<span class="dotAccess token">bytes</span>)) <span class="comment token">// "1,000,000,000,000 bytes"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>, allowedUnits: .<span class="dotAccess token">bytes</span>)) <span class="comment token">// "1,000,000,000,000 bytes"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>, allowedUnits: .<span class="dotAccess token">kb</span>))    <span class="comment token">// "1,000,000,000 kB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>, allowedUnits: .<span class="dotAccess token">mb</span>))    <span class="comment token">// "1,000,000 MB"

// .gb, .tb, .pb, .eb, .zb, and .ybOrHigher cause a FatalError (Feedback FB10031442)
// terabyte.formatted(.byteCount(style: .file, allowedUnits: .gb))</span>

<span class="type token">Int64</span>(<span class="number token">0</span>).<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">mb</span>, spellsOutZero: <span class="keyword token">true</span>))   <span class="comment token">// "Zero bytes"</span>
<span class="type token">Int64</span>(<span class="number token">0</span>).<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">mb</span>, spellsOutZero: <span class="keyword token">false</span>))  <span class="comment token">// "0 MB"</span>

terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">mb</span>, includesActualByteCount: <span class="keyword token">true</span>))  <span class="comment token">// "1,000,000 MB (1,000,000,000,000 bytes)"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">mb</span>, includesActualByteCount: <span class="keyword token">false</span>)) <span class="comment token">// "1,000,000 MB"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>, allowedUnits: .<span class="dotAccess token">all</span>, spellsOutZero: <span class="keyword token">true</span>, includesActualByteCount: <span class="keyword token">true</span>)) <span class="comment token">// "1 TB (1,000,000,000,000 bytes)"</span></code></pre>

### Customizing the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)

terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "931,32 Go"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">decimal</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1To"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">file</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1To"</span>
terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">memory</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "931,32 Go"</span>

<span class="keyword token">let</span> inFrench = <span class="type token">ByteCountFormatStyle</span>(
    style: .<span class="dotAccess token">memory</span>,
    allowedUnits: .<span class="dotAccess token">all</span>,
    spellsOutZero: <span class="keyword token">false</span>,
    includesActualByteCount: <span class="keyword token">true</span>,
    locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)
)

inFrench.<span class="call token">format</span>(terabyte) <span class="comment token">// "931,32 Go (1 000 000 000 000 octets)"</span>
terabyte.<span class="call token">formatted</span>(inFrench) <span class="comment token">// "931,32 Go (1 000 000 000 000 octets)"</span></code></pre>

<h3>Attributed String Output</h3>

You can output attributed strings by appending the `attributed` method onto the end of the format style.

<pre class="splash"><code>terabyte.<span class="call token">formatted</span>(.<span class="call token">byteCount</span>(style: .<span class="dotAccess token">binary</span>).<span class="property token">attributed</span>)</code></pre>
