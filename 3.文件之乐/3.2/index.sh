#!/usr/bin/env bash

# 生成任意大小的文件，if代表输入文件，/dev/zero是一个字符设备，它会不断返回0值字节。
# of：输出文件，bs: 一块的大小， count: 需要被复制的块数

dd if=/dev/zero of=junk.data bs=1M count=1

#擦除磁盘数据（安全删除）无法恢复

# dd if=/decv/urandom of=/dev/sda bs=1M status=progress