# The Basics

You can access this new system in a few ways:

1. Call `.formatted()` on a data type for a sensible, localized default
2. Call `.formatted(_: FormatStyle)` on a data type and pass in a pre-defined or custom FormatStyle to customize your output
3. Call `.format()` on a custom FormatStyle and pass in a data value

At its most basic, calling `.formatted()` will give you a sensible default that uses your device's current locale and calendar to display the value.

{{< gist brettohland ac2fbd1446bc7bb64da491587b010e3c "Basics.swift" >}}

In general, these are useful to quickly convert your values into strings.