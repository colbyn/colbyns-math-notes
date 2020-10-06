set -e

# SETUP
SRC_DIR='./source'
OUT_DIR='./output'

mkdir -p $OUT_DIR

BUILD_PDF=false
BUILD_HTML=true

OVERRIDE_ARGS=""

if [ "$1" = "target-github" ]; then
    OVERRIDE_ARGS+=" --attribute env-github"
    OUT_DIR="docs"
fi

if $BUILD_HTML; then
echo "builing html"
mkdir -p $OUT_DIR/static
rsync --archive --recursive --update static $OUT_DIR
bundle exec asciidoctor \
    $OVERRIDE_ARGS \
    -r asciidoctor-diagram \
    -D $OUT_DIR \
    -R $SRC_DIR \
    '**/*.adoc'
fi

