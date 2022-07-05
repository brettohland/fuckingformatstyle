---
title: "Single Date Styles"
sitemap_ignore: false
---

<h2 id="compositing">Compositing {{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

A flexible way to composite the exact date string of your dreams.

{{< /hint >}}

Like lego blocks, this format style allows you to mix and match the date components you would like to use in your final string.

{{< include file="/_includes/dateTime.md" type="page" >}}

---

<h2 id="date-and-time-single-date">Date and Time {{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

A quick way of displaying the date and time.

{{< /hint >}}

This is the default formatter used when calling `formatted` on any date object. In general, it's an easy way to display a date with or without it's corresponding time component.

Each portion (the date and the time), can be customized in the following ways.

{{< include file="/_includes/dateAndTime.md" type="page" >}}

---

<h2 id="iso-8601-date-style-single-date">ISO 8601 Date Style{{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

The fastest way to output the globe's standard date string.

{{< /hint >}}

Since this is an international standard, the amount of customization is limited with this format style.

{{< include file="/_includes/iso8601.md" type="page" >}}

---

<h2 id="relative-date-style-single-date">Relative Date Style{{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

Quickly say approximately how long it will be between a date and now.

{{< /hint >}}

This format style will tell you the approximate distance to or from a date to now. 

There are no options available to set the units you would like to display, the system will only show the largest unit.

{{< include file="/_includes/relativeDate.md" type="page" >}}

---

<h2 id="verbatim-date-style-single-date">Verbatim Date Style {{< xcode13-badge >}} {{< xcode14-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

A method of creating fixed, structured date format strings.

{{< /hint >}}

The verbatim date format style is as close as Format Styles get to the old date formatting string methods used by (NS)DateFormatter.

Unlike the older methods, the format string that you pass into the format style is much more regimented in how you access the various symbols.

{{< include file="/_includes/verbatimDate.md" type="page" >}}

<div class="gdoc-page__footer flex flex-wrap justify-between">
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--prev flex align-center" href="/numeric-styles" title="Numeric Styles">
      <i class="gdoc-icon">gdoc_arrow_left_alt</i>
      Numeric Styles
    </a>
  </span>
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--next flex align-center" href="/date-range-styles/" title="Date Range Styles">
      Date Range Styles
      <i class="gdoc-icon">gdoc_arrow_right_alt</i>
    </a>
  </span>
</div>
