#!/bin/sh
rm -rf converted
mkdir converted
for f in ./*.md; do
  SplashMarkdown $f | tee converted/$f
  cp converted/$f ../content/_includes/$f
done
rm -rd converted
