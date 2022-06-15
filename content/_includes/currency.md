---
sitemap_ignore: true
---
The easiest and best way to access this style is through the `.currency(code:)` extension on `FormatStyle`. From there, you can use method chaining to customize the output.

<pre class="splash"><code><span class="number token">10</span>.<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"JPY"</span>)) <span class="comment token">// "10%"</span></code></pre>

You can also initialize an instance of `IntegerFormatStyle<Value: BinaryInteger>.Percent`, `FloatingPointFormatStyle<BinaryFloatingPoint>.Percent` or `Decimal.FormatStyle.Percent` and use method chaining to customize the output.
  
<pre class="splash"><code><span class="type token">FloatingPointFormatStyle</span>&lt;<span class="type token">Double</span>&gt;.<span class="type token">Currency</span>(code: <span class="string token">"JPY"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>, increment: <span class="number token">1</span>).<span class="call token">format</span>(<span class="number token">10.9</span>) <span class="comment token">// ¥11"</span>
<span class="type token">IntegerFormatStyle</span>&lt;<span class="type token">Int</span>&gt;.<span class="type token">Currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>).<span class="call token">format</span>(<span class="number token">42</span>) <span class="comment token">// "42.00 British pounds"</span>
<span class="type token">Decimal</span>.<span class="type token">FormatStyle</span>.<span class="type token">Currency</span>(code: <span class="string token">"USD"</span>).<span class="call token">scale</span>(<span class="number token">12</span>).<span class="call token">format</span>(<span class="number token">0.1</span>) <span class="comment token">// "$1.20"</span></code></pre>

### Available Properties

