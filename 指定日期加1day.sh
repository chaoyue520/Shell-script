#!/bin/bash


DATE=20170101
END_DATE=20171218

while [ $DATE -lt $END_DATE ]
do
    sh -x one_day.sh $DATE
    DATE=`date -d "$DATE +1 day" +%Y%m%d`   #指定日期加1天
done



