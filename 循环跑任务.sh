#!/bin/bash


DATE=20170101
END_DATE=`date +%Y%m%d`

while [ $DATE -lt $END_DATE ]
do
    sh -x one_day.sh $DATE
    DATE=`date -d "$DATE +1 day" +%Y%m%d`   #指定日期加1天
done

# shell 传参 ：$@ 
# one_day.sh 脚本如下所示



######################################### one_day.sh #########################################

psql -h yq01-dba-rimgemini-gp-m00.yq01 -p 5500 -d rimgemini -Ujiwenchao01 -c 
" select transaction_id,occur_time from test_table where occur_date=$@ " > xxx.txt

cat xxx.txt|grep -v 'rows' |  awk -F "|" '$1!=""{for(i=1;i<NF;i++) printf $i "\t" ;{print $i}}' > test_$@.txt


