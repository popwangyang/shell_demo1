#!/usr/bin/env bash

# find .

# find . -print

# -name 指定文件名所匹配的字符串， -iname是忽略大小写进行匹配。

find . -name "if.sh" -print # 找出if.sh的文件
echo "-----------分割线-------------"
find . -name "e*.sh" -print # 找出e开通的.sh结尾的文件
echo "-----------分割线-------------"
find . -iname "i*.sh" -print # 找出i开头的（忽略大小写）的文件
echo "-----------分割线-------------"
find . \( -name "e*.sh" -o -iname "i*.sh" \) #通过-o匹配多个条件

# -path 是通过路径匹配的。

# -regex 通过正则表达式匹配路径。

# -iregex 通过正则表达式匹配路径(忽略大小写)。

# ！否定参数，否定匹配结果
echo "-----------分割线-------------"
find . ! \( -path "*/.git/*" -o -name ".git" \)  -print #输出除去以e开头的文件列表

#-maxdepth和-mindepth,目录搜索深度，前者设置最大搜索深度，后者设置最小深度，在使用时，一般先设置搜索深度范围，再去搜索文件，比较高效。

find . -maxdepth 1 -name "f*" -print # 仅仅在当前目录中进行搜索

fina . -mindepth 2 -name "f*" -print # 从第二层目录开始搜索

#Unix类系统将一切都当做文件，文件具有不同的类型，普通文件，目录，字符设备，块设备，符号链接，硬链接，套接字以及FIFO。

#-type 可以对文件进行搜索过滤。

find . -type f -print #匹配普通文件

# f 普通文件
# d 目录
# l 符号链接
# c 字符设备
# b 块设备
# s 套接字
# p FIFO

# 根据时间检索文件

# -atime: 用户最近一次访问文件的时间
# -mtime: 文件内容最后一次被修改的时间
# -ctime: 文件元数据最后一次改变的时间
