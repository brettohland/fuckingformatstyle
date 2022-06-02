---
sitemap_ignore: true
---
## Attributed String Output

{{< hint type=tip title=TL;DR >}}

Some of the built-in styles will output `AttributedString` values instead.

{{< /hint >}}

Many of the format styles listed throughout will output attributed strings by appending the `attributed` method at the end of the style. You can even mimic this behaviour in your own custom format styles.

These attributed strings give us the ability to style individual elements of the string.

<pre class="splash"><code><span class="number token">0.88</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">percent</span>.<span class="property token">attributed</span>)</code></pre>

Outputs:

![Attributed String Output for 88%](/images/attributed-string-output.png)

You can then use the Attributed String API to access these elements to add your own styles.

<pre class="splash"><code><span class="keyword token">struct</span> ContentView: <span class="type token">View</span> {
    <span class="keyword token">var</span> percentAttributed: <span class="type token">AttributedString</span> {
        <span class="keyword token">var</span> percentAttributedString = <span class="number token">0.8890</span>.<span class="call token">formatted</span>(.<span class="dotAccess token">percent</span>.<span class="property token">attributed</span>)
        percentAttributedString.<span class="property token">swiftUI</span>.<span class="property token">font</span> = .<span class="dotAccess token">title</span>
        percentAttributedString.<span class="property token">runs</span>.<span class="call token">forEach</span> { run <span class="keyword token">in
            if let</span> numberRun = run.<span class="property token">numberPart</span> {
                <span class="keyword token">switch</span> numberRun {
                <span class="keyword token">case</span> .<span class="dotAccess token">integer</span>:
                    percentAttributedString[run.<span class="property token">range</span>].foregroundColor = .<span class="dotAccess token">orange</span>
                <span class="keyword token">case</span> .<span class="dotAccess token">fraction</span>:
                    percentAttributedString[run.<span class="property token">range</span>].foregroundColor = .<span class="dotAccess token">blue</span>
                }
            }

            <span class="keyword token">if let</span> symbolRun = run.<span class="property token">numberSymbol</span> {
                <span class="keyword token">switch</span> symbolRun {
                <span class="keyword token">case</span> .<span class="dotAccess token">percent</span>:
                    percentAttributedString[run.<span class="property token">range</span>].foregroundColor = .<span class="dotAccess token">green</span>
                <span class="keyword token">case</span> .<span class="dotAccess token">decimalSeparator</span>:
                    percentAttributedString[run.<span class="property token">range</span>].foregroundColor = .<span class="dotAccess token">red</span>
                <span class="keyword token">default</span>:
                    <span class="keyword token">break</span>
                }
            }
        }

        <span class="keyword token">return</span> percentAttributedString
    }

    <span class="keyword token">var</span> body: <span class="keyword token">some</span> <span class="type token">View</span> {
        <span class="type token">VStack</span> {
            <span class="type token">Text</span>(percentAttributed)
        }
        .<span class="call token">padding</span>()
    }
}</code></pre>

Will show:

![Attributed String Output for 88%](/images/attributed-string-swiftui.png)

