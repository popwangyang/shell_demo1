#!/usr/bin/env bash

files=`find . -maxdepth 1 -type f -name "*.txt"`

readFile() {

          sleep 5s

          echo 开始嗑生嗑死开始看$*
          
}

PIDARRAY=()
for file in $files;
do
          readFile $file &

          PIDARRAY+=("$!")
done

wait ${PIDARRAY[@]}

sleep 1s

echo "kskskskk ${PIDARRAY[@]}"
