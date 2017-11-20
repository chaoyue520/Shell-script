#!/bin/bash

# 分别删除第2，4，8，18，19行
str="sed -i '"
for num in 2 4 8 18 19
do
str=$str"${num}d;"
done

# 传参构造sed字符串
# 结果为 sed -i '2d;4d;8d;18d;19d;'


str="$str'"
# eval()函数，可读取一连串的参数， 然后再依参数本身的特性来执行，参数不限数目，彼此用分号分开即可
eval "$str a.txt"