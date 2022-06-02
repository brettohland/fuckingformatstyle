---
---
[If you're curious, here's Apple's list of supported units.](https://developer.apple.com/documentation/foundation/dimension)

Regardless of which unit you're using, the format style has three possible widths:

| Width          | Description                                         |
| -------------- | --------------------------------------------------- |
| `.wide`        | Displays the full unit description                  |
| `.narrow`      | Displays the unit in the least number of characters |
| `.abbreviated` | Displays an abbreviated unit description            |

<pre class="splash"><code><span class="keyword">let</span> gForce = <span class="type">Measurement</span>(value: <span class="number">1.0</span>, unit: <span class="type">UnitAcceleration</span>.<span class="property">gravity</span>)

gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">wide</span>))        <span class="comment">// "1 g-force"</span>
gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">narrow</span>))      <span class="comment">// "1G"</span>
gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">abbreviated</span>)) <span class="comment">// "1 G"</span></code></pre>

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)

gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">wide</span>).<span class="call">locale</span>(franceLocale))        <span class="comment">// "1 fois l’accélération de pesanteur terrestre"</span>
gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">narrow</span>).<span class="call">locale</span>(franceLocale))      <span class="comment">// "1G"</span>
gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">abbreviated</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "1 force g")</span></code></pre>

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)

gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">wide</span>).<span class="call">locale</span>(franceLocale))        <span class="comment">// "1 fois l’accélération de pesanteur terrestre"</span>
gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">narrow</span>).<span class="call">locale</span>(franceLocale))      <span class="comment">// "1G"</span>
gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">abbreviated</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "1 force g"</span></code></pre>`

### Initializing a Measurement Style

Due to the associated types required by the Measurement API, initializing a measurement style requires you to set the associated type.

<pre class="splash"><code><span class="keyword">let</span> inFrench = <span class="type">Measurement</span>&lt;<span class="type">UnitAcceleration</span>&gt;.<span class="type">FormatStyle</span>(
    width: .<span class="dotAccess">wide</span>,
    locale: <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>),
    usage: .<span class="dotAccess">general</span>
)

inFrench.<span class="call">format</span>(gForce)     <span class="comment">// "1 fois l’accélération de pesanteur terrestre"</span>
gForce.<span class="call">formatted</span>(inFrench)  <span class="comment">// "1 fois l’accélération de pesanteur terrestre"</span></code></pre>

<h3>Attributed String Output</h3>

You can output Attributed Strings by appending the `attributed` method onto the end of the format style.

<pre class="splash"><code>gForce.<span class="call">formatted</span>(.<span class="call">measurement</span>(width: .<span class="dotAccess">wide</span>).<span class="property">attributed</span>)</code></pre>
