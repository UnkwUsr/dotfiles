#!/bin/bash
while true
do
    sleep 300

    battery_level="$(acpi -b)"
    if [[ ! "$battery_level" =~ "Discharging" ]];then
        echo 'not discharging, skip'
        continue
    fi

    battery_level="$(echo "$battery_level" | grep -P -o '[0-9]+(?=%)')"
    if [ "$battery_level" -le 15 ]; then
       notify-send -u critical "Battery low" "${battery_level}%"
    fi
done
