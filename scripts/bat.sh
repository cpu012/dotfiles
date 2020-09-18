#!/bin/zsh
mainLoop=true
while [[ $mainLoop -eq true ]]
do
    batPerc=$(acpi -b | awk '{print $4}' | sed 's/%//g' | cut -d "," -f 1)
    isCharging=$(acpi -b | grep -c "Discharging")
    sleep 10
    if [[ $isCharging -eq 1 && $batPerc -lt 4 ]]
    then
        systemctl hibernate
    elif [[ $isCharging -eq 1 && $batPerc -eq 25 ]]; then
        notify-send -u normal "Battery" "🔋battery is lower than 25%"
    elif [[ $isCharging -eq 1 && $bat_perc -eq 10 ]]; then
        notify-send -u critical "Battery" "🔋battery is lower than 10% (criticaly low)"
    fi
done
