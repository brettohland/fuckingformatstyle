---
title: "Date Range Styles"
sitemap_ignore: false
---

<h2 id="interval-date-style-date-range">Interval Date Style (Date Range) {{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

Shows the earliest and last dates in a `Range`, similar options to the [Date and Time](#) single date format style.

{{< /hint >}}

For a given `Range<Date>`, this format will output the earliest and last days.

{{< include file="/_includes/intervalDateRange.md" type="page" >}}

---

<h2 id="components-date-style-date-range">Components Date Style (Date Range) {{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

Shows the distance between the earliest and latest dates in a range, similar to the [Relative Date](#) style for single dates.

{{< /hint >}}

For a given `Range<Date>`, you can display the distance between the earliest and latest dates using specific units.

{{< hint type=important >}}

For all given fields, the system will only display the unit if it's not a 0 value. Including the field will only specify that the unit _might_ be used.

{{< /hint >}}

{{< include file="/_includes/componentsDateRange.md" type="page" >}}

<div class="gdoc-page__footer flex flex-wrap justify-between">
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--prev flex align-center" href="/date-styles" title="Single Date Styles">
      <i class="gdoc-icon">gdoc_arrow_left_alt</i>
      Single Date Styles
    </a>
  </span>
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--next flex align-center" href="/measurement-style/" title="Measurement Style">
      Measurement Style
      <i class="gdoc-icon">gdoc_arrow_right_alt</i>
    </a>
  </span>
</div>
