#!/bin/bash

cd /home/krch/szn-hlasky/
ls *.mp3 |sort -R |tail -$N |while read file; do
  # Something involving $file, or you can leave
  # off the while to just get the filenames
  echo $file
  cvlc -q --play-and-exit other/gongsluz.wav $file
  break
done
