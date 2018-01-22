#!/bin/bash

while true; do
  pressed=false
  cat /dev/input/$(grep -E  'Handlers|EV=' /proc/bus/input/devices | grep -B1 'EV=120013' |  grep -Eo 'event[0-9]+') | \
  while read -rsn1 foo; do
    if echo "$foo" | od | grep "0000000" > /dev/null; then
      if $pressed; then
        break
      fi
      ./play_from_enter.sh
      pressed=true
    fi
#    printf "play"
  done | nl -bn
done
