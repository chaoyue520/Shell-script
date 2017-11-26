#!/bin/bash

command1 && command2 && command3
# 含义：当成功的执行一条命令之后再执行另外一条命令
# &&左边的命令返回为真，右边的命令才会被执行

cd /home/sas/jiwenchao && rm a.txt && echo "success"
# 含义：进入到特定路径下，如果成功则删除a.txt文件，如果文件删除成功，则在屏幕上输出success