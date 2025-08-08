#!/bin/bash

loading() {
  # 定义旋转动画字符
  spinner=('|' '/' '-' '\')

  startTxt=$2

  if [[ -z "${startTxt}" ]]; then
    startTxt="程序执行中..."
  fi
  
  successTxt=$3

  if [[ -z "${successTxt}" ]]; then
    successTxt="程序执行完成"
  fi

  startTime=$(date +%s)

   # 创建临时文件存储错误信息（自动清理）
  err_log=$(mktemp)
  trap 'rm -f "$err_log"' EXIT  # 脚本退出时删除临时文件

  # 执行命令：将stderr重定向到临时文件，stdout可保留默认输出
  eval "$1" 2>"$err_log" &
  pid=$!

  # 显示动画，直到后台任务结束
  echo -n "$startTxt "
  while kill -0 $pid 2>/dev/null; do
    for i in "${spinner[@]}"; do
      echo -ne "\b$i"  # \b 退格，覆盖前一个字符
      sleep 0.01
    done
  done

  echo -e "\b "

  wait "$pid"

  exit_code=$?

  endTime=$(date +%s)

  diff=$((endTime - startTime))

  if [ "$exit_code" -eq 0 ]; then
      echo -e "\033[32m${successTxt}\033[0m\033[36m[耗时${diff}s]\033[0m"
  else
     # 失败：显示红色错误信息，并输出错误详情
    error_msg=$(cat "$err_log")  # 读取临时文件中的错误内容
    echo -e "\r\033[31m命令执行失败！\033[0m\033[36m[耗时${diff}s]\033[0m"
    echo -e "\033[31m错误详情：\n$error_msg\033[0m" >&2  # 错误信息输出到stderr
  fi

}

aa() {


  sleep 2

  config_file="config.ini"

  echo "ERROR: 找不到配置文件 $config_file" >&2

  exit 1  # 非零退出码表示脚本执行失败（惯例）

}

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

  echo -ne "\r|${bar:0:$barPosition}$(tput dim)${space:$barPosition:20}$(tput sgr0)| ${wheel[wheelIndex]} ${position}% [ ${msg} ] "
}


progressBar "lslsl" 4  10



# 测试：等待5秒
# loading "aa"

#!/bin/bash

# 模拟进度（0-100%）
# echo -n "进度: ["
# for ((i=0; i<=100; i++)); do
#   printf "%-50s" "|"  # 输出进度条填充部分
#   echo -ne "\r进度: [$i%]"  # \r 回到行首覆盖
#   sleep 0.1  # 模拟耗时操作
# done
# echo -e "\n完成！"


#!/bin/bash

# 启动后台任务
# sleep 3 &
# pid=$!

# # 显示文字动画
# echo -n "处理中"
# while kill -0 $pid 2>/dev/null; do
#   for ((i=0; i<3; i++)); do
#     echo -ne "."
#     sleep 0.5
#   done
#   echo -ne "\b\b\b   \b\b\b"  # 清除三个点
# done

# echo -e "\n处理完成！"