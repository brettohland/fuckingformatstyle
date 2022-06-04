---
title: "Format Styles In Excruciating Detail"
draft: false
sitemap_ignore: false
---
Format styles are the easiest way to convert Swift data types into localized strings to display to your users. Unfortunately Apple doesn't do a great job in telling you what they can do, and how to use them.

This site is going to help you do just that.

{{< other-version-link >}}

<!--more--> 

---

{{< include file="/_includes/quiz.md" type="page" >}}

---

{{< include file="/_includes/faq.md" type="page" >}}

---

{{< include file="/_includes/requirements.md" type="page" >}}

---

{{< include file="/_includes/basics.md" type="page" >}}

---

## Number Style

{{< hint type=tip title=TL;DR >}}

The many ways you can customize the display of numbers.

{{< /hint >}}

There are many ways to format Swift's numerical types (Float, Double, Decimal, and Integer) for display to the user. Each of the following options can be used by the Percent Format Styles and the Currency Format Style.

The examples below show the individual options available to format your final string, the real power available is that you chain these options together to allow for a truly staggering amount of customization.

{{< include file="/_includes/numbers.md" type="page" >}}

---

## Percent Style

{{< hint type=tip title=TL;DR >}}

Output number as a percentage.

{{< /hint >}}

There are many ways to format Swift's numerical types (Float, Double, Decimal, and Integer) for display to the user. Each of the following options can be used by the Percent Format Styles and the Currency Format Style.

The examples below show the individual options available to format your final string, the real power available is that you chain these options together to allow for a truly staggering amount of customization.

{{< hint type=important >}}

Percentages are set by a range from 0.0 to 1.0, where 0.5 being 50%. This is consistent with the rest of Cocoa.

{{< /hint >}}

{{< include file="/_includes/percent.md" type="page" >}}

---

## Currency Style

{{< hint type=tip title=TL;DR >}}

Output number values in the local currency.

{{< /hint >}}

The currency format style is very similar to the Number and Percent format styles and works with Swift's numerical types (Float, Double, Decimal, and Integer). 

The key difference is that you will need to pass in the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) country code for the currency you would like to display. 

{{< hint type=important >}}

Because accuracy can't be guaranteed, never use floating point numbers (Float and Double) to store and do calculations on important values like money. Either store cents as Integers, or use `Decimal` values.

{{< /hint >}}

{{< include file="/_includes/currency.md" type="page" >}}

---

## Date and Time (Single Date)

{{< hint type=tip title=TL;DR >}}

A quick way of displaying the date and time.

{{< /hint >}}

This is the default formatter used when calling `formatted` on any date object. In general, it's an easy way to display a date with or without it's corresponding time component.

Each portion (the date and the time), can be customized in the following ways.

{{< include file="/_includes/dateAndTime.md" type="page" >}}

---

## `.dateTime()` Compositing (Single Date)

{{< hint type=tip title=TL;DR >}}

A flexible way to composite the exact date string of your dreams.

{{< /hint >}}

Like lego blocks, this format style allows you to mix and match the date components you would like to use in your final string.

{{< include file="/_includes/dateTime.md" type="page" >}}

---

## ISO 8601 Date Style (Single Date)

{{< hint type=tip title=TL;DR >}}

The fastest way to output the globe's standard date string.

{{< /hint >}}

Since this is an international standard, the amount of customization is limited with this format style.

{{< include file="/_includes/iso8601.md" type="page" >}}

---

## Relative Date Style (Single Date)

{{< hint type=tip title=TL;DR >}}

Quickly say approximately how long it will be between a date and now.

{{< /hint >}}

This format style will tell you the approximate distance to or from a date to now. 

There are no options available to set the units you would like to display, the system will only show the largest unit.

{{< include file="/_includes/relativeDate.md" type="page" >}}

---

## Verbatim Date Style (Single Date)

{{< hint type=tip title=TL;DR >}}

A fixed and structured method of formatting a datetime string, avoiding localization pitfalls.

{{< /hint >}}

The verbatim date format style is as close as Format Styles get to the old date formatting string methods used by (NS)DateFormatter.

Unlike the older methods, the format string that you pass into the format style is much more regimented in how you access the various symbols.

{{< hint type=important >}}

This style does not use any localization and you cannot set the Locale.

{{< /hint >}}

{{< include file="/_includes/verbatimDate.md" type="page" >}}

---

## Interval Date Style (Date Range)

{{< hint type=tip title=TL;DR >}}

Shows the earliest and last dates in a `Range`, similar options to the [Date and Time](#) single date format style.

{{< /hint >}}

For a given `Range<Date>`, this format will output the earliest and last days.

{{< include file="/_includes/intervalDateRange.md" type="page" >}}

---

## Components Date Style (Date Range)

{{< hint type=tip title=TL;DR >}}

Shows the distance between the earliest and latest dates in a range, similar to the [Relative Date](#) style for single dates.

{{< /hint >}}

For a given `Range<Date>`, you can display the distance between the earliest and latest dates using specific units.

{{< hint type=important >}}

For all given fields, the system will only display the unit if it's not a 0 value. Including the field will only specify that the unit _might_ be used.

{{< /hint >}}

{{< include file="/_includes/componentsDateRange.md" type="page" >}}

---

## Measurement Style

{{< hint type=tip title=TL;DR >}}

Print out your various measurements.

{{< /hint >}}

The Measurement API inside of Foundation is a powerful toolkit for converting and displaying units. 

{{< include file="/_includes/measurement.md" type="page" >}}

---

## List Style

{{< hint type=tip title=TL;DR >}}

Outputs an array as a list, you can further customize how each element in the array is displayed.

{{< /hint >}}

This format style works on any Array or items. In cases where the items are string convertible, the output is standard.
 
{{< include file="/_includes/listStyle.md" type="page" >}}

---

## Person Name Component Style

{{< hint type=tip title=TL;DR >}}

Never again do you have to remember if the family name goes before the given name in a locale.

{{< /hint >}}

This format style solves the complexities of displaying an individual's name in the correct, localized fashion.

{{< include file="/_includes/names.md" type="page" >}}

---

## Byte Count Style

{{< hint type=tip title=TL;DR >}}

Simplify converting that byte value to terabytes.

{{< /hint >}}

This style allows you to format `Int64` byte counts as different units.

{{< include file="/_includes/bytes.md" type="page" >}}

---

## Custom Format Style

{{< hint type=tip title=TL;DR >}}

Visit the "Build a Format Style Workshop".

{{< /hint >}}

{{< include file="/_includes/custom.md" type="page" >}}

---

{{< include file="/_includes/swiftui.md" type="page" >}}

---

{{< include file="/_includes/attributedStrings.md" type="page" >}}
