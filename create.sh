#!/bin/bash
echo 'copies'
mkdir -p multi
for n in {001..100}; do
    echo "copy $n";
    cp app.scss multi/app-$n.scss
done
