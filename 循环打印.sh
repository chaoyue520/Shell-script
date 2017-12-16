#!/bin/bash

# 每行末尾加上\n进行换行，列与列之间加\t分隔符
cat data.txt | awk -F '\t' '{for(i=1;i<=NF;i++) printf $i "\t" ;{printf "\n"}}'