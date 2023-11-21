#!/usr/bin/env bash

# clear possible existing files
while getopts e:n: flag
do
    case "${flag}" in
        e) example=${OPTARG};;
        n) nameFile=${OPTARG};;
    esac
done

echo $example
echo $nameFile
rm ./domain.lp
rm ./result$example.txt


python3 ./utils/encode.py < ./examples/dom$example.txt > domain.lp
clingo 0 binairo.lp domain.lp
python3 ./utils/decode.py binairo.lp domain.lp >> result$example.txt
diff ./examples/sol$example.txt ./result$example.txt >> $nameFile

