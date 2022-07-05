---
title: "Numeric Styles"
sitemap_ignore: false
---

<h2 id="number-style">Number Style {{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

The many ways you can customize the display of numbers.

{{< /hint >}}

There are many ways to format Swift's numerical types (Float, Double, Decimal, and Integer) for display to the user. Each of the following options can be used by the Percent Format Styles and the Currency Format Style.

The examples below show the individual options available to format your final string, the real power available is that you chain these options together to allow for a truly staggering amount of customization.

{{< include file="/_includes/numbers.md" type="page" >}}

---

<h2 id="percent-style">Percent Style {{< xcode13-badge >}}</h2>

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

<h2 id="currency-style">Currency Style {{< xcode13-badge >}}</h2>

{{< hint type=tip title=TL;DR >}}

Output number values in the local currency.

{{< /hint >}}

The currency format style is very similar to the Number and Percent format styles and works with Swift's numerical types (Float, Double, Decimal, and Integer). 

The key difference is that you will need to pass in the [ISO 4217](https://en.wikipedia.org/wiki/ISO_4217) country code for the currency you would like to display. 

{{< hint type=important >}}

Because accuracy can't be guaranteed, never use floating point numbers (Float and Double) to store and do calculations on important values like money. Either store cents as Integers, or use `Decimal` values.

{{< /hint >}}

{{< include file="/_includes/currency.md" type="page" >}}

<div class="gdoc-page__footer flex flex-wrap justify-between">
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--prev flex align-center" href="/#the-basics" title="The Basics">
      <i class="gdoc-icon">gdoc_arrow_left_alt</i>
      The Basics
    </a>
  </span>
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--next flex align-center" href="/date-styles/" title="Single Date Styles">
      Single Date Styles
      <i class="gdoc-icon">gdoc_arrow_right_alt</i>
    </a>
  </span>
</div>
