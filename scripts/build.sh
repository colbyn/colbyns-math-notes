set -e

# SETUP
SRC_DIR='./source'
OUT_DIR='./output'
OUT_DIR_WEB='./output/web'

mkdir -p $OUT_DIR
mkdir -p $OUT_DIR_WEB

BUILD_PDF=false
BUILD_HTML=true

# OLD VERSION FOR COPYING STYLESHEET
# if $BUILD_HTML; then
# echo "builing html"
# mkdir -p $OUT_DIR/config
# rsync --checksum config/theme.css output/theme.css
# bundle exec asciidoctor --base-dir=.  -a linkcss \
#     -D $OUT_DIR \
#     $SRC_DIR/*.adoc
# fi

if $BUILD_HTML; then
echo "builing html"
mkdir -p $OUT_DIR/static
rsync --archive --recursive --update static $OUT_DIR
bundle exec asciidoctor \
    -r asciidoctor-diagram \
    -D $OUT_DIR \
    -R $SRC_DIR \
    '**/*.adoc'
fi

