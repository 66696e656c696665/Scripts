#!/bin/bash
funct()
{
cat $1 | while read line
do
cat text/"$line" >> final/"$line"
cat content/texts/"$line" >> final/"$line"
done
}
file=`ls text`
W=`wc -l < $file`
let S=W/100
for ((i=1;i<=W;i+=S+1))
do
let N=i+S
sed -n "${i},${N}p" $file | funct &
done