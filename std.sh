#!/usr/bin/env bash

#0（stdin）:标准输入，1（stdout）:标准输出，2（stderr）:标准错误

echo "这是一段文字" > temp.txt

echo "这是一个简单的文字" >> temp.txt

cat temp.txt

# cmd1 2> cmd2 : com1到命令产生的错误重定向到com2中

ls + 2> outerr.txt

# 2>&1 or &> 把stderr转换成stdin，标准错误和标准输出重定向到同一个文件中


# 通过echo生成一个a1文件，以a1文件为蓝本，复制出a2 a3文件，然后在清除a1文件的读写权限。

echo a1 > a1

cp a1 a2; cp a2 a3

chmod 000 a1

cat a*

cat a* 2> err.txt

#tee 仅仅可接收stdin的数据，它可以把一份副本传入到下面的命令中，

cat a* | tee out.txt | cat -n

#<<EOF 和EOF区间的内容将输入到log文件中。
# cat<<EOF>log.txt
# LOGffff
# kskks
# kksks
# EOF

#自定义文件描述符

echo "jsjsjjsjsj" > input.txt

exec 3<input.txt

cat<&3

exec 4>output.txt

echo "kskkskks" >&4

cat output.txt



