#!/bin/bash

cd /home/krch/szn-hlasky/
ls $(ls *.mp3 | cut -f1 -d _ | uniq | sed -n "$(echo $(( $RANDOM % $(ls *.mp3 | cut -f1 -d _ | uniq | wc -l) + 1 )))p")_* |sort -R |tail -$N |while read file; do
  # Something involving $file, or you can leave
  # off the while to just get the filenames
  echo $file
  cvlc -q --play-and-exit other/gongsluz.wav $file
  break
done
