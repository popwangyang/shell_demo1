#!/bin/bash -xv

#bash -x debug.sh 开启调试模式的

# for i in {0..6}; do
#     set -x
#     echo "${i}"
#     set +x
# done

_DEBUG="on"

function DEBUG() {
    [ "$_DEBUG" == 'on' ] && "$@" || :
}

for k in {0..7}; do
   DEBUG echo "${k}"
done


