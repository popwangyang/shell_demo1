#!/usr/bin/env bash

#IFS的默认值为空白符
#把定界符更新为“,”，然后对data字符串在for循环中进行拆分，最后重置定界符。

data="name,sex,rollno,location"

oldIFS=$IFS;

IFS=,

for item in $data; do 
          echo Item: $item
done

IFS=$oldIFS

#解析字符串“root:x:0:0:root:/root:/bin/bash”

line="root:x:0:0:root:/root:/bin/bash"

oldIFS=$IFS

IFS=":"

count=0

for item in $line; do

  [ $count -eq 0 ] && user=$item
  [ $count -eq 6 ] && shell=$item

  let count++

done;

IFS=$oldIFS

echo "$user's shell is $shell"

#输出区间列表{a..z}，{A..Z}，{0..50}

echo {0..50}

#until循环：当给定的条件为真时，才停止循序。

x=0
until [ $x -eq 9 ];
do
  let x++; echo $x;
done