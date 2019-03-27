#!/bin/bash
DATE=20180215
#END_DATE=`date +%Y%m%d`
END_DATE=20180801
#DATE1=2018-02-15
while [ $DATE -le $END_DATE ]
do
    DATE1=`date -d "$DATE" +%Y-%m-%d` # 日期格式是2019-01-01, 而非20190101, 所以通过这种方式调整下格式
    sh -x one_day.sh $DATE1
    DATE=`date -d "$DATE +1 day" +%Y%m%d`   #指定日期加1天
done
