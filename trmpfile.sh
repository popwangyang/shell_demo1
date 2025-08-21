#!/usr/bin/env bash

#`mktemp`新建临时文件命令
filename=`mktemp`
echo $filename
#`mktemp -d`新建临时目录
# dirname=`mktemp -d`
# echo $dirname

echo "lsllslslsl" > $filename

cat $filename