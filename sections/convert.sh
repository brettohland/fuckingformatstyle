rm -rf converted
mkdir converted
for f in ./*.md; do
  $(echo $f)
  SplashMarkdown $f | tee converted/$f
done