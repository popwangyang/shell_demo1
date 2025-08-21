#!/usr/bin/env bash

# split -b 500k data.log -d -a 4 split_file --additional-suffix=.txt

# csplit -s split_num.txt /server/ {*} -f line_ -n 2 -b "%2d.txt";

# cat line_* > catfile.txt

filename="sample.jpg"
name=${filename%.*}
echo "${filename}的文件名是$name"

extension=${filename#*.}
echo "${filename}的扩展名是$extension"

