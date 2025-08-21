#!/usr/bin/env bash

sort a.txt -o a.txt; sort b.txt -o b.txt

# 输出的第一列包含只在a.txt中出现的行，第二列包含只在b.txt中出现的行，第三列
# 包含a.txt和b.txt中相同的行。
comm a.txt b.txt

#打印交集
comm a.txt b.txt -1 -2 | sed 's/^\t//'

#求差
comm a.txt b.txt -3 | sed 's/^\t//'

#差集（a）
comm a.txt b.txt -2 -3 | sed 's/^\t//'

#差集（b）
comm a.txt b.txt -1 -3 | sed 's/^\t//'

# -1从输入中删除第一行，-2从输出中删除第二行，-3从输出中删除第三行；
# 格式换输出，通过管道把输出结果输入到sed中，sed过滤每一行，通过匹配行首的\t把它替换成""
