#!/bin/bash

# 取出第3行，第8行，第10行，并打印所有列
cat 1.txt | awk 'NR=="3" || NR=="8" || NR=="10" {print $0}'