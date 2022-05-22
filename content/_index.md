---
title: "FormatStyles The Missing Manual"
date: 2022-05-08T08:58:09-06:00
draft: false
---

FormatStyle are the easiest way to convert Swift data types into localized strings to display to your users. Unfortunately Apple doesn't do a great job in telling you what they can do, and how to use them.

This site is going to help you do just that.

<!--more--> 

{{< include file="/_includes/faq.md" type="page" >}}

<hr>

{{< include file="/_includes/quiz.md" type="page" >}}

<hr>

{{< include file="/_includes/basics.md" type="page" >}}

<hr>

# Numbers

## Percentages

## Money

<hr>

# Dates

Apple provides a convenience `.formatted` method on `Date` objects that allows you to customize the date and time styling within a few fixed enum values.

# Date and Time only

{{< gist brettohland ac2fbd1446bc7bb64da491587b010e3c "Date.FormatStyle.swift" >}}

# `.dateTime()` formats

{{< gist brettohland ac2fbd1446bc7bb64da491587b010e3c "Date.FormatStyle.dateTime.swift" >}}