| Property                                                      | Description                                                   |
| ------------------------------------------------------------- | ------------------------------------------------------------- |
| [Rounding](#currency-rounding)                                | Customize the rounding behaviour                              |
| [Sign](#currency-sign)                                        | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](#currency-decimal-separator)              | Do you want to show or hide the decimal separator             |
| [Grouping](#currency-grouping)                                | How do you want the thousands numbers to be grouped           |
| [Precision](#currency-prescision)                             | How many fractional or significant digits do you want to show |
| [Presentation](#currency-presentation)                        | Controls the style of the displayed currency                  |
| [Scale](#currency-scale)                                      | Scale the number up or down before display                    |
| [Locale](#currency-locale)                                    | Set the `Locale` for one output                               |
| [Compositing](#currency-compositing)                          | Mix and match any and all of the above                        |
| [AttributedString output](#currency-attributed-string-output) | Output an `AttributedString`                                  |

<h3 id="currency-rounding">Rounding</h3>

At its simplest, you can call the `.formatted(.number.rounded())` method on any number type (Float, Double, Decimal, or Integer) in order to get the system's default rounding behaviour.

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">0.59</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>())   <span class="comment token">// "£0.59"</span>
<span class="type token">Decimal</span>(<span class="number token">0.599</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>())  <span class="comment token">// "£0.60"</span>
<span class="type token">Decimal</span>(<span class="number token">0.5999</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>()) <span class="comment token">// "£0.60"</span></code></pre>

Using the full instance method, you can access more granular settings: `.number.rounded(rule:increment:)`.

| Rounding Rule              | Description                                                                                        |
| -------------------------- | -------------------------------------------------------------------------------------------------- |
| `.awayFromZero`            | Round to the closest allowed value whose magnitude is greater than or equal to that of the source. |
| `.down`                    | Round to the closest allowed value that is less than or equal to the source.                       |
| `.toNearestOrAwayFromZero` | Round to the closest allowed value; if two values are equally close, the one with greater          |
| `.toNearestOrEven`          | Round to the closest allowed value; if two values are equally close, the even one is chosen.      |
| `.towardZero`              | Round to the closest allowed value whose magnitude is less than or equal to that of the source.    |
| `.up`                      | Round to the closest allowed value that is greater than or equal to the source.                    |

The `increment:` parameter is a `Double` and tells the system under the hood what to round the value by.

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">0.59</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>())   <span class="comment token">// "£0.59"</span>
<span class="type token">Decimal</span>(<span class="number token">0.599</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>())  <span class="comment token">// "£0.60"</span>
<span class="type token">Decimal</span>(<span class="number token">0.5999</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>()) <span class="comment token">// "£0.60"</span>

<span class="type token">Decimal</span>(<span class="number token">5.001</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>)) <span class="comment token">// "£5.01"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>))  <span class="comment token">// "£5.01"</span>

<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">1</span>))  <span class="comment token">// "£6"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">10</span>)) <span class="comment token">// "£10"</span>

<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>))                    <span class="comment token">// "£5.00"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>)) <span class="comment token">// "£5.01"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>))              <span class="comment token">// "£5.00"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>))                      <span class="comment token">// "£5.01"</span>

<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>, increment: <span class="number token">1</span>)) <span class="comment token">// "£5"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>, increment: <span class="number token">1</span>)) <span class="comment token">// "£5"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>, increment: <span class="number token">1</span>)) <span class="comment token">// "£5"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>, increment: <span class="number token">1</span>)) <span class="comment token">// "£5"</span></code></pre>

<h3 id="currency-sign">Sign</h3>

Controls the visibility of the negative and positive sign.

| Sign Display Strategy          | Description                                                            |
| ------------------------------ | ---------------------------------------------------------------------- |
| `.automatic`                   | Automatically desides which strategy to use                            |
| `.never`                       | Never shows the positive (+) or negative (-) signs                     |
| `.always()`                    | Always shows the positive (+) or negative (-) signs                    |
| `.always(showsZero:)`          | Accepts a `Bool`, and controls if a `0` value gets a positive (+) sign |
| `.accountingAlways()`          | Uses the standardized account style for numbers                        |
| `.accountingAlways(showsZero)` | Accepts a `Bool`, and controls if a `0` value gets a positive (+) sign | 

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="dotAccess token">automatic</span>))                         <span class="comment token">// "£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="dotAccess token">never</span>))                             <span class="comment token">// "£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="dotAccess token">accounting</span>))                        <span class="comment token">// "£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="call token">accountingAlways</span>()))                <span class="comment token">// "+£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="call token">accountingAlways</span>(showZero: <span class="keyword token">true</span>)))  <span class="comment token">// "+£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="call token">accountingAlways</span>(showZero: <span class="keyword token">false</span>))) <span class="comment token">// "+£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="call token">always</span>()))                          <span class="comment token">// "+£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="call token">always</span>(showZero: <span class="keyword token">true</span>)))            <span class="comment token">// "+£7.00"</span>
<span class="type token">Decimal</span>(<span class="number token">7</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">sign</span>(strategy: .<span class="call token">always</span>(showZero: <span class="keyword token">false</span>)))           <span class="comment token">// "+£7.00"</span></code></pre>

<h3 id="currency-decimal-separator">Decimal Separator</h3>

Controls the visibility of the decimal separator.

| Decimal Separator Display Strategy | Descriotion                                           |
| ---------------------------------- | ----------------------------------------------------- |
| `.automatic`                       | Only shows the decimal separator on fractional values |
| `.always`                          | Always shows the decimal separator                    | 

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">3000</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">decimalSeparator</span>(strategy: .<span class="dotAccess token">automatic</span>)) <span class="comment token">// "£3,000.00"</span>
<span class="type token">Decimal</span>(<span class="number token">3000</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">decimalSeparator</span>(strategy: .<span class="dotAccess token">always</span>))    <span class="comment token">// "£3,000.00"</span></code></pre>

<h3 id="currency-grouping">Grouping</h3>

Controls if the thousands units are grouped or not.

| Grouping  | Descriotion                   |
| --------- | ----------------------------- |
| `.never`  | Never group thousands digits  |
| `.always` | Always group thousands digits | 

<pre class="splash"><code><span class="type token">Int</span>(<span class="number token">3_000</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">grouping</span>(.<span class="dotAccess token">never</span>))     <span class="comment token">// "£3000.00"</span>
<span class="type token">Int</span>(<span class="number token">3_000</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">grouping</span>(.<span class="dotAccess token">automatic</span>)) <span class="comment token">// "£3,000.00"</span></code></pre>

<h3 id="currency-precision">Precision</h3>

There are seven options to set the precision of the output.

| Precision Option                               | Description                                                    |
| ---------------------------------------------- | -------------------------------------------------------------- |
| `.significantDigits(Int)`                      | Sets a fixed number of significant digits to show              |
| `.significantDigits(Range)`                    | Sets a range of significant digits to show                     |
| `.fractionLength(Int)`                         | Sets the number digits after the decimal separator             |
| `.fractionLength(Range)`                       | Sets a range of digits to show after the decimal separator     |
| `.integerLength(Int)`                          | Sets the number of digits to show before the decimal separator |
| `.integerLength(Range)`                        | Sets a range of digits to show before the decimal separator    |
| `.integerAndFractionLength(integer:fraction:)` | Sets both the integer and fractional digits to display         |
|                                                |                                                                |

<pre class="splash"><code><span class="comment token">// Please don't use Floating point numbers to store currency. Please.</span>
<span class="type token">Float</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">4</span>))) <span class="comment token">// "£3,000.0029" &lt;- This is why</span>
<span class="type token">Float</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">1</span> ... <span class="number token">4</span>))) <span class="comment token">// "£3,000.0029"</span>

<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">4</span>)))       <span class="comment token">// "£3,000.0029"</span>
<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">1</span> ... <span class="number token">4</span>))) <span class="comment token">// "£3,000.0029"</span>

<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">3</span>))) <span class="comment token">// "£000.00"</span>
<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">4</span>))) <span class="comment token">// "£3,000.00"</span>
<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">5</span>))) <span class="comment token">// "£03,000.00"</span>

<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">0</span>...<span class="number token">3</span>))) <span class="comment token">// "£.00"</span>
<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">0</span>...<span class="number token">4</span>))) <span class="comment token">// "£3,000.00"</span>
<span class="type token">Decimal</span>(<span class="number token">3_000</span>.<span class="number token">003</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">0</span>...<span class="number token">5</span>))) <span class="comment token">// "£03,000.00"</span>

<span class="type token">Decimal</span>(<span class="number token">3</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integer: <span class="number token">4</span>, fraction: <span class="number token">4</span>))) <span class="comment token">// "£0,003.0000"</span>
<span class="type token">Decimal</span>(<span class="number token">3</span>).<span class="call token">formatted</span>(
    .<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>)
    .<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integerLimits: <span class="number token">1</span> ... <span class="number token">5</span>, fractionLimits: <span class="number token">1</span> ... <span class="number token">5</span>))
) <span class="comment token">// "£3.0"</span>
<span class="type token">Decimal</span>(<span class="number token">3.00004</span>).<span class="call token">formatted</span>(
    .<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>)
    .<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integerLimits: <span class="number token">1</span> ... <span class="number token">5</span>, fractionLimits: <span class="number token">1</span> ... <span class="number token">5</span>))
) <span class="comment token">// "£3.00004"</span>
<span class="type token">Decimal</span>(<span class="number token">3.000000004</span>).<span class="call token">formatted</span>(
    .<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>)
    .<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integerLimits: <span class="number token">1</span> ... <span class="number token">5</span>, fractionLimits: <span class="number token">1</span> ... <span class="number token">5</span>))
)
<span class="type token">Decimal</span>(<span class="number token">30000.01</span>).<span class="call token">formatted</span>(
    .<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>)
    .<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integerLimits: <span class="number token">1</span> ... <span class="number token">5</span>, fractionLimits: <span class="number token">1</span> ... <span class="number token">5</span>))
) <span class="comment token">// "£30,000.01"</span>
<span class="type token">Decimal</span>(<span class="number token">3000000.000001</span>).<span class="call token">formatted</span>(
    .<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>)
    .<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integerLimits: <span class="number token">1</span> ... <span class="number token">5</span>, fractionLimits: <span class="number token">1</span> ... <span class="number token">5</span>))
) <span class="comment token">// "£0.0"</span>

