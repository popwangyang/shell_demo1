#!/usr/bin/env bash

# ls | cat -n > out.txt

# cmd_output=$(ls | cat -n)

# echo $cmd_output

#利用子shell生成一个独立的进程，在子shell中做的操作不会影响到当前shell
#可以使用（）生成一个子shell

# pwd;
# (cd ../; ls)
# pwd

#可以把子shell放到双引号中，以保留子shell中的空格和换行符
echo -e "1\n2\n3\n" > text.txt

cat text.txt

out=$(cat text.txt)
echo $out

out="$(cat text.txt)"
echo $out