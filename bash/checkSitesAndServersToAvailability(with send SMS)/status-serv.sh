#!/bin/bash
cat /script/sites.txt | while read line
do
word=$(echo "$line" | cut -d : -f 2 )
url=$(echo "$line" | cut -d : -f 1 )
resfind=$(curl -s -# --retry 0 "http://$url" | cat | grep -cis "$word")
if [ $resfind -eq 0 ]; then
#curl -s "http://sms.ru/sms/send?api_id=fc92ebd4-0n45-fa44-81a3-48062dd8bf51&to=792776488311&from=79277648831" --data-urlencode "text=offline $url"
echo "Server is offline $url" | sendmail -F "Admin"  user@mail.com
fi
done
