#!/bin/bash
echo 'copies'
mkdir -p multi
for n in {001..10}; do
    echo "copy $n";
    cp single/app.scss short/app-$n.scss
done
