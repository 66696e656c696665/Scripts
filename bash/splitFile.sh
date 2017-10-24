#!/bin/bash
cat sites.txt | while read line
do
sed -n "$point,10000p" keys.txt > $line.txt
let $point=$point+10000
done