#!/bin/bash
#first launch our new term

rxvt-unicode -name aterm-ws2 -tr -fn -artwiz-cure-*-*-*-*-*-*-*-*-*-*-*-* -fg yellow -bg [80]blue +sb --depth 32&

# get rxvt PID list

pids=$(pgrep rxvt-unicode)
xpid=$(echo $pids | rev | cut -d ' ' -f 1 | rev)

echo $pids
echo $xpid
sleep 1

while IFS= read line; do
  if [[ "${line}" =~ (0x)([0-9a-z]+)([ ][- ][0-9]+[ ])([0-9]*) ]]; then
    winId="${BASH_REMATCH[1]}${BASH_REMATCH[2]}"
    pid="${BASH_REMATCH[4]}"
    echo $xpid
    if [[ "${pid}" -eq "${xpid}" ]]; then
	echo $winId		    
        WIND_IDS+=("${winId}")
    fi
  fi
done < <(wmctrl -lp)

if [ "${#WIND_IDS[@]}" -gt 0 ]; then
  echo "${WIND_IDS[0]}"
fi

remdec ${WIND_IDS[0]}

