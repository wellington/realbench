FILES=$(find short/*.scss)
SASSCBIN=$(which sassc)

for file in $FILES; do
    out=${file/short/build}
    $SASSCBIN $file ${out/.scss/.css}
done
