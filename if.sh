#!/usr/bin/env bash


# &&逻辑与运算：[ condition ] && action 如果condition为真，则执行action
# &&逻辑或运算：[ condition ] || action 如果condition为假，则执行action

#算术比较，条件放在中括号中，且中括号前后要有空格，如果没有空格，程序会报错。

#-gt: >
#-lt: <
#-ge: >=
#-le: <=
#-eq: =
#-nq: !=
#-a: &&
#-o: ||

function getNumRange() {
          if [ $1 -ge 0 -a $1 -le 50 ]; then
                    echo "数据区间在0~50之间"
          elif [ 50 -le $1 -a $1 -le 100 ]; then
                    echo "数据区间在50~100之间"
          else
                    echo "psppsps"
          fi
}

getNumRange 10

getNumRange 80

#文件系统相关测试

#[ -f $file_var ]: 检测是否是正常的文件路径或者文件名
#[ -d $var ]: 检测是否是目录
#[ -e $var ]: 检测是否是文件
#[ -x $var ]: 检测是否可执行
#[ -c $var ]: 检测是否是字符设备（终端，虚拟控制台，串口）
#[ -b $var ]: 检测是否是块设备（硬盘，分区，U盘）
#[ -w $var ]: 检测是否可写
#[ -r $var ]: 检测是否可读

#字符串比较使用双中括号（比较时=好两边都要有空格）
#[[ $str1 = $str2 ]] 或者 [[ $str1 == $str2 ]]比较两个字符串是否相同
#[[ $str1 != $str2 ]] 检测字符串是否不相等
#[[ -z $str1 ]] 检测字符串是否为空字符串
#[[ -n $str1 ]] 检测字符串是否为非空字符串

#使用&&和||组合多个条件

str1="Not empty"
str2=""
if [[ -n $str1 ]] && [[ -z $str2 ]];
then
          echo "kskkssk"
fi

#使用test改写版本
str1="Not empty"
str2=""
if test -n "$str1" && test -z "$str2";
then
          echo "kskkskfdk"
fi









