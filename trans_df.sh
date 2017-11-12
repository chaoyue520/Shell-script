#!/bim/bash

# GP数据框中导出数据到本地
# 相应参数后分别填入所需参数
psql -h hostname -p port -d database -Uusername -f ./sql/trans_df.sql>./data/trans_df.txt


# 删除前两行数据
sed '1,2d' ./data/trans_df.txt > ./data/v1.txt

# 删除数据中的空格
sed s/[[:space:]]//g ./data/v1.txt > ./data/v2.txt

# 过滤rows行，删除空行，打印所有列，以\t作为分隔符
cat ./data/v2.txt|grep -v 'rows' |  awk -F "|" '$1!=""{for(i=1;i<NF;i++) printf $i "\t" ;{print $i}}' > ./data/trans_df_last.txt

# 导入数据到hive中
hive -e "load data local inpath './data/trans_df_last.txt' overwrite into table jiwenchao.ods_mg_case_trans_df;"

# 删除过程表
rm ./data/v*

