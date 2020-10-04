rm -rf docs
mkdir -p docs
cp -r output docs
git add docs
git commit -m "publish changes online"
git push