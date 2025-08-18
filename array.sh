#!/usr/bin/env bash


#定义数组
array_var=(1 2 3 4 5 6)

array_var1=()
array_var1[0]="iii0"
array_var1[1]="iii1"
array_var1[2]="iii2"
array_var1[3]="iii3"
array_var1[4]="iii4"
array_var1[5]="iii5"

#输出数组的所有值

# echo "${array_var[*]}"

# echo "${array_var1[@]}"

#打印数组的长度

# echo "${#array_var[*]}"

#关联数组（bash4支持）

# declare -A ass_array

# ass_array=(a=1 b=2 c=3)

# echo "${ass_array[a]}"

# bash --version
shopt -s expand_aliases  # 开启别名扩展

alias cp='echo $@'

cp "kskkksks"

#对别名进行转义后，执行它本来的命令

\cp a2 a4