<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span>))) <span class="comment token">// "£10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">2</span>))) <span class="comment token">// "£10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">3</span>))) <span class="comment token">// "£10.1"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">4</span>))) <span class="comment token">// "£10.10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">5</span>))) <span class="comment token">// "£10.100"</span>

<span class="type token">Decimal</span>(<span class="number token">1</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>)))     <span class="comment token">// "£1"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>)))    <span class="comment token">// "£10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>)))  <span class="comment token">// "£10.1"</span>
<span class="type token">Decimal</span>(<span class="number token">10.01</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>))) <span class="comment token">// "£10"</span></code></pre>

<h3 id="currency-presentation">Presentation</h3>

Controls how verbose the currency display is when being presented

| Presentation Setting | Description                                               |
| -------------------- | --------------------------------------------------------- |
| `.fullName`          | Writes out the currency value in full                     |
| `.isoCode`           | Uses the ISO 4217 currency code for display               |
| `.narrow`            | Fits the string in the smallest horizontal space possible |
| `.standard`          | The default output style                                  | 

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>)) <span class="comment token">// "10.00 British pounds"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">presentation</span>(.<span class="dotAccess token">isoCode</span>))  <span class="comment token">// "GBP 10.00"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">presentation</span>(.<span class="dotAccess token">narrow</span>))   <span class="comment token">// "£10.00"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">presentation</span>(.<span class="dotAccess token">standard</span>)) <span class="comment token">// "£10.00"</span></code></pre>

