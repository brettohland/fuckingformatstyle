---
title: "Byte Count Format Style"
sitemap_ignore: false
---

{{< hint type=tip title=TL;DR >}}

Simply showing your storage values, and even have fun converting units.

{{< /hint >}}

There are actually two byte count format styles available to you (depending on your Xcode version):

1. {{< xcode13-badge >}} `ByteCountFormatStyle` is used to format `Int64` values.
2. {{< xcode14-badge >}} `Measurement<UnitInformationStorage>.FormatStyle.ByteCount` is used to format `Measurement` values who are `UnitInformationStorage` types.

Thankfully, the APIs are identical between these two formatters.

{{< include file="/_includes/bytes.md" type="page" >}}

<div class="gdoc-page__footer flex flex-wrap justify-between">
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--prev flex align-center" href="/person-name-style" title="Person Name Style">
      <i class="gdoc-icon">gdoc_arrow_left_alt</i>
      Person Name Style
    </a>
  </span>
  <span class="gdoc-page__nav">
    <a class="gdoc-page__nav--next flex align-center" href="/url-style/" title="URL Style">
      URL Style
      <i class="gdoc-icon">gdoc_arrow_right_alt</i>
    </a>
  </span>
</div>