#!/bin/bash



#日志输入
log() {

   path=$(shell_path)

   template="\e"

   if [ $path = "zsh" ]; then
      template="\033"
   else
      template="\e"
   fi

   case $2 in
   "success")
      echo -e "$template[1;32m$1$template[0m"
      ;;
   "info")
      echo -e "$template[1;34m$1$template[0m"
      ;;
   "warning")
      echo -e "$template[1;33m$1$template[0m"
      ;;
   "error")
      echo -e "$template[1;31m$1$template[0m"
      ;;
   *)
      echo -e "$template[1;34m$1$template[0m"
      ;;
   esac
}

#获取文件的Content-Type
getFileContentType() {

   source=$1

   contentType=""

   if [ -e $source ]; then

      file_name=$(basename "$source")

      filetype="${file_name##*.}"

      case "${filetype}" in
      "jpg" | "png" | "jpeg" | "gif")
         contentType="image/$filetype"
         ;;
      "apk")
         contentType="application/vnd.android.package-archive"
         ;;
      "json")
         contentType="application/json"
         ;;
      *)
         contentType=$(file -ib ${source} | awk -F ";" '{print $1}')
         ;;
      esac
   else
      echo "文件路径不正确，请检查"
   fi

   echo $contentType

}

progressBar() {
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
                    echo -ne "\r${msg} [${bar:0:20}]  \e[1;32m上传完成\e[0m"
          else
                    echo -ne "\r${msg} [${bar:0:$barPosition}${space:$barPosition:20}] ${wheel[$((wheelIndex % 4))]} ${position}%"
          fi
}

# 自定义进度条处理函数
handle_progress() {
    local bar_length=50  # 进度条长度
    while read -r line; do
        local current=$(echo "$line" | awk '{print $1}')
       
        # 过滤非进度数据（仅处理包含7个数字的行）
        if ! echo "$current" | grep -q '^[0-9 ]\+$'; then
            continue
        fi

         progressBar "$1" $current 100
    done
}

OSSUploadFile() {
   host="oss-cn-hangzhou.aliyuncs.com"
   bucket="gzsle-static" # BucketName
   osshost=$bucket.$host
   id="$AccessKeyId"
   key="$AccessKeySecret"
   source=$1
   dest=$2
   file_name=($(basename $source))

   if [[ -z "${dest}" ]]; then
      dest="business_manager_apk/$1"
   fi

   resource="/${bucket}/${dest}"
   # contentType=`file -ib ${source} |awk -F ";" '{print $1}'`
   contentType="$(getFileContentType ${source})"
   dateValue="$(TZ=GMT env LANG=en_US.UTF-8 date +'%a, %d %b %Y %H:%M:%S GMT')"
   stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
   signature=$(echo -en $stringToSign | openssl sha1 -hmac ${key} -binary | base64)

   url=http://${osshost}/${dest}

#    echo "开始上传文件$file_name" 

   curl -q -X PUT -T "${source}" \
      --progress-meter \
      -H "Host: ${osshost}" \
      -H "Date: ${dateValue}" \
      -H "Content-Type: ${contentType}" \
      -H "Authorization: OSS ${id}:${signature}" \
      "${url}" 2>&1 | tr '\r' '\n' | (handle_progress "开始上传文件$file_name")
 
   if [ $? -ne 0 ]; then
      echo "上传阿里云oss失败，请检查文件"
      exit 1
   fi

}

OSSUploadFile "./business_manager_3.9.0.135_250808111603_release.apk" "business_manager_apk/test/business_manager_3.9.0.135_250808111603_release.apk"
