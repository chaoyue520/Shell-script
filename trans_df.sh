#!/bim/bash

# GP���ݿ��е������ݵ�����
# ��Ӧ������ֱ������������
psql -h hostname -p port -d database -Uusername -f ./sql/trans_df.sql>./data/trans_df.txt


# ɾ��ǰ��������
sed '1,2d' ./data/trans_df.txt > ./data/v1.txt

# ɾ�������еĿո�
sed s/[[:space:]]//g ./data/v1.txt > ./data/v2.txt

# ����rows�У�ɾ�����У���ӡ�����У���\t��Ϊ�ָ���
cat ./data/v2.txt|grep -v 'rows' |  awk -F "|" '$1!=""{for(i=1;i<NF;i++) printf $i "\t" ;{print $i}}' > ./data/trans_df_last.txt

# �������ݵ�hive��
hive -e "load data local inpath './data/trans_df_last.txt' overwrite into table jiwenchao.ods_mg_case_trans_df;"

# ɾ�����̱�
rm ./data/v*

