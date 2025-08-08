#!/usr/bin/env bash

# printf "格式字符串" [参数1 参数2 ...]

# %s: 字符串输出
printf "Hello %s\n" World

# %d: 十进制输出
printf "Num: %d\n" 1992

# %f: 浮点数 (四舍五入两位小数)
printf "Pi: %.2f\n" 3.15928

# %c: 单个字符
printf "Char: %c\n" 65

# %x: 十六进制（小写）
printf "Hex: %x\n" 255

# %%: 输出百分号本身
printf "Rate: 50%%\n"

# 格式控制
# %10s：占 10 个字符宽度，右对齐
# %-10s：占 10 个字符宽度，左对齐
printf "%-10s %5d\n" Apple 10 Banana 20

# 浮点数精度
#%.2f: 四舍五入保留2位小数
printf "圆周率是：%.3f\n" 3.1415926

# 格式化显示商品信息
printf "%-15s %10s %8s\n" "商品" "单价" "数量"
printf "%-15s %10.2f %8d\n" "苹果" 3.82828 20
printf "%-15s %10.2f %8d\n" "苹果" 3.82828 20
printf "%-15s %10.2f %8d\n" "苹果" 3.82828 20

# 批量处理数组
names=("Alice" "Bob" "Charlie")
for item in "${names[@]}"; do
          printf "Hello, %s!\n" $item;
done

# 数字格式化
printf "ID: %04d\n" 12


echo "ff 19 100 10 19" | awk '{
  split($0, a, " ")  # 按空格分割字符串到数组a
  print a[1]         # awk中用print输出，数组索引从1开始
}'

# # 循环输出进度，替换原有内容
# for i in {1..100}; do
#     # \r 回到行首，不换行输出
#     printf "\r进度: %d%%" $i

#     # 延迟一段时间，便于观察效果
#     sleep 0.1
# done

# # 最后换行，避免后续输出与当前行重叠
# echo



# Usage: progressBar "message" currentStep totalSteps
function progressBar() {
          local   bar='████████████████████'
          local space='....................'
          local wheel=('\' '|' '/' '-')

          local msg="${1}"
          local current=${2}
          local total=${3}
          local wheelIndex=$((current % 4))
          local position=$((100 * current / total))
          local barPosition=$((position / 5))
          if (( current == total )); then
                    echo -ne "\r[${bar:0:20}] ${position}% "
          else
                    echo -ne "\r[${bar:0:$barPosition}${space:$barPosition:20}] ${wheel[$((wheelIndex % 4))]} ${position}%"
          fi
}



for i in {1..100}; do
    # \r 回到行首，不换行输出
    progressBar "下载中" $i 100

    # 延迟一段时间，便于观察效果
    sleep 0.01
done


