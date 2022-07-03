---
sitemap_ignore: true
---
As a protocol, `FormatStyle` is quite simple to conform to:

<pre class="splash"><code><span class="comment token">/// A type that can convert a given data type into a representation</span>
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

Here's an example of a custom type (an [ISBN](https://en.wikipedia.org/wiki/ISBN)) that supports `FormatStyle`, `ParseableFormatStyle`, and can output `AttributedString` values.

[Read the blog post for more details](https://ampersandsoftworks.com/posts/formatstyle-parseableformatstyle-and-your-custom-types/)

[Download the Xcode Playground](https://github.com/brettohland/ISBN-FormatStyle/) or [See everything as a Gist](https://gist.github.com/brettohland/744fcbd2a8aa77907ec84a286e8da3b0)

### Defining Our ISBN

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "2.ISBN.swift" >}}

#### Creating Our FormatStyle

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "3.ISBN+FormatStyle.swift" >}}

#### Adding AttributedString Output

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "4.ISBN+AttributedStringFormatStyle.swift" >}}

#### Conforming to ParseableFormatStyle

{{< gist brettohland 744fcbd2a8aa77907ec84a286e8da3b0 "5.ISBN+ParseableFormatStyle.swift" >}}
