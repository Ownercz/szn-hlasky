#!/bin/bash

num_types=$(ls ./mp3_for_enter/ | cut -f1 -d _ | uniq | wc -l)
random_type_num=$(echo $(( $RANDOM % $num_types + 1 )))
random_type_name=$(ls ./mp3_for_enter/ | cut -f1 -d _ | uniq | sed -n "${random_type_num}p")
declare -A guys=(
["10.0.132.26"]="gaba"
["10.0.132.28"]="lada"
["172.24.1.107"]="vidlak"
)
if [[ ${guys[$SOCAT_PEERADDR]} ]]; then
  cvlc -q --play-and-exit ./other/${guys[$SOCAT_PEERADDR]}.mp3
fi
echo "no - $SOCAT_PEERADDR" >> /tmp/odkoho
ls ./mp3_for_enter/${random_type_name}_* |sort -R |tail -$N |while read file; do
  echo $file
  cvlc -q --play-and-exit $file
  break
done
