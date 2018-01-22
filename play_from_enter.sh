#!/bin/bash

num_types=$(ls ./mp3_for_enter/ | cut -f1 -d _ | uniq | wc -l)
random_type_num=$(echo $(( $RANDOM % $num_types + 1 )))
random_type_name=$(ls ./mp3_for_enter/ | cut -f1 -d _ | uniq | sed -n "${random_type_num}p")
ls ./mp3_for_enter/${random_type_name}_* |sort -R |tail -$N |while read file; do
  echo $file
  cvlc -q --play-and-exit $file
  break
done
