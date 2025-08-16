#!/usr/bin/env bash

#let命令可以执行基本的数学操作，当使用let时变量前可以不用加$。

a=10

b=20

let result=a+b

printf "a+b=%d\n" $result

let a++

let b--

let a+=6

let b-=6

echo "a=$a, b=$b"

#在[ ]中执行的命令和let类似,其中变量可使用$前缀也可不使用。

d=$[ a + b ]

c=$[ $a - $b ]

echo "d的值是$d, c的值是$c"

g=$[ $a / $b ]

# printf "%d / %b = %.2f\n" $a $b $g

#在（（））中执行必须加$前缀。

f=$(( $a / $b ))

# printf "%d / %b = %.2f\n" $a $b $f

#以上仅仅用于整数运算，不能进行浮点数计算。


#基本运算符中使用的除法都是整除法，得到的结果为向下取整的整数，如需精确小数，可使用bc 或 awk 等工具

i=$(echo "scale=10; $a / $b" | bc)

printf "%d / %b = %.10f\n" $a $b $i
