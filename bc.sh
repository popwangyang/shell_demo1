#!/usr/bin/env bash


#bc是一个用于数学运算的高级工具，可以借助它来进行一些高级函数运算

echo "4 * 0.56"

echo "4 * 0.56" | bc

#精确小数位数

f=$(echo "scale=10;10/3" | bc)

printf "10 / 3 = %.10f\n" $f

#进制转换

no=100

echo "obase=2;$no" | bc

no=1100100

echo "obase=10;ibase=2;$no" | bc

echo "sqrt(100)" | bc

echo "10^10" | bc

