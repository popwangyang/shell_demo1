#!/usr/bin/env bash

#find 命令中的-print0输出内容以\0为分隔符，防止文件名中出现空格，

#IFS=表示临时情况分隔符，防止文件名中的空格被当成分隔符

#read -r 禁止对输入中反斜杠进行转义

#read -d "" 指定 read 的终止符

count=1

find ./renameFiles -maxdepth 1 -type f \( -name "*.txt" -o -name "*.pdf" \) -print0 | while IFS= read -r -d "" file; do
          new=./renameFiles/file-$count.${file##*.}

          echo "Renaming $file to $new"

          mv "$file" "$new"

          let count++
done 

#把*.JPG更新为*.jpg

# rename *.JPG *jpg

#把文件名中的空格替换成_ “'s/ /_/g'” 执行文件替换操作，把空格替换成_，*表示匹配的目标文件

# rename 's/ /_/g' *

#转换文件名的大小写

# rename 'y/A-Z/a-z' *

# rename 'y/a-z/A-Z' *

#把所有的mp3文件移动到给定目录

# find path -type f -name "*.mp3" -exec mv {} target_dir \;

#把文件名中的空格替换成_

# find path -type f -exec rename 's/ /_/g' {} \;

#-exec: 在 find 命令中，-exec 是一个非常强大的选项，用于对找到的文件执行指定的命令。它允许你直接在 find 的结果上操作，而无需额外的管道或循环。

# {}：占位符，表示 find 找到的每个文件的路径（会被实际文件名替换）。

# \;：-exec 选项的终止符（必须用反斜杠转义，告诉 find 命令参数到此结束）。

# find ./renameFiles -type f -name "*.txt" -exec cat {} \;

# find ./renameFiles -type f -name "*.txt" -exec mv {} {}.bak \;

# 若需要多步处理，可在 -exec 中调用 Shell 脚本或用 sh -c 包裹命令：

find ./renameFiles -type f -name "*.pdf" -exec sh -c '
          for file do
                    echo "处理： $file"
          done
' sh {} +;







