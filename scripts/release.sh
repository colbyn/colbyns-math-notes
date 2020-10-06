set -e
rm -rf docs
./scripts/build.sh target-github
git add docs
git commit -m "publish changes online"
git push