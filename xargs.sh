#!/usr/bin/env bash

# cat ./example.txt

# cat ./example.txt | xargs -n 3

# echo 'splitBsplitBsplitBsplitBsplitBsplit' | xargs -d B -n 2

cecho() {
   echo $*#
}

cat args.txt | xargs -L 3 -n 2 $cecho
