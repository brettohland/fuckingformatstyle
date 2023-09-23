---
sitemap_ignore: true
---

The easiest and best way to access this style is through the `.number` extension on `FormatStyle`. From there, you can use method chaining to customize the output.

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">scale</span>(<span class="number token">200.0</span>).<span class="call token">notation</span>(.<span class="dotAccess token">compactName</span>).<span class="call token">grouping</span>(.<span class="dotAccess token">automatic</span>)) <span class="comment token">// "2K"</span></code></pre>

You can also initialize an instance of `IntegerFormatStyle<Value: BinaryInteger>`, `FloatingPointFormatStyle<BinaryFloatingPoint>` or `Decimal.FormatStyle` and use method chaining to customize the output.
  
<pre class="splash"><code><span class="type token">FloatingPointFormatStyle</span>&lt;<span class="type token">Double</span>&gt;().<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>, increment: <span class="number token">1</span>).<span class="call token">format</span>(<span class="number token">10.9</span>) <span class="comment token">// "11"</span>
<span class="type token">IntegerFormatStyle</span>&lt;<span class="type token">Int</span>&gt;().<span class="call token">notation</span>(.<span class="dotAccess token">compactName</span>).<span class="call token">format</span>(<span class="number token">1_000</span>) <span class="comment token">// "1K"</span>
<span class="type token">Decimal</span>.<span class="type token">FormatStyle</span>().<span class="call token">scale</span>(<span class="number token">10</span>).<span class="call token">format</span>(<span class="number token">1</span>) <span class="comment token">// "10"</span></code></pre>

### Available Properties

| Property                                                    | Description                                                   |
| ----------------------------------------------------------- | ------------------------------------------------------------- |
| [Rounding](#numbers-rounding)                               | Customize the rounding behaviour                              |
| [Sign](#numbers-sign)                                       | Do you want to show or hide the + or - sign?                  |
| [Decimal Separator](#numbers-decimal-separator)             | Do you want to show or hide the decimal separator             |
| [Grouping](#numbers-grouping)                               | How do you want the thousands numbers to be grouped           |
| [Precision](#numbers-prescision)                            | How many fractional or significant digits do you want to show |
| [Notation](#numbers-notation)                               | Enable scientific or compact notation                         |
| [Scale](#numbers-scale)                                     | Scale the number up or down before display                    |
| [Locale](#numbers-locale)                                   | Set the `Locale` for one output                               |
| [Compositing](#numbers-compositing)                         | Mix and match any and all of the above                        |
| [AttributedString output](#numbers-attributed-string-output) | Output an `AttributedString`                                 |

<h3 id="numbers-rounding">Rounding</h3>

At its simplest, you can call the `.formatted(.number.rounded())` method on any number type (Float, Double, Decimal, or Integer) in order to get the system's default rounding behaviour.

<pre class="splash"><code><span class="type token">Double</span>(<span class="number token">1.9999999</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>())  <span class="comment token">// "2"</span>
<span class="type token">Decimal</span>(<span class="number token">1.9999999</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>()) <span class="comment token">// "2"</span>
<span class="type token">Float</span>(<span class="number token">1.9999999</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>())   <span class="comment token">// "2"</span>
<span class="type token">Int</span>(<span class="number token">1.9999999</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>())     <span class="comment token">// "1"</span></code></pre>

Using the full instance method, you can access more granular settings: `.number.rounded(rule:increment:)`.

| Rounding Rule              | Description                                                                                       |
| -------------------------- | -------------------------------------------------------------------------------------------------- |
| `.awayFromZero`            | Round to the closest allowed value whose magnitude is greater than or equal to that of the source. |
| `.down`                    | Round to the closest allowed value that is less than or equal to the source.                       |
| `.toNearestOrAwayFromZero` | Round to the closest allowed value; if two values are equally close, the one with greater          |
| `.toNearestOrEven`          | Round to the closest allowed value; if two values are equally close, the even one is chosen.      |
| `.towardZero`              | Round to the closest allowed value whose magnitude is less than or equal to that of the source.    |
| `.up`                      | Round to the closest allowed value that is greater than or equal to the source.                    |

The `increment:` parameter is a `Double` and tells the system under the hood what to round the value by.

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">0.26575467567788</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>))              <span class="comment token">// "0.265755"</span>
<span class="type token">Float</span>(<span class="number token">0.00900999876871</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>))              <span class="comment token">// "0.00901"</span>

<span class="type token">Float</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">1</span>))            <span class="comment token">// "6"</span>
<span class="type token">Float</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">10</span>))           <span class="comment token">// "10"</span>
<span class="type token">Float</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>))                                  <span class="comment token">// "0.009999"</span>
<span class="type token">Float</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>))               <span class="comment token">// "0.01"</span>
<span class="type token">Float</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>))                            <span class="comment token">// "0.009999"</span>
<span class="type token">Float</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>))                                    <span class="comment token">// "0.01"</span>
<span class="type token">Float</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>, increment: <span class="number token">1</span>))                    <span class="comment token">// "5"</span>
<span class="type token">Float</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>, increment: <span class="number token">1</span>)) <span class="comment token">// "5"</span>
<span class="type token">Float</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>, increment: <span class="number token">1</span>))              <span class="comment token">// "5"</span>
<span class="type token">Float</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>, increment: <span class="number token">1</span>))                      <span class="comment token">// "5"</span>