<h3 id="currency-scale">Scale</h3>

Controls the scale of the number.

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">scale</span>(<span class="number token">1</span>))    <span class="comment token">// "£10.00"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">scale</span>(<span class="number token">1.5</span>))  <span class="comment token">// "£15.00"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">scale</span>(-<span class="number token">1.5</span>)) <span class="comment token">// "-£15.00"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">scale</span>(<span class="number token">10</span>))   <span class="comment token">// "£100.00"</span></code></pre>

<h3 id="currency-locale">Setting the Locale</h3>

Controls the locale of the output.

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>).<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))) <span class="comment token">// "10,00 livres sterling"</span></code></pre>

<h3 id="currency-compositing">Compositing</h3>

Any of the above styles can be combined to fully customize the output.

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">scale</span>(<span class="number token">200.0</span>).<span class="call token">sign</span>(strategy: .<span class="call token">always</span>()).<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>)) <span class="comment token">// "+2,000.00 British pounds"</span></code></pre>

<h3 id="currency-attributed-string-output">Attributed String Output</h3>

Outputs and `AttributedString` instead of a `String`.

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="call token">currency</span>(code: <span class="string token">"GBP"</span>).<span class="call token">scale</span>(<span class="number token">200.0</span>).<span class="call token">sign</span>(strategy: .<span class="call token">always</span>()).<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>).<span class="property token">attributed</span>)</code></pre>

### Parsing Currencies From Strings

{{< hint type=important >}}

Only the `Decimal.FormatStyle.Currency` conforms to `ParseableFormatStyle`, and thus is the only built-in type that can be parsed from strings.

{{< /hint >}}

<pre class="splash"><code><span class="keyword token">try</span>? <span class="type token">Decimal</span>.<span class="type token">FormatStyle</span>.<span class="type token">Currency</span>(code: <span class="string token">"GBP"</span>)
    .<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>)
    .<span class="dotAccess token">parseStrategy</span>.<span class="call token">parse</span>(<span class="string token">"10.00 British pounds"</span>) <span class="comment token">// 10</span>

<span class="keyword token">try</span>? <span class="type token">Decimal</span>.<span class="type token">FormatStyle</span>.<span class="type token">Currency</span>(code: <span class="string token">"GBP"</span>, locale: <span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))
    .<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>)
    .<span class="dotAccess token">parseStrategy</span>.<span class="call token">parse</span>(<span class="string token">"10,00 livres sterling"</span>) <span class="comment token">// 10</span>

<span class="keyword token">try</span>? <span class="type token">Decimal</span>.<span class="type token">FormatStyle</span>.<span class="type token">Currency</span>(code: <span class="string token">"GBP"</span>)
    .<span class="call token">presentation</span>(.<span class="dotAccess token">fullName</span>)
    .<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))
    .<span class="dotAccess token">parseStrategy</span>.<span class="call token">parse</span>(<span class="string token">"10,00 livres sterling"</span>) <span class="comment token">// 10</span>

<span class="keyword token">try</span>? <span class="type token">Decimal</span>(<span class="string token">"10.00 British pounds"</span>, strategy: <span class="type token">Decimal</span>.<span class="type token">FormatStyle</span>.<span class="type token">Currency</span>(code: <span class="string token">"GBP"</span>).<span class="property token">parseStrategy</span>) <span class="comment token">// 10</span>
<span class="keyword token">try</span>? <span class="type token">Decimal</span>(<span class="string token">"10.00 British pounds"</span>, format: <span class="type token">Decimal</span>.<span class="type token">FormatStyle</span>.<span class="type token">Currency</span>(code: <span class="string token">"GBP"</span>)) <span class="comment token">// 10</span></code></pre>
