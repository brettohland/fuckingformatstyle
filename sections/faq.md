---
---
## FAQ

{{< expand "What is FormatStyle anyway?">}}

For Swift, it's the easiest way to convert a data type to a **fully localized display string**.

Introduced with iOS 15, the `FormatStyle` is a Swift protocol that outlines a way to take one format and convert it to another. 

On top of this, Apple built out a suite of format styles to easily convert the built in data types to strings for display with a dizzying amount of customization.

This replaces the old `Formatter` subclasses that were ported over from Objective-C and Apple themselves now recommends that new Swift codes uses this instead.

[Apple's Data Formatting documentation](https://developer.apple.com/documentation/foundation/data_formatting)

{{< hint type=important >}}
`FormatStyle` is only available when you're writing Swift. If you're writing Objective-C, you'll need to use the old Formatter classes.
{{< /hint >}}

{{< /expand >}}

{{< expand "What's the catch?">}}

The only catch is that Apple has done a bad job of documenting them. Unless you know what it can do, there's no way to discover how to do it and you'll end up trying to re-invent the wheel.

{{< /expand >}}

{{< expand "Why not use those old Formatter subclasses?">}}

At the core of it:

1. Performance
2. Simplicity

### Performance

Creating an instance of a `Formatter` subclass is expensive and Apple's documentation doesn't go out of it's way to tell you that. An easy trap to fall into is re-initializing a formatter every time you'd like to display some data as a string.

This isn't too bad if you're re-creating a formatter once per `UIView`, but if you make the mistake of creating a new formatter for every cell in a `UICollectionView`, you're going to be in pain.

`FormatStyle` works like you expect it, and it handles everything behind the scenes.

[Kahn Winter did a bunch of performance testing](https://mobile.twitter.com/thecoolwinter/status/1525562833689247747?s=20&t=kSGBR5hYzEAJF6AacIbn0g) and found that `FormatStyle` use is slightly more performant than correctly re-using `Formatter` subclasses correctly. 

So the main benefit to their use is…

### Simplicity

Let's say you want to display an `Double` as a percentage, you have to:

1. You create an instance of your `NumberFormatter` somewhere that's reusable.
2. Customize the properties of the formatter to output the exact format you'd like to use.
3. Call the formatter's method to output your string.

"That's not that bad" you may think to yourself, but remember that that shiny new formatter _only outputs that exact output_. If you have a new output need, you have to _create a new formatter_.

Using `FormatStyles` work like you expect them, every piece of data can have their output customized and can be set up for reuse easily.

{{< /expand >}}

{{< expand "What can I even format?">}}

**Short answer:** Anything and Everything.

**Longer answer:** [Numbers](/#), [Dates](/#), [Date rages](/#), [Percentages](/#), [Money](/#), [Measurements](/#), [Lists of things](/#), [Person names](/#), [Byte Counts](/#).

[You can even write your own formatters from the ground up and support your own custom data types](/#).

{{< /expand >}}

{{< expand "What can I output?">}}

It's strings by default. Some of the built-in format styles will also output attributed strings.

If you're feeling really clever, you can create a custom format style and output whatever you want.

{{< /expand >}}