---
sitemap_ignore: true
---
As a protocol, `FormatStyle` is quite simple to conform to:

<pre class="splash"><code><span class="comment">/// A type that can convert a given data type into a representation.</span>
<span class="keyword">@available</span>(macOS <span class="number">12.0</span>, iOS <span class="number">15.0</span>, tvOS <span class="number">15.0</span>, watchOS <span class="number">8.0</span>, *)
<span class="keyword">public protocol</span> FormatStyle : <span class="type">Decodable</span>, <span class="type">Encodable</span>, <span class="type">Hashable</span> {

    <span class="comment">/// The type of data to format.</span>
    <span class="keyword">associatedtype</span> FormatInput

    <span class="comment">/// The type of the formatted data.</span>
    <span class="keyword">associatedtype</span> FormatOutput

    <span class="comment">/// Creates a `FormatOutput` instance from `value`.</span>
    <span class="keyword">func</span> format(<span class="keyword">_</span> value: <span class="type">Self</span>.<span class="type">FormatInput</span>) -&gt; <span class="type">Self</span>.<span class="type">FormatOutput</span>

    <span class="comment">/// If the format allows selecting a locale, returns a copy of this format with the new locale set. Default implementation returns an unmodified self.</span>
    <span class="keyword">func</span> locale(<span class="keyword">_</span> locale: <span class="type">Locale</span>) -&gt; <span class="type">Self</span>
}</code></pre>

Essentially, this provides you with the ability to convert any data type into any other data type or representation.

An example of a custom Format Style that features locale, attributed string output, as well as a `FormatStyle` extension.

<pre class="splash"><code><span class="keyword">struct</span> ToYen: <span class="type">FormatStyle</span> {
    <span class="keyword">typealias</span> FormatInput = <span class="type">Int</span>
    <span class="keyword">typealias</span> FormatOutput = <span class="type">String</span>

    <span class="keyword">static let</span> multiplier = <span class="number">100</span>
    <span class="keyword">static let</span> yenCurrencyCode = <span class="string">"jpy"</span>

    <span class="keyword">let</span> formatter: <span class="type">IntegerFormatStyle</span>&lt;<span class="type">Int</span>&gt;.<span class="type">Currency</span>

    <span class="keyword">var</span> attributed: <span class="type">ToYen</span>.<span class="type">AttributedStyle</span> = <span class="type">AttributedStyle</span>()

    <span class="keyword">init</span>(locale: <span class="type">Locale</span>? = <span class="keyword">nil</span>) {
        formatter = <span class="type">IntegerFormatStyle</span>&lt;<span class="type">Int</span>&gt;.<span class="type">Currency</span>(code: <span class="type">Self</span>.<span class="property">yenCurrencyCode</span>, locale: locale ?? <span class="type">Locale</span>.<span class="property">current</span>)
    }

    <span class="keyword">func</span> format(<span class="keyword">_</span> value: <span class="type">Int</span>) -&gt; <span class="type">String</span> {
        (value * <span class="type">Self</span>.<span class="property">multiplier</span>).<span class="call">formatted</span>(formatter)
    }

    <span class="comment">// This is optional.</span>
    <span class="keyword">func</span> locale(<span class="keyword">_</span> locale: <span class="type">Locale</span>) -&gt; <span class="type">ToYen</span> {
        .<span class="keyword">init</span>(locale: locale)
    }
}

<span class="comment">// MARK: Add Attributed Style support</span>

<span class="keyword">extension</span> <span class="type">ToYen</span> {
    <span class="keyword">struct</span> AttributedStyle: <span class="type">FormatStyle</span> {
        <span class="keyword">typealias</span> FormatInput = <span class="type">Int</span>
        <span class="keyword">typealias</span> FormatOutput = <span class="type">AttributedString</span>

        <span class="keyword">func</span> format(<span class="keyword">_</span> value: <span class="type">Int</span>) -&gt; <span class="type">AttributedString</span> {
            (value * <span class="type">ToYen</span>.<span class="property">multiplier</span>).<span class="call">formatted</span>(<span class="type">ToYen</span>().<span class="property">formatter</span>.<span class="property">attributed</span>)
        }
    }
}

<span class="comment">// MARK: Extend `FormatStyle` to simplify access</span>

<span class="keyword">extension</span> <span class="type">FormatStyle</span> <span class="keyword">where</span> <span class="type">Self</span> == <span class="type">ToYen</span> {
    <span class="keyword">static var</span> toYen: <span class="type">ToYen</span> { .<span class="keyword">init</span>() }
}

<span class="comment">// MARK: - Usage Examples</span>

<span class="number">30</span>.<span class="call">formatted</span>(<span class="type">ToYen</span>()) <span class="comment">// "¥3,000"</span>
<span class="number">30</span>.<span class="call">formatted</span>(.<span class="dotAccess">toYen</span>) <span class="comment">// "¥3,000")</span>

<span class="number">30</span>.<span class="call">formatted</span>(.<span class="dotAccess">toYen</span>.<span class="call">locale</span>(<span class="type">Locale</span>(identifier: <span class="string">"zh_CN"</span>))) <span class="comment">// "JP¥3,000"</span>

<span class="number">30</span>.<span class="call">formatted</span>(.<span class="dotAccess">toYen</span>.<span class="property">attributed</span>)</code></pre>


