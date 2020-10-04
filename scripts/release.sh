./scripts/build.sh
rm -rf docs
cp -r output docs
git add docs
git commit -m "publish changes online"
git push