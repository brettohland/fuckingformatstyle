---
sitemap_ignore: true
---
[If you're curious, here's Apple's list of supported units.](https://developer.apple.com/documentation/foundation/dimension)

Regardless of which unit you're using, the format style has three possible widths:

| Width          | Description                                         |
| -------------- | --------------------------------------------------- |
| `.wide`        | Displays the full unit description                  |
| `.narrow`      | Displays the unit in the least number of characters |
| `.abbreviated` | Displays an abbreviated unit description            |

<pre class="splash"><code><span class="keyword token">let</span> gForce = <span class="type token">Measurement</span>(value: <span class="number token">1.0</span>, unit: <span class="type token">UnitAcceleration</span>.<span class="property token">gravity</span>)

gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>))        <span class="comment token">// "1 g-force"</span>
gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>))      <span class="comment token">// "1G"</span>
gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>)) <span class="comment token">// "1 G"</span></code></pre>

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)

gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>).<span class="call token">locale</span>(franceLocale))        <span class="comment token">// "1 fois l’accélération de pesanteur terrestre"</span>
gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>).<span class="call token">locale</span>(franceLocale))      <span class="comment token">// "1G"</span>
gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1 force g")</span></code></pre>

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword token">let</span> franceLocale = <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)

gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>).<span class="call token">locale</span>(franceLocale))        <span class="comment token">// "1 fois l’accélération de pesanteur terrestre"</span>
gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">narrow</span>).<span class="call token">locale</span>(franceLocale))      <span class="comment token">// "1G"</span>
gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">abbreviated</span>).<span class="call token">locale</span>(franceLocale)) <span class="comment token">// "1 force g"</span></code></pre>

### Initializing a Measurement Style

Due to the associated types required by the Measurement API, initializing a measurement style requires you to set the associated type.

<pre class="splash"><code><span class="keyword token">let</span> inFrench = <span class="type token">Measurement</span>&lt;<span class="type token">UnitAcceleration</span>&gt;.<span class="type token">FormatStyle</span>(
    width: .<span class="dotAccess token">wide</span>,
    locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>),
    usage: .<span class="dotAccess token">general</span>
)

inFrench.<span class="call token">format</span>(gForce)     <span class="comment token">// "1 fois l’accélération de pesanteur terrestre"</span>
gForce.<span class="call token">formatted</span>(inFrench)  <span class="comment token">// "1 fois l’accélération de pesanteur terrestre"</span></code></pre>

<h3>Attributed String Output</h3>

You can output Attributed Strings by appending the `attributed` method onto the end of the format style.

<pre class="splash"><code>gForce.<span class="call token">formatted</span>(.<span class="call token">measurement</span>(width: .<span class="dotAccess token">wide</span>).<span class="property token">attributed</span>)</code></pre>
