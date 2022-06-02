---
sitemap_ignore: true
---
## Attributed String Output

{{< hint type=tip title=TL;DR >}}

Some of the built-in styles will output `AttributedString` values instead.

{{< /hint >}}

Many of the format styles listed throughout will output attributed strings by appending the `attributed` method at the end of the style. You can even mimic this behaviour in your own custom format styles.

These attributed strings give us the ability to style individual elements of the string.

```
0.88.formatted(.percent.attributed)
```

Outputs:

![Attributed String Output for 88%](/images/attributed-string-output.png)

You can then use the Attributed String API to access these elements to add your own styles.

```
struct ContentView: View {
    var percentAttributed: AttributedString {
        var percentAttributedString = 0.8890.formatted(.percent.attributed)
        percentAttributedString.swiftUI.font = .title
        percentAttributedString.runs.forEach { run in
            if let numberRun = run.numberPart {
                switch numberRun {
                case .integer:
                    percentAttributedString[run.range].foregroundColor = .orange
                case .fraction:
                    percentAttributedString[run.range].foregroundColor = .blue
                }
            }

            if let symbolRun = run.numberSymbol {
                switch symbolRun {
                case .percent:
                    percentAttributedString[run.range].foregroundColor = .green
                case .decimalSeparator:
                    percentAttributedString[run.range].foregroundColor = .red
                default:
                    break
                }
            }
        }

        return percentAttributedString
    }

    var body: some View {
        VStack {
            Text(percentAttributed)
        }
        .padding()
    }
}
```

Will show:

![Attributed String Output for 88%](/images/attributed-string-swiftui.png)
