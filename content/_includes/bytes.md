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

<pre class="splash"><code><span class="keyword">let</span> terabyte: <span class="type">Int64</span> = <span class="number">1_000_000_000_000</span>

<span class="keyword">let</span> formatter = <span class="type">ByteCountFormatter</span>()
formatter.<span class="property">countStyle</span> = .<span class="dotAccess">binary</span>
formatter.<span class="property">allowedUnits</span>
formatter.<span class="property">includesActualByteCount</span>
formatter.<span class="property">countStyle</span> = .<span class="dotAccess">file</span>

terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">binary</span>))  <span class="comment">// "931.32 GB"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">decimal</span>)) <span class="comment">// "1 TB"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">file</span>))    <span class="comment">// "1 TB"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">memory</span>))  <span class="comment">// "931.32 GB"</span>

terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">memory</span>, allowedUnits: .<span class="dotAccess">bytes</span>)) <span class="comment">// "1,000,000,000,000 bytes"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">memory</span>, allowedUnits: .<span class="dotAccess">bytes</span>)) <span class="comment">// "1,000,000,000,000 bytes"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">memory</span>, allowedUnits: .<span class="dotAccess">kb</span>))    <span class="comment">// "1,000,000,000 kB"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">memory</span>, allowedUnits: .<span class="dotAccess">mb</span>))    <span class="comment">// "1,000,000 MB"

// .gb, .tb, .pb, .eb, .zb, and .ybOrHigher cause a FatalError (Feedback FB10031442)
// terabyte.formatted(.byteCount(style: .file, allowedUnits: .gb))</span>

<span class="type">Int64</span>(<span class="number">0</span>).<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">file</span>, allowedUnits: .<span class="dotAccess">mb</span>, spellsOutZero: <span class="keyword">true</span>))   <span class="comment">// "Zero bytes"</span>
<span class="type">Int64</span>(<span class="number">0</span>).<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">file</span>, allowedUnits: .<span class="dotAccess">mb</span>, spellsOutZero: <span class="keyword">false</span>))  <span class="comment">// "0 MB"</span>

terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">file</span>, allowedUnits: .<span class="dotAccess">mb</span>, includesActualByteCount: <span class="keyword">true</span>))  <span class="comment">// "1,000,000 MB (1,000,000,000,000 bytes)"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">file</span>, allowedUnits: .<span class="dotAccess">mb</span>, includesActualByteCount: <span class="keyword">false</span>)) <span class="comment">// "1,000,000 MB"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">file</span>, allowedUnits: .<span class="dotAccess">all</span>, spellsOutZero: <span class="keyword">true</span>, includesActualByteCount: <span class="keyword">true</span>)) <span class="comment">// "1 TB (1,000,000,000,000 bytes)"</span></code></pre>

### Customizing the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)

terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">binary</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "931,32 Go"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">decimal</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "1To"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">file</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "1To"</span>
terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">memory</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "931,32 Go"</span>

<span class="keyword">let</span> inFrench = <span class="type">ByteCountFormatStyle</span>(
    style: .<span class="dotAccess">memory</span>,
    allowedUnits: .<span class="dotAccess">all</span>,
    spellsOutZero: <span class="keyword">false</span>,
    includesActualByteCount: <span class="keyword">true</span>,
    locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)
)

inFrench.<span class="call">format</span>(terabyte) <span class="comment">// "931,32 Go (1 000 000 000 000 octets)"</span>
terabyte.<span class="call">formatted</span>(inFrench) <span class="comment">// "931,32 Go (1 000 000 000 000 octets)"</span></code></pre>

<h3>Attributed String Output</h3>

You can output attributed strings by appending the `attributed` method onto the end of the format style.

<pre class="splash"><code>terabyte.<span class="call">formatted</span>(.<span class="call">byteCount</span>(style: .<span class="dotAccess">binary</span>).<span class="property">attributed</span>)</code></pre>
