#!/bin/bash

## 设置时间参数
#今天
date_today=`date "+%Y-%m-%d"`
date_w=`date -d $date_today +%w`

#昨天
date_yesterday=`date -d "yesterday" +%Y-%m-%d`
date_Y=`date -d "yesterday" +%Y_%m_%d`

#三天前
date_3y=`date --date "3 days ago" "+%Y-%m-%d"`
date_3Y=`date --date "3 days ago" "+%Y_%m_%d"`


# 解决输出中文是乱码的问题
export LANG=zh_CN.UTF-8

#周一跑3天的报损，其他工作日跑前一天报损
# -hiveconf 参数用于hivesql传参

if [ $date_w -ne 1 ];then
hive -hiveconf date_yesterday=$date_yesterday -f ./yesterday_pay_data_list.sql > ./daily_data_$date_Y.txt
else 
hive -hiveconf date_3y=$date_3y -f ./three_days_pay_data_list.sql > ./daily_data_$date_3Y-$daily_w.txt
fi
