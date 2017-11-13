#!/bin/bash

#今天
date_today=`date "+%Y-%m-%d"`

#昨天
date_yesterday=`date -d "yesterday" +%Y%m%d`
date_Y=`date -d "yesterday" +%Y_%m_%d`

echo $date_yesterday
echo $date_today

#确认输出文件名
echo update_wallet_riskcontrol_dd_$date_Y.txt


hive -e "
set mapred.job.priority=VERY_HIGH; 
set mapred.job.map.capacity = 500;
set mapred.job.reduce.capacity = 500;

SQL line

" > ./update_wallet_riskcontrol_dd_$date_Y.txt


# 将每日更新的数据导入 ods_wallet_riskcontrol_dd_subset 表中
#hive -e "load data local inpath './update_wallet_riskcontrol_dd_$date_Y.txt' into table ods_wallet_riskcontrol_dd_subset ; "



