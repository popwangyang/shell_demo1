#!/usr/bin/env bash

#通过管道 | 把标准输入的内容和cat输入的内容拼接起来，一起输出。
echo "Text through stdin" | cat - text.txt > a.txt

#cat 通过添加 -s去除文件中的空白行
echo -e "line1 \n \n \n \n line2 \n line3" > multi_blanks.txt

cat multi_blanks.txt

echo "-----------分割线-------------"

cat -s multi_blanks.txt

# cat 的 -T可以把制表符替换成^|

# cat 的 -n在输出时，把每一行前都加上行号

echo "-----------分割线-------------"

cat -n multi_blanks.txt

echo "-----------分割线-------------"

cat -n -b multi_blanks.txt