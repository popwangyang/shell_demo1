#!/usr/bin/env bash

#输出日期字符串

date +%s

date "+%Y-%m-%d" #2025-08-10

monthNumber=$(date +%m)

echo $monthNumber

#tupt sc 存储光标位置，tput rc 恢复光标位置，tput en 清除光标位置到行未到内容

echo -n Count:

tput sc

count=0

while [ true ]; do
        let count++
        sleep 1s;
        tput rc;
        tput ed;
    if [ $count -lt 4 ]; then
        echo -n $count;
    else 
        echo  $count;
        exit 0;
    fi
done




