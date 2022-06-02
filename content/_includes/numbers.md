---
sitemap_ignore: true
---
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

<pre class="splash"><code><span class="type">Double</span>(<span class="number">1.9999999</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>())  <span class="comment">// "2"</span>
<span class="type">Decimal</span>(<span class="number">1.9999999</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>()) <span class="comment">// "2"</span>
<span class="type">Float</span>(<span class="number">1.9999999</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>())   <span class="comment">// "2"</span>
<span class="type">Int</span>(<span class="number">1.9999999</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>())     <span class="comment">// "1"</span></code></pre>

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

<pre class="splash"><code><span class="type">Float</span>(<span class="number">0.26575467567788</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>))              <span class="comment">// "0.265755"</span>
<span class="type">Float</span>(<span class="number">0.00900999876871</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>))              <span class="comment">// "0.00901"</span>

<span class="type">Float</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>, increment: <span class="number">1</span>))            <span class="comment">// "6"</span>
<span class="type">Float</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>, increment: <span class="number">10</span>))           <span class="comment">// "10"</span>
<span class="type">Float</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">down</span>))                                  <span class="comment">// "0.009999"</span>
<span class="type">Float</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">toNearestOrAwayFromZero</span>))               <span class="comment">// "0.01"</span>
<span class="type">Float</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">towardZero</span>))                            <span class="comment">// "0.009999"</span>
<span class="type">Float</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">up</span>))                                    <span class="comment">// "0.01"</span>
<span class="type">Float</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">down</span>, increment: <span class="number">1</span>))                    <span class="comment">// "5"</span>
<span class="type">Float</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">toNearestOrAwayFromZero</span>, increment: <span class="number">1</span>)) <span class="comment">// "5"</span>
<span class="type">Float</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">towardZero</span>, increment: <span class="number">1</span>))              <span class="comment">// "5"</span>
<span class="type">Float</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">up</span>, increment: <span class="number">1</span>))                      <span class="comment">// "5"</span>

<span class="type">Double</span>(<span class="number">0.26575467567788</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>))              <span class="comment">// "0.265755"</span>
<span class="type">Double</span>(<span class="number">0.00900999876871</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>))              <span class="comment">// "0.00901"</span>
<span class="type">Double</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>, increment: <span class="number">1</span>))            <span class="comment">// "6"</span>
<span class="type">Double</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>, increment: <span class="number">10</span>))           <span class="comment">// "10"</span>
<span class="type">Double</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">down</span>))                                  <span class="comment">// "0.01"</span>
<span class="type">Double</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">toNearestOrAwayFromZero</span>))               <span class="comment">// "0.01"</span>
<span class="type">Double</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">towardZero</span>))                            <span class="comment">// "0.01"</span>
<span class="type">Double</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">up</span>))                                    <span class="comment">// "0.01"</span>
<span class="type">Double</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">down</span>, increment: <span class="number">1</span>))                    <span class="comment">// "5"</span>
<span class="type">Double</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">toNearestOrAwayFromZero</span>, increment: <span class="number">1</span>)) <span class="comment">// "5"</span>
<span class="type">Double</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">towardZero</span>, increment: <span class="number">1</span>))              <span class="comment">// "5"</span>
<span class="type">Double</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">up</span>, increment: <span class="number">1</span>))                      <span class="comment">// "5"</span>

