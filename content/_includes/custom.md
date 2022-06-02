---
sitemap_ignore: true
---
As a protocol, `FormatStyle` is quite simple to conform to:

<pre class="splash"><code><span class="comment token">/// A type that can convert a given data type into a representation.</span>
<span class="keyword token">@available</span>(macOS <span class="number token">12.0</span>, iOS <span class="number token">15.0</span>, tvOS <span class="number token">15.0</span>, watchOS <span class="number token">8.0</span>, *)
<span class="keyword token">public protocol</span> FormatStyle : <span class="type token">Decodable</span>, <span class="type token">Encodable</span>, <span class="type token">Hashable</span> {

    <span class="comment token">/// The type of data to format.</span>
    <span class="keyword token">associatedtype</span> FormatInput

    <span class="comment token">/// The type of the formatted data.</span>
    <span class="keyword token">associatedtype</span> FormatOutput

    <span class="comment token">/// Creates a `FormatOutput` instance from `value`.</span>
    <span class="keyword token">func</span> format(<span class="keyword token">_</span> value: <span class="type token">Self</span>.<span class="type token">FormatInput</span>) -&gt; <span class="type token">Self</span>.<span class="type token">FormatOutput</span>

    <span class="comment token">/// If the format allows selecting a locale, returns a copy of this format with the new locale set. Default implementation returns an unmodified self.</span>
    <span class="keyword token">func</span> locale(<span class="keyword token">_</span> locale: <span class="type token">Locale</span>) -&gt; <span class="type token">Self</span>
}</code></pre>

Essentially, this provides you with the ability to convert any data type into any other data type or representation.

An example of a custom Format Style that features locale, attributed string output, as well as a `FormatStyle` extension.

<pre class="splash"><code><span class="keyword token">struct</span> ToYen: <span class="type token">FormatStyle</span> {
    <span class="keyword token">typealias</span> FormatInput = <span class="type token">Int</span>
    <span class="keyword token">typealias</span> FormatOutput = <span class="type token">String</span>

    <span class="keyword token">static let</span> multiplier = <span class="number token">100</span>
    <span class="keyword token">static let</span> yenCurrencyCode = <span class="string token">"jpy"</span>

    <span class="keyword token">let</span> formatter: <span class="type token">IntegerFormatStyle</span>&lt;<span class="type token">Int</span>&gt;.<span class="type token">Currency</span>

    <span class="keyword token">var</span> attributed: <span class="type token">ToYen</span>.<span class="type token">AttributedStyle</span> = <span class="type token">AttributedStyle</span>()

    <span class="keyword token">init</span>(locale: <span class="type token">Locale</span>? = <span class="keyword token">nil</span>) {
        formatter = <span class="type token">IntegerFormatStyle</span>&lt;<span class="type token">Int</span>&gt;.<span class="type token">Currency</span>(code: <span class="type token">Self</span>.<span class="property token">yenCurrencyCode</span>, locale: locale ?? <span class="type token">Locale</span>.<span class="property token">current</span>)
    }

    <span class="keyword token">func</span> format(<span class="keyword token">_</span> value: <span class="type token">Int</span>) -&gt; <span class="type token">String</span> {
        (value * <span class="type token">Self</span>.<span class="property token">multiplier</span>).<span class="call token">formatted</span>(formatter)
    }

    <span class="comment token">// This is optional.</span>
    <span class="keyword token">func</span> locale(<span class="keyword token">_</span> locale: <span class="type token">Locale</span>) -&gt; <span class="type token">ToYen</span> {
        .<span class="keyword token">init</span>(locale: locale)
    }
}

<span class="comment token">// MARK: Add Attributed Style support</span>

<span class="keyword token">extension</span> <span class="type token">ToYen</span> {
    <span class="keyword token">struct</span> AttributedStyle: <span class="type token">FormatStyle</span> {
        <span class="keyword token">typealias</span> FormatInput = <span class="type token">Int</span>
        <span class="keyword token">typealias</span> FormatOutput = <span class="type token">AttributedString</span>

        <span class="keyword token">func</span> format(<span class="keyword token">_</span> value: <span class="type token">Int</span>) -&gt; <span class="type token">AttributedString</span> {
            (value * <span class="type token">ToYen</span>.<span class="property token">multiplier</span>).<span class="call token">formatted</span>(<span class="type token">ToYen</span>().<span class="property token">formatter</span>.<span class="property token">attributed</span>)
        }
    }
}

<span class="comment token">// MARK: Extend `FormatStyle` to simplify access</span>

<span class="keyword token">extension</span> <span class="type token">FormatStyle</span> <span class="keyword token">where</span> <span class="type token">Self</span> == <span class="type token">ToYen</span> {
    <span class="keyword token">static var</span> toYen: <span class="type token">ToYen</span> { .<span class="keyword token">init</span>() }
}

<span class="comment token">// MARK: - Usage Examples</span>

<span class="number token">30</span>.<span class="call token">formatted</span>(<span class="type token">ToYen</span>()) <span class="comment token">// "¥3,000"</span>
<span class="number token">30</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">toYen</span>) <span class="comment token">// "¥3,000")</span>

<span class="number token">30</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">toYen</span>.<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"zh_CN"</span>))) <span class="comment token">// "JP¥3,000"</span>

<span class="number token">30</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">toYen</span>.<span class="property token">attributed</span>)</code></pre>


