#!/usr/bin/env bash

./runBinairo.sh -e 06 -n compare06.txt
./runBinairo.sh -e 08 -n compare08.txt
./runBinairo.sh -e 10 -n compare10.txt
./runBinairo.sh -e 14 -n compare14.txt
./runBinairo.sh -e 20 -n compare20.txt
./runBinairo.sh -e 30 -n compare30.txt

size06=$(ls -lh compare06.txt | awk '{ print $5 }')
size08=$(ls -lh compare08.txt | awk '{ print $5 }')
size10=$(ls -lh compare10.txt | awk '{ print $5 }')
size14=$(ls -lh compare14.txt | awk '{ print $5 }')
size20=$(ls -lh compare20.txt | awk '{ print $5 }')
size30=$(ls -lh compare30.txt | awk '{ print $5 }')

echo "COMPARING SOLUTION 06 RESULT DIFF SIZE = " $size06
echo "COMPARING SOLUTION 08 RESULT DIFF SIZE = " $size08
echo "COMPARING SOLUTION 10 RESULT DIFF SIZE = " $size10
echo "COMPARING SOLUTION 14 RESULT DIFF SIZE = " $size14
echo "COMPARING SOLUTION 20 RESULT DIFF SIZE = " $size20
echo "COMPARING SOLUTION 30 RESULT DIFF SIZE = " $size30
