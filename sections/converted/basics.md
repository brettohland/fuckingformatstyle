---
---
## The Basics

You can access this new system in a few ways:

1. Call `.formatted()` on a data type for a sensible, localized default
2. Call `.formatted(_: FormatStyle)` on a data type, and pass in a pre-defined or custom FormatStyle to customize your output
3. Call `.format()` on an instance of a FormatStyle

At its most basic, calling `.formatted()` will give you a sensible default that uses your device's current locale and calendar to display the value.

<pre class="splash"><code><span class="comment">// Dates</span>
<span class="type">Date</span>(timeIntervalSinceReferenceDate: <span class="number">0</span>).<span class="call">formatted</span>() <span class="comment">// "12/31/2000, 5:00 PM"

// Measurements</span>
<span class="type">Measurement</span>(value: <span class="number">20</span>, unit: <span class="type">UnitDuration</span>.<span class="property">minutes</span>).<span class="call">formatted</span>()     <span class="comment">// "20 min"</span>
<span class="type">Measurement</span>(value: <span class="number">300</span>, unit: <span class="type">UnitLength</span>.<span class="property">miles</span>).<span class="call">formatted</span>()        <span class="comment">// "300 mi"</span>
<span class="type">Measurement</span>(value: <span class="number">10</span>, unit: <span class="type">UnitMass</span>.<span class="property">kilograms</span>).<span class="call">formatted</span>()       <span class="comment">// "22 lb"</span>
<span class="type">Measurement</span>(value: <span class="number">100</span>, unit: <span class="type">UnitTemperature</span>.<span class="property">celsius</span>).<span class="call">formatted</span>() <span class="comment">// "212°F"

// Numbers</span>
<span class="number">32</span>.<span class="call">formatted</span>()               <span class="comment">// "32"</span>
<span class="type">Decimal</span>(<span class="number">20.0</span>).<span class="call">formatted</span>()    <span class="comment">// "20"</span>
<span class="type">Float</span>(<span class="number">10.0</span>).<span class="call">formatted</span>()      <span class="comment">// "10"</span>
<span class="type">Int</span>(<span class="number">2</span>).<span class="call">formatted</span>()           <span class="comment">// "2"</span>
<span class="type">Double</span>(<span class="number">100.0003</span>).<span class="call">formatted</span>() <span class="comment">// "100.0003"

// Names</span>
<span class="type">PersonNameComponents</span>(givenName: <span class="string">"Johnny"</span>, familyName: <span class="string">"Appleseed"</span>).<span class="call">formatted</span>() <span class="comment">// "Johnny Appleseed"

// Lists</span>
[<span class="string">"Alba"</span>, <span class="string">"Bruce"</span>, <span class="string">"Carol"</span>, <span class="string">"Billson"</span>].<span class="call">formatted</span>() <span class="comment">// "Alba, Bruce, Carol, and Billson"

// TimeInterval</span>
<span class="keyword">let</span> referenceDay = <span class="type">Date</span>(timeIntervalSinceReferenceDate: <span class="number">0</span>)
(referenceDay ..&lt; referenceDay.<span class="call">addingTimeInterval</span>(<span class="number">200</span>)).<span class="call">formatted</span>() <span class="comment">// "12/31/00, 5:00 – 5:03 PM"

// Calling format on a style</span>
<span class="keyword">let</span> byteCountStyle = <span class="type">ByteCountFormatStyle</span>(
    style: .<span class="dotAccess">file</span>,
    allowedUnits: .<span class="dotAccess">all</span>,
    spellsOutZero: <span class="keyword">true</span>,
    includesActualByteCount: <span class="keyword">true</span>,
    locale: <span class="type">Locale</span>.<span class="property">current</span>
)

byteCountStyle.<span class="call">format</span>(<span class="number">1_000_000_000</span>) <span class="comment">//"1 GB (1,000,000,000 bytes)"</span></code></pre>

In general, these are useful to quickly convert your values into strings.
