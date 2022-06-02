---
sitemap_ignore: true
---
## Attributed String Output

{{< hint type=tip title=TL;DR >}}

Some of the built-in styles will output `AttributedString` values instead.

{{< /hint >}}

Many of the format styles listed throughout will output attributed strings by appending the `attributed` method at the end of the style. You can even mimic this behaviour in your own custom format styles.

These attributed strings give us the ability to style individual elements of the string.

<pre class="splash"><code><span class="number">0.88</span>.<span class="call">formatted</span>(.<span class="dotAccess">percent</span>.<span class="property">attributed</span>)</code></pre>

Outputs:

![Attributed String Output for 88%](/images/attributed-string-output.png)

You can then use the Attributed String API to access these elements to add your own styles.

<pre class="splash"><code><span class="keyword">struct</span> ContentView: <span class="type">View</span> {
    <span class="keyword">var</span> percentAttributed: <span class="type">AttributedString</span> {
        <span class="keyword">var</span> percentAttributedString = <span class="number">0.8890</span>.<span class="call">formatted</span>(.<span class="dotAccess">percent</span>.<span class="property">attributed</span>)
        percentAttributedString.<span class="property">swiftUI</span>.<span class="property">font</span> = .<span class="dotAccess">title</span>
        percentAttributedString.<span class="property">runs</span>.<span class="call">forEach</span> { run <span class="keyword">in
            if let</span> numberRun = run.<span class="property">numberPart</span> {
                <span class="keyword">switch</span> numberRun {
                <span class="keyword">case</span> .<span class="dotAccess">integer</span>:
                    percentAttributedString[run.<span class="property">range</span>].foregroundColor = .<span class="dotAccess">orange</span>
                <span class="keyword">case</span> .<span class="dotAccess">fraction</span>:
                    percentAttributedString[run.<span class="property">range</span>].foregroundColor = .<span class="dotAccess">blue</span>
                }
            }

            <span class="keyword">if let</span> symbolRun = run.<span class="property">numberSymbol</span> {
                <span class="keyword">switch</span> symbolRun {
                <span class="keyword">case</span> .<span class="dotAccess">percent</span>:
                    percentAttributedString[run.<span class="property">range</span>].foregroundColor = .<span class="dotAccess">green</span>
                <span class="keyword">case</span> .<span class="dotAccess">decimalSeparator</span>:
                    percentAttributedString[run.<span class="property">range</span>].foregroundColor = .<span class="dotAccess">red</span>
                <span class="keyword">default</span>:
                    <span class="keyword">break</span>
                }
            }
        }

        <span class="keyword">return</span> percentAttributedString
    }

    <span class="keyword">var</span> body: <span class="keyword">some</span> <span class="type">View</span> {
        <span class="type">VStack</span> {
            <span class="type">Text</span>(percentAttributed)
        }
        .<span class="call">padding</span>()
    }
}</code></pre>

Will show:

![Attributed String Output for 88%](/images/attributed-string-swiftui.png)

