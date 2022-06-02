---
sitemap_ignore: true
---
### Available Options

You have the ability to set the style of the output

| Type Option | Description                                      |
| ----------- | ------------------------------------------------ |
| `.and`      | Appends a localized "and" to the end of the list |
| `.or`       | Appends a localized "or" to the end of the list  |

| Width Option | Description                                                                                      |
| ------------ | ------------------------------------------------------------------------------------------------ |
| `.standard`  | The standard default, uses the full  localized word.                                             |
| `.short`     | Uses a narrow version of the work. For example "&" instead of "and"                              |
| `.narrow`    | Uses the least number of characters possible for the word. For example, omitti

<pre class="splash"><code>letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">narrow</span>))   <span class="comment">// "a, b, c, d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">standard</span>)) <span class="comment">// "a, b, c, and d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">short</span>))    <span class="comment">// "a, b, c, &amp; d"</span>

letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">narrow</span>))   <span class="comment">// "a, b, c, or d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">standard</span>)) <span class="comment">// "a, b, c, or d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">short</span>))    <span class="comment">// "a, b, c, or d"</span></code></pre>

### Setting the locale

You can set the locale by appending the `locale()` method onto the end of the format style.

<pre class="splash"><code><span class="keyword">let</span> franceLocale = <span class="type">Locale</span>(identifier: <span class="string">"fr_FR"</span>)

letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">and</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "a, b, c, et d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">or</span>).<span class="call">locale</span>(franceLocale))  <span class="comment">// "a, b, c, ou d"</span>

letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">narrow</span>).<span class="call">locale</span>(franceLocale))   <span class="comment">// "a, b, c, d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">standard</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "a, b, c, et d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">short</span>).<span class="call">locale</span>(franceLocale))    <span class="comment">// "a, b, c, et d"</span>

letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">narrow</span>).<span class="call">locale</span>(franceLocale))   <span class="comment">// "a, b, c, ou d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">standard</span>).<span class="call">locale</span>(franceLocale)) <span class="comment">// "a, b, c, ou d"</span>
letters.<span class="call">formatted</span>(.<span class="call">list</span>(type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">short</span>).<span class="call">locale</span>(franceLocale))    <span class="comment">// "a, b, c, ou d"</span></code></pre>

### Customizing Item Display

In the case of more complex, or custom values in the array, you can pass in another Format Style that will format all items in the list.

For example, you can use any of the date format styles when dealing with an array of Dates.

<pre class="splash"><code><span class="keyword">let</span> yearOnlyFormat = <span class="type">Date</span>.<span class="type">FormatStyle</span>.<span class="property">dateTime</span>.<span class="call">year</span>()

importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">and</span>)) <span class="comment">// "2000 and 1969"</span>
importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">or</span>))  <span class="comment">// "2000 or 1969"</span>

importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">standard</span>)) <span class="comment">// "2000 and 1969"</span>
importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">narrow</span>))   <span class="comment">// "2000, 1969"</span>
importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">and</span>, width: .<span class="dotAccess">short</span>))    <span class="comment">// "2000 &amp; 1969"</span>

importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">standard</span>)) <span class="comment">// "2000 or 1969"</span>
importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">narrow</span>))   <span class="comment">// "2000 or 1969"</span>
importantDates.<span class="call">formatted</span>(.<span class="call">list</span>(memberStyle: yearOnlyFormat, type: .<span class="dotAccess">or</span>, width: .<span class="dotAccess">short</span>))    <span class="comment">// "2000 or 1969"</span>

<span class="keyword">let</span> yearStyle = <span class="type">ListFormatStyle</span>&lt;<span class="type">Date</span>.<span class="type">FormatStyle</span>, <span class="type">Array</span>&lt;<span class="type">Date</span>&gt;&gt;.<span class="keyword">init</span>(memberStyle: .<span class="dotAccess">dateTime</span>.<span class="call">year</span>())
importantDates.<span class="call">formatted</span>(yearStyle)</code></pre>