<span class="type token">Double</span>(<span class="number token">0.26575467567788</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>))              <span class="comment token">// "0.265755"</span>
<span class="type token">Double</span>(<span class="number token">0.00900999876871</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>))              <span class="comment token">// "0.00901"</span>
<span class="type token">Double</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">1</span>))            <span class="comment token">// "6"</span>
<span class="type token">Double</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">10</span>))           <span class="comment token">// "10"</span>
<span class="type token">Double</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>))                                  <span class="comment token">// "0.01"</span>
<span class="type token">Double</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>))               <span class="comment token">// "0.01"</span>
<span class="type token">Double</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>))                            <span class="comment token">// "0.01"</span>
<span class="type token">Double</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>))                                    <span class="comment token">// "0.01"</span>
<span class="type token">Double</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>, increment: <span class="number token">1</span>))                    <span class="comment token">// "5"</span>
<span class="type token">Double</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>, increment: <span class="number token">1</span>)) <span class="comment token">// "5"</span>
<span class="type token">Double</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>, increment: <span class="number token">1</span>))              <span class="comment token">// "5"</span>
<span class="type token">Double</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>, increment: <span class="number token">1</span>))                      <span class="comment token">// "5"</span>

<span class="type token">Decimal</span>(<span class="number token">0.26575467567788</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>))              <span class="comment token">// "0.265755"</span>
<span class="type token">Decimal</span>(<span class="number token">0.00900999876871</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>))              <span class="comment token">// "0.00901"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">1</span>))            <span class="comment token">// "6"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">awayFromZero</span>, increment: <span class="number token">10</span>))           <span class="comment token">// "10"</span>
<span class="type token">Decimal</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>))                                  <span class="comment token">// "0.01"</span>
<span class="type token">Decimal</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>))               <span class="comment token">// "0.01"</span>
<span class="type token">Decimal</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>))                            <span class="comment token">// "0.01"</span>
<span class="type token">Decimal</span>(<span class="number token">0.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>))                                    <span class="comment token">// "0.01"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">down</span>, increment: <span class="number token">1</span>))                    <span class="comment token">// "5"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">toNearestOrAwayFromZero</span>, increment: <span class="number token">1</span>)) <span class="comment token">// "5"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">towardZero</span>, increment: <span class="number token">1</span>))              <span class="comment token">// "5"</span>
<span class="type token">Decimal</span>(<span class="number token">5.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">rounded</span>(rule: .<span class="dotAccess token">up</span>, increment: <span class="number token">1</span>))                      <span class="comment token">// "5"</span></code></pre>

<h3 id="numbers-sign">Sign</h3>

Controls the visibility of the negative and positive sign.

| Sign Display Strategy     | Description                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------- |
| `.automatic`              | Displays the negative sign (-) when the number is negative. Positive sign isn't shown |
| `.never`                  | Never shows the positive (+) or negative (-) signs                                    |
| `.always(includingZero:)` | Passing in `true` will show the positive sign on a 0 value                            | 

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">1.90</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">sign</span>(strategy: .<span class="dotAccess token">never</span>))                     <span class="comment token">// "1.9"</span>
<span class="type token">Float</span>(-<span class="number token">1.90</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">sign</span>(strategy: .<span class="dotAccess token">never</span>))                    <span class="comment token">// "1.9"</span>
<span class="type token">Float</span>(<span class="number token">1.90</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">sign</span>(strategy: .<span class="dotAccess token">automatic</span>))                 <span class="comment token">// "1.9"</span>
<span class="type token">Float</span>(<span class="number token">1.90</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">sign</span>(strategy: .<span class="call token">always</span>()))                  <span class="comment token">// "+1.9"</span>
<span class="type token">Float</span>(<span class="number token">0</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">sign</span>(strategy: .<span class="call token">always</span>(includingZero: <span class="keyword token">true</span>)))  <span class="comment token">// "+0"</span>
<span class="type token">Float</span>(<span class="number token">0</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">sign</span>(strategy: .<span class="call token">always</span>(includingZero: <span class="keyword token">false</span>))) <span class="comment token">// "0"</span></code></pre>

<h3 id="numbers-decimal-separator">Decimal Separator</h3>

Controls the visibility of the decimal separator.

| Decimal Separator Display Strategy | Descriotion                                           |
| ---------------------------------- | ----------------------------------------------------- |
| `.automatic`                       | Only shows the decimal separator on fractional values |
| `.always`                          | Always shows the decimal separator                    | 

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">decimalSeparator</span>(strategy: .<span class="dotAccess token">automatic</span>)) <span class="comment token">// "10"</span>
<span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">decimalSeparator</span>(strategy: .<span class="dotAccess token">always</span>))    <span class="comment token">// "10."</span></code></pre>

<h3 id="numbers-grouping">Grouping</h3>

Controls if the thousands units are grouped or not.

| Grouping     | Descriotion                                        |
| ------------ | -------------------------------------------------- |
| `.never`     | Never group thousands digits                       |
| `.automatic` | Group the digits automatically based on the locale | 

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">1000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">grouping</span>(.<span class="dotAccess token">automatic</span>)) <span class="comment token">// "1,000"</span>
<span class="type token">Float</span>(<span class="number token">1000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">grouping</span>(.<span class="dotAccess token">never</span>))     <span class="comment token">// "1000"</span></code></pre>

<h3 id="numbers-precision">Precision</h3>

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

<pre class="splash"><code><span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span>))) <span class="comment token">// "10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">2</span>))) <span class="comment token">// "10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">3</span>))) <span class="comment token">// "10.1"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">4</span>))) <span class="comment token">// "10.10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">5</span>))) <span class="comment token">// "10.100"</span>
<span class="type token">Decimal</span>(<span class="number token">1000000.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">5</span>))) <span class="comment token">// "10.100"</span>

<span class="type token">Decimal</span>(<span class="number token">1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>)))     <span class="comment token">// "1"</span>
<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>)))    <span class="comment token">// "10"</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>)))  <span class="comment token">// "10.1"</span>
<span class="type token">Decimal</span>(<span class="number token">10.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">significantDigits</span>(<span class="number token">1</span> ... <span class="number token">3</span>))) <span class="comment token">// "10"</span>

<span class="type token">Decimal</span>(<span class="number token">10.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">1</span>))) <span class="comment token">// 10.0</span>
<span class="type token">Decimal</span>(<span class="number token">10.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">2</span>))) <span class="comment token">// 10.01</span>
<span class="type token">Decimal</span>(<span class="number token">10.01</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">3</span>))) <span class="comment token">// 10.010</span>

<span class="type token">Decimal</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">0</span>...<span class="number token">2</span>)))        <span class="comment token">// 10</span>
<span class="type token">Decimal</span>(<span class="number token">10.1</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">0</span>...<span class="number token">2</span>)))      <span class="comment token">// 10.1</span>
<span class="type token">Decimal</span>(<span class="number token">10.11</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">0</span>...<span class="number token">2</span>)))     <span class="comment token">// 10.11</span>
<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">fractionLength</span>(<span class="number token">0</span>...<span class="number token">2</span>)))    <span class="comment token">// 10.11</span>

<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">1</span>))) <span class="comment token">// 0.111</span>
<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">2</span>))) <span class="comment token">// 10.111</span>

<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">0</span>...<span class="number token">1</span>))) <span class="comment token">// .111</span>
<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">0</span>...<span class="number token">2</span>))) <span class="comment token">// 10.111</span>
<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerLength</span>(<span class="number token">0</span>...<span class="number token">3</span>))) <span class="comment token">// 10.111</span>

<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integer: <span class="number token">1</span>, fraction: <span class="number token">1</span>))) <span class="comment token">// 0.1</span>
<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integer: <span class="number token">2</span>, fraction: <span class="number token">1</span>))) <span class="comment token">// 10.1</span>
<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integer: <span class="number token">2</span>, fraction: <span class="number token">2</span>))) <span class="comment token">// 10.11</span>
<span class="type token">Decimal</span>(<span class="number token">10.111</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">precision</span>(.<span class="call token">integerAndFractionLength</span>(integer: <span class="number token">2</span>, fraction: <span class="number token">3</span>))) <span class="comment token">// 10.111</span></code></pre>

<h3 id="numbers-notation">Notation</h3>

Controls the ability to use different notation styles.

| Notation Setting | Description                                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------------------------- |
| `.automatic`     | Used primarily when compositing other styles, will choose the best notation setting for the given settings. |
| `.compactName`   | Uses the compact notation for the thousands styles                                                          |
| `.scientific`    | Uses scientific notation                                                                                    |

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">automatic</span>))   <span class="comment token">// "1,000"</span>
<span class="type token">Float</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">compactName</span>)) <span class="comment token">// "1K"</span>
<span class="type token">Float</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">scientific</span>))  <span class="comment token">// "1E3"</span></code></pre>

<h3 id="numbers-scale">Scale</h3>

Controls the scale of the number.

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">scale</span>(<span class="number token">1.0</span>))  <span class="comment token">// "10"</span>
<span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">scale</span>(<span class="number token">1.5</span>))  <span class="comment token">// "15"</span>
<span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">scale</span>(<span class="number token">2.0</span>))  <span class="comment token">// "20"</span>
<span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">scale</span>(-<span class="number token">2.0</span>)) <span class="comment token">// "-20"</span></code></pre>

<h3 id="numbers-locale">Setting the Locale</h3>

Controls the locale of the output.

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">automatic</span>).<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)))   <span class="comment token">// "1 000"</span>
<span class="type token">Float</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">compactName</span>).<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))) <span class="comment token">// "1 k"</span>
<span class="type token">Float</span>(<span class="number token">1_000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">scientific</span>).<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)))  <span class="comment token">// "1E3"</span>

<span class="type token">Float</span>(<span class="number token">1000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">grouping</span>(.<span class="dotAccess token">automatic</span>).<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>))) <span class="comment token">// "1 000"</span>
<span class="type token">Float</span>(<span class="number token">1000</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">grouping</span>(.<span class="dotAccess token">never</span>).<span class="call token">locale</span>(<span class="type token">Locale</span>(identifier: <span class="string token">"fr_FR"</span>)))     <span class="comment token">// "1000"</span></code></pre>

### Localizing Number Systems

In cases where a given `Locale` has multiple number systems available, numeric format styles will default to using the number system which matches the your system's `Locale.current` value. You're able to explicitly set the number system for the Format Style to use by initializing a new `Locale` with the number system set using the BCP-47 or ICU Identifiers:

#### [BCP-47](https://www.rfc-editor.org/info/bcp47)

<pre class="splash"><code><span class="keyword token">let</span> englishArabicBCP47 = <span class="string token">"en-u-nu-arab"</span>
<span class="keyword token">let</span> enArabBCP47 = <span class="type token">Locale</span>(identifier: englishArabicBCP47)
<span class="number token">123456</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">locale</span>(enArabBCP47)) <span class="comment token">// "١٢٣٬٤٥٦"</span>
<span class="type token">Date</span>.<span class="property token">now</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>().<span class="call token">month</span>().<span class="call token">day</span>().<span class="call token">locale</span>(enArabBCP47)) <span class="comment token">// "Sep ٢٣, ٢٠٢٣"</span></code></pre>

#### ICU

<pre class="splash"><code><span class="keyword token">let</span> englishArabicICU = <span class="string token">"en@numbers=arab"</span>
<span class="keyword token">let</span> enArabICU = <span class="type token">Locale</span>(identifier: <span class="string token">"en@numbers=arab"</span>)
<span class="number token">12345</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">locale</span>(enArabICU)) <span class="comment token">// "١٢٬٣٤٥"</span>
<span class="type token">Date</span>.<span class="property token">now</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">dateTime</span>.<span class="call token">year</span>().<span class="call token">month</span>().<span class="call token">day</span>().<span class="call token">locale</span>(enArabICU)) <span class="comment token">// "Sep ٢٣, ٢٠٢٣"</span></code></pre>


<h3 id="numbers-compositing">Compositing</h3>

Any of the above styles can be combined to fully customize the output.

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">scale</span>(<span class="number token">200.0</span>).<span class="call token">notation</span>(.<span class="dotAccess token">compactName</span>).<span class="call token">grouping</span>(.<span class="dotAccess token">automatic</span>)) <span class="comment token">// "2K"</span></code></pre>

<h3 id="numbers-attributed-string-output">Attributed String Output</h3>

Outputs and `AttributedString` instead of a `String`.

<pre class="splash"><code><span class="type token">Float</span>(<span class="number token">10</span>).<span class="call token">formatted</span>(.<span class="dotAccess token">number</span>.<span class="call token">scale</span>(<span class="number token">200.0</span>).<span class="call token">notation</span>(.<span class="dotAccess token">compactName</span>).<span class="call token">grouping</span>(.<span class="dotAccess token">automatic</span>).<span class="property token">attributed</span>)</code></pre>

### Parsing Numbers From Strings

Each of Swift's build-in numeric types supports the parsing of numeric string into their respective types.

<pre class="splash"><code><span class="comment token">// MARK: Parsing Integers</span>
<span class="keyword token">try</span>? <span class="type token">Int</span>(<span class="string token">"120"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 120</span>
<span class="keyword token">try</span>? <span class="type token">Int</span>(<span class="string token">"0.25"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 0</span>
<span class="keyword token">try</span>? <span class="type token">Int</span>(<span class="string token">"1E5"</span>, format: .<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">scientific</span>)) <span class="comment token">// 100000

// MARK: Parsing Floating Point Numbers</span>
<span class="keyword token">try</span>? <span class="type token">Double</span>(<span class="string token">"0.0025"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 0.0025</span>
<span class="keyword token">try</span>? <span class="type token">Double</span>(<span class="string token">"95%"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 95</span>
<span class="keyword token">try</span>? <span class="type token">Double</span>(<span class="string token">"1E5"</span>, format: .<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">scientific</span>)) <span class="comment token">// 100000</span>

<span class="keyword token">try</span>? <span class="type token">Float</span>(<span class="string token">"0.0025"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 0.0025</span>
<span class="keyword token">try</span>? <span class="type token">Float</span>(<span class="string token">"95%"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 95</span>
<span class="keyword token">try</span>? <span class="type token">Float</span>(<span class="string token">"1E5"</span>, format: .<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">scientific</span>)) <span class="comment token">// 100000

// MARK: - Parsing Decimals</span>
<span class="keyword token">try</span>? <span class="type token">Decimal</span>(<span class="string token">"0.0025"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 0.0025</span>
<span class="keyword token">try</span>? <span class="type token">Decimal</span>(<span class="string token">"95%"</span>, format: .<span class="dotAccess token">number</span>) <span class="comment token">// 95</span>
<span class="keyword token">try</span>? <span class="type token">Decimal</span>(<span class="string token">"1E5"</span>, format: .<span class="dotAccess token">number</span>.<span class="call token">notation</span>(.<span class="dotAccess token">scientific</span>)) <span class="comment token">// 100000</span></code></pre>
