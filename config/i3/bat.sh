#!/bin/sh
mainLoop=true
while [[ $mainLoop -eq true ]]
do
    batPerc=$(acpi -b | awk '{print $4}' | sed 's/%//g' | cut -d "," -f 1)
    isCharging=$(acpi -b | grep -c "Discharging")
    sleep 10
    if [[ $isCharging -eq 1 && $batPerc -lt 4 ]]
    then
        i3lock -e -b -c 080909 -f && systemctl hibernate
        
    fi
done