<span class="type">Decimal</span>(<span class="number">0.26575467567788</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>))              <span class="comment">// "0.265755"</span>
<span class="type">Decimal</span>(<span class="number">0.00900999876871</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>))              <span class="comment">// "0.00901"</span>
<span class="type">Decimal</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>, increment: <span class="number">1</span>))            <span class="comment">// "6"</span>
<span class="type">Decimal</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">awayFromZero</span>, increment: <span class="number">10</span>))           <span class="comment">// "10"</span>
<span class="type">Decimal</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">down</span>))                                  <span class="comment">// "0.01"</span>
<span class="type">Decimal</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">toNearestOrAwayFromZero</span>))               <span class="comment">// "0.01"</span>
<span class="type">Decimal</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">towardZero</span>))                            <span class="comment">// "0.01"</span>
<span class="type">Decimal</span>(<span class="number">0.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">up</span>))                                    <span class="comment">// "0.01"</span>
<span class="type">Decimal</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">down</span>, increment: <span class="number">1</span>))                    <span class="comment">// "5"</span>
<span class="type">Decimal</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">toNearestOrAwayFromZero</span>, increment: <span class="number">1</span>)) <span class="comment">// "5"</span>
<span class="type">Decimal</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">towardZero</span>, increment: <span class="number">1</span>))              <span class="comment">// "5"</span>
<span class="type">Decimal</span>(<span class="number">5.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">rounded</span>(rule: .<span class="dotAccess">up</span>, increment: <span class="number">1</span>))                      <span class="comment">// "5"</span></code></pre>

<h3 id="numbers-sign">Sign</h3>

Controls the visibility of the negative and positive sign.

| Sign Display Strategy     | Description                                                                           |
| ------------------------- | ------------------------------------------------------------------------------------- |
| `.automatic`              | Displays the negative sign (-) when the number is negative. Positive sign isn't shown |
| `.never`                  | Never shows the positive (+) or negative (-) signs                                    |
| `.always(includingZero:)` | Passing in `true` will show the positive sign on a 0 value                            | 

<pre class="splash"><code><span class="type">Float</span>(<span class="number">1.90</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">sign</span>(strategy: .<span class="dotAccess">never</span>))                     <span class="comment">// "1.9"</span>
<span class="type">Float</span>(-<span class="number">1.90</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">sign</span>(strategy: .<span class="dotAccess">never</span>))                    <span class="comment">// "1.9"</span>
<span class="type">Float</span>(<span class="number">1.90</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">sign</span>(strategy: .<span class="dotAccess">automatic</span>))                 <span class="comment">// "1.9"</span>
<span class="type">Float</span>(<span class="number">1.90</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">sign</span>(strategy: .<span class="call">always</span>()))                  <span class="comment">// "+1.9"</span>
<span class="type">Float</span>(<span class="number">0</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">sign</span>(strategy: .<span class="call">always</span>(includingZero: <span class="keyword">true</span>)))  <span class="comment">// "+0"</span>
<span class="type">Float</span>(<span class="number">0</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">sign</span>(strategy: .<span class="call">always</span>(includingZero: <span class="keyword">false</span>))) <span class="comment">// "0"</span></code></pre>

<h3 id="numbers-decimal-separator">Decimal Separator</h3>

Controls the visibility of the decimal separator.

| Decimal Separator Display Strategy | Descriotion                                           |
| ---------------------------------- | ----------------------------------------------------- |
| `.automatic`                       | Only shows the decimal separator on fractional values |
| `.always`                          | Always shows the decimal separator                    | 

<pre class="splash"><code><span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">decimalSeparator</span>(strategy: .<span class="dotAccess">automatic</span>)) <span class="comment">// "10"</span>
<span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">decimalSeparator</span>(strategy: .<span class="dotAccess">always</span>))    <span class="comment">// "10."</span></code></pre>

<h3 id="numbers-grouping">Grouping</h3>

Controls if the thousands units are grouped or not.

| Grouping  | Descriotion                   |
| --------- | ----------------------------- |
| `.never`  | Never group thousands digits  |
| `.always` | Always group thousands digits | 

<pre class="splash"><code><span class="type">Float</span>(<span class="number">1000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">grouping</span>(.<span class="dotAccess">automatic</span>)) <span class="comment">// "1,000"</span>
<span class="type">Float</span>(<span class="number">1000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">grouping</span>(.<span class="dotAccess">never</span>))     <span class="comment">// "1000"</span></code></pre>

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

<pre class="splash"><code><span class="type">Decimal</span>(<span class="number">10.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">1</span>))) <span class="comment">// "10"</span>
<span class="type">Decimal</span>(<span class="number">10.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">2</span>))) <span class="comment">// "10"</span>
<span class="type">Decimal</span>(<span class="number">10.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">3</span>))) <span class="comment">// "10.1"</span>
<span class="type">Decimal</span>(<span class="number">10.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">4</span>))) <span class="comment">// "10.10"</span>
<span class="type">Decimal</span>(<span class="number">10.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">5</span>))) <span class="comment">// "10.100"</span>
<span class="type">Decimal</span>(<span class="number">1000000.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">5</span>))) <span class="comment">// "10.100"</span>

<span class="type">Decimal</span>(<span class="number">1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">1</span> ... <span class="number">3</span>)))     <span class="comment">// "1"</span>
<span class="type">Decimal</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">1</span> ... <span class="number">3</span>)))    <span class="comment">// "10"</span>
<span class="type">Decimal</span>(<span class="number">10.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">1</span> ... <span class="number">3</span>)))  <span class="comment">// "10.1"</span>
<span class="type">Decimal</span>(<span class="number">10.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">significantDigits</span>(<span class="number">1</span> ... <span class="number">3</span>))) <span class="comment">// "10"</span>

<span class="type">Decimal</span>(<span class="number">10.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">fractionLength</span>(<span class="number">1</span>))) <span class="comment">// 10.0</span>
<span class="type">Decimal</span>(<span class="number">10.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">fractionLength</span>(<span class="number">2</span>))) <span class="comment">// 10.01</span>
<span class="type">Decimal</span>(<span class="number">10.01</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">fractionLength</span>(<span class="number">3</span>))) <span class="comment">// 10.010</span>

<span class="type">Decimal</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">fractionLength</span>(<span class="number">0</span>...<span class="number">2</span>)))        <span class="comment">// 10</span>
<span class="type">Decimal</span>(<span class="number">10.1</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">fractionLength</span>(<span class="number">0</span>...<span class="number">2</span>)))      <span class="comment">// 10.1</span>
<span class="type">Decimal</span>(<span class="number">10.11</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">fractionLength</span>(<span class="number">0</span>...<span class="number">2</span>)))     <span class="comment">// 10.11</span>
<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">fractionLength</span>(<span class="number">0</span>...<span class="number">2</span>)))    <span class="comment">// 10.11</span>

<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerLength</span>(<span class="number">1</span>))) <span class="comment">// 0.111</span>
<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerLength</span>(<span class="number">2</span>))) <span class="comment">// 10.111</span>

<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerLength</span>(<span class="number">0</span>...<span class="number">1</span>))) <span class="comment">// .111</span>
<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerLength</span>(<span class="number">0</span>...<span class="number">2</span>))) <span class="comment">// 10.111</span>
<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerLength</span>(<span class="number">0</span>...<span class="number">3</span>))) <span class="comment">// 10.111</span>

<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerAndFractionLength</span>(integer: <span class="number">1</span>, fraction: <span class="number">1</span>))) <span class="comment">// 0.1</span>
<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerAndFractionLength</span>(integer: <span class="number">2</span>, fraction: <span class="number">1</span>))) <span class="comment">// 10.1</span>
<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerAndFractionLength</span>(integer: <span class="number">2</span>, fraction: <span class="number">2</span>))) <span class="comment">// 10.11</span>
<span class="type">Decimal</span>(<span class="number">10.111</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">precision</span>(.<span class="call">integerAndFractionLength</span>(integer: <span class="number">2</span>, fraction: <span class="number">3</span>))) <span class="comment">// 10.111</span></code></pre>

<h3 id="numbers-notation">Notation</h3>

Controls the ability to use different notation styles.

| Notation Setting | Description                                                                                                 |
| ---------------- | ----------------------------------------------------------------------------------------------------------- |
| `.automatic`     | Used primarily when compositing other styles, will choose the best notation setting for the given settings. |
| `.compactName`   | Uses the compact notation for the thousands styles                                                          |
| `.scientific`    | Uses scientific notation                                                                                    |

<pre class="splash"><code><span class="type">Float</span>(<span class="number">1_000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">notation</span>(.<span class="dotAccess">automatic</span>))   <span class="comment">// "1,000"</span>
<span class="type">Float</span>(<span class="number">1_000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">notation</span>(.<span class="dotAccess">compactName</span>)) <span class="comment">// "1K"</span>
<span class="type">Float</span>(<span class="number">1_000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">notation</span>(.<span class="dotAccess">scientific</span>))  <span class="comment">// "1E3"</span></code></pre>

<h3 id="numbers-scale">Scale</h3>

Controls the scale of the number.

<pre class="splash"><code><span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">scale</span>(<span class="number">1.0</span>))  <span class="comment">// "10"</span>
<span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">scale</span>(<span class="number">1.5</span>))  <span class="comment">// "15"</span>
<span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">scale</span>(<span class="number">2.0</span>))  <span class="comment">// "20"</span>
<span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">scale</span>(-<span class="number">2.0</span>)) <span class="comment">// "-20"</span></code></pre>

<h3 id="numbers-locale">Setting the Locale</h3>

Controls the locale of the output.

<pre class="splash"><code><span class="type">Float</span>(<span class="number">1_000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">notation</span>(.<span class="dotAccess">automatic</span>).<span class="call">locale</span>(<span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)))   <span class="comment">// "1 000"</span>
<span class="type">Float</span>(<span class="number">1_000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">notation</span>(.<span class="dotAccess">compactName</span>).<span class="call">locale</span>(<span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>))) <span class="comment">// "1 k"</span>
<span class="type">Float</span>(<span class="number">1_000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">notation</span>(.<span class="dotAccess">scientific</span>).<span class="call">locale</span>(<span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)))  <span class="comment">// "1E3"</span>

<span class="type">Float</span>(<span class="number">1000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">grouping</span>(.<span class="dotAccess">automatic</span>).<span class="call">locale</span>(<span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>))) <span class="comment">// "1 000"</span>
<span class="type">Float</span>(<span class="number">1000</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">grouping</span>(.<span class="dotAccess">never</span>).<span class="call">locale</span>(<span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)))     <span class="comment">// "1000"</span></code></pre>

<h3 id="numbers-compositing">Compositing</h3>

Any of the above styles can be combined to fully customize the output.

<pre class="splash"><code><span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">scale</span>(<span class="number">200.0</span>).<span class="call">notation</span>(.<span class="dotAccess">compactName</span>).<span class="call">grouping</span>(.<span class="dotAccess">automatic</span>)) <span class="comment">// "2K"</span></code></pre>

<h3 id="numbers-attributed-string-output">Attributed String Output</h3>

Outputs and `AttributedString` instead of a `String`.

<pre class="splash"><code><span class="type">Float</span>(<span class="number">10</span>).<span class="call">formatted</span>(.<span class="dotAccess">number</span>.<span class="call">scale</span>(<span class="number">200.0</span>).<span class="call">notation</span>(.<span class="dotAccess">compactName</span>).<span class="call">grouping</span>(.<span class="dotAccess">automatic</span>).<span class="property">attributed</span>)</code></pre>
