#!/usr/bin/env bash

#var = value 不同于 var=value,前者是相等操作，后者是赋值操作。

#在shell脚本中定义环境变量：HTTP_PROXY=192.168.1.23:3128;export HTTP_PROXY。
#export命令用来设置环境变量，当前脚本就会集成这个变量了。

# echo $PATH

#PATH通常定义在/etc/environment或者/etc/profile或者~/.bashrc中
#在PATH中添加一个新的路径：
# PATH="$PATH:/hommmmmmmmmmmmmmmmmmmmm/user/bin"

# export PATH

# echo $PATH

# #或者

# export PATH="$PATH:/hommmmmmmmmmmmmmmmmmmmm/user/bin"

# echo $PATH

#获取变量字符串的长度

var="kskskssksskksk"

length=${#var}

printf "变量var的长度是 %d\n" $length

#识别当前所使用的shell

echo $SHELL

#或者
#该方法仅仅在命令行中可用，在文件中会把文件的路径输出
echo $0

#检测是否是管理员运行UID为0是root用户

if [ "${UID}" -ne 0 ]; then
   echo "普通用户运行"
else 
  echo "超级用户运行"
fi

prepend() {
  [ -d "$2" ] && eval $1=\"$2':'\$$1\" && export $1;
}

#讲解 【 -d "$2" 】检测函数第二个参数指定的目录是否存在， eval命令将$2添加到$1中，以:分隔开，如果$1为空，会在结尾处留下一个“:”
#改良版本的：

prependPro() {
  [ -d "$2" ] && eval $1=\"$2\$\{$1:+':'\$$1\}\" && export $1;
}

#eg: ${parameter:+expression}如果parameter不为空，则使用expression。

a="88"
b="kkkk"
c="${a:+$b}828828"  # 正确写法，去掉内部的引号
echo "$c"

