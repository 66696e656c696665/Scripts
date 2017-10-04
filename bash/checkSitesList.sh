#!/bin/bash
funct()
{
cat $1 | while read line
do
rez=`curl --connect-timeout 7 --retry 0 -f -s $line | grep -c -i "bhaldie"`
if [ $rez -gt 0 ]; then
echo $line >> good.txt
fi
done
}
file=domain.txt
W=`wc -l < $file`
let S=W/100
for ((i=1;i<=W;i+=S+1))
do
let N=i+S
sed -n "${i},${N}p" $file | funct &
done