---
sitemap_ignore: true
---
## The Basics

You can access this new system in a few ways:

1. Call `.formatted()` on a data type for a sensible, localized default
2. Call `.formatted(_: FormatStyle)` on a data type, and pass in a pre-defined or custom FormatStyle to customize your output
3. Call `.format()` on an instance of a FormatStyle

At its most basic, calling `.formatted()` will give you a sensible default that uses your device's current locale and calendar to display the value.

<pre class="splash"><code><span class="comment token">// Dates</span>
<span class="type token">Date</span>(timeIntervalSinceReferenceDate: <span class="number token">0</span>).<span class="call token">formatted</span>() <span class="comment token">// "12/31/2000, 5:00 PM"

// Measurements</span>
<span class="type token">Measurement</span>(value: <span class="number token">20</span>, unit: <span class="type token">UnitDuration</span>.<span class="property token">minutes</span>).<span class="call token">formatted</span>()     <span class="comment token">// "20 min"</span>
<span class="type token">Measurement</span>(value: <span class="number token">300</span>, unit: <span class="type token">UnitLength</span>.<span class="property token">miles</span>).<span class="call token">formatted</span>()        <span class="comment token">// "300 mi"</span>
<span class="type token">Measurement</span>(value: <span class="number token">10</span>, unit: <span class="type token">UnitMass</span>.<span class="property token">kilograms</span>).<span class="call token">formatted</span>()       <span class="comment token">// "22 lb"</span>
<span class="type token">Measurement</span>(value: <span class="number token">100</span>, unit: <span class="type token">UnitTemperature</span>.<span class="property token">celsius</span>).<span class="call token">formatted</span>() <span class="comment token">// "212°F"

// Numbers</span>
<span class="number token">32</span>.<span class="call token">formatted</span>()               <span class="comment token">// "32"</span>
<span class="type token">Decimal</span>(<span class="number token">20.0</span>).<span class="call token">formatted</span>()    <span class="comment token">// "20"</span>
<span class="type token">Float</span>(<span class="number token">10.0</span>).<span class="call token">formatted</span>()      <span class="comment token">// "10"</span>
<span class="type token">Int</span>(<span class="number token">2</span>).<span class="call token">formatted</span>()           <span class="comment token">// "2"</span>
<span class="type token">Double</span>(<span class="number token">100.0003</span>).<span class="call token">formatted</span>() <span class="comment token">// "100.0003"

// Names</span>
<span class="type token">PersonNameComponents</span>(givenName: <span class="string token">"Johnny"</span>, familyName: <span class="string token">"Appleseed"</span>).<span class="call token">formatted</span>() <span class="comment token">// "Johnny Appleseed"

// Lists</span>
[<span class="string token">"Alba"</span>, <span class="string token">"Bruce"</span>, <span class="string token">"Carol"</span>, <span class="string token">"Billson"</span>].<span class="call token">formatted</span>() <span class="comment token">// "Alba, Bruce, Carol, and Billson"

// TimeInterval</span>
<span class="keyword token">let</span> referenceDay = <span class="type token">Date</span>(timeIntervalSinceReferenceDate: <span class="number token">0</span>)
(referenceDay ..&lt; referenceDay.<span class="call token">addingTimeInterval</span>(<span class="number token">200</span>)).<span class="call token">formatted</span>() <span class="comment token">// "12/31/00, 5:00 – 5:03 PM"

// Calling format on a style</span>
<span class="keyword token">let</span> byteCountStyle = <span class="type token">ByteCountFormatStyle</span>(
    style: .<span class="dotAccess token">file</span>,
    allowedUnits: .<span class="dotAccess token">all</span>,
    spellsOutZero: <span class="keyword token">true</span>,
    includesActualByteCount: <span class="keyword token">true</span>,
    locale: <span class="type token">Locale</span>.<span class="property token">current</span>
)

byteCountStyle.<span class="call token">format</span>(<span class="number token">1_000_000_000</span>) <span class="comment token">//"1 GB (1,000,000,000 bytes)"</span></code></pre>

In general, these are useful to quickly convert your values into strings.
