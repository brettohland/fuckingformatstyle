# F*cking Format Style Source

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Q5Q6BLZHQ)

The source code for both [fuckingformatstyle.com](https://fuckingformatstyle.com) and [goshdarnformatstyle.com](https://goshdarnformatstyle.com).

# Found An Issue?

You have two options;

1. Open an [issue](https://github.com/brettohland/fuckingformatstyle/issues). I try to take care of things within a week or less.
2. Open a PR. If you're willing and able, you might need the following sections.

# A Bit Of Documentation

This site is built using [Hugo](https://gohugo.io) and the [Just The Docs](https://just-the-docs.github.io/just-the-docs/) template.

Out of the box, Hugo's support for Swift code highlighting is poor. To work around this, the site manually converts all Swift code blocks into HTML using [SplashMarkdown](https://github.com/xyproto/splash) during deployment.

## Where's The Actual Content?

All of the copy and code examples are stored inside of the `/sections` folder. During deployment, each markdown file will have their code blocks converted and they will be placed in their final location inside of the `/content/_includes/` folder.

