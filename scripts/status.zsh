#!/bin/zsh
# NOTE: this script is designed for dwm with the 2dstatus patch, will not work on most other wm/de, it does not work with the stdin patch.
# NOTE: the battery part will not work on laptops with more than one battery
# XXX: dependencies: acpi, zsh, pamixer, pulseaudio, networkmanager

# config
interval=1


while [ true ]; do
    time=$(date +%Y\ %b\ \(%a.\)\ %I:%M:%S\ %p)  # get current time


    # ram & swap
    mem_cmd_byte=$(free)
    mem_cmd=$(free -h)
    mem=${(z)${${mem_cmd#*Mem:}%Swap:*}}    # get ram usage
    mem_byte=${(z)${${mem_cmd_byte#*Mem:}%Swap:*}}    # get ram usage in bytes

    mem_used=$(echo $mem | cut -d' ' -f2)
    mem_available=$(echo $mem | cut -d' ' -f6)
    mem_total=$(echo $mem | cut -d' ' -f1)

    mem_used_byte=$(echo $mem_byte | cut -d' ' -f2)
    mem_total_byte=$(echo $mem_byte | cut -d' ' -f1)
    
    mem_per_used=$(($mem_used_byte * 100 / $mem_total_byte))'%'     # calculate ram used percentage

    mem_format=$mem_used' - '$mem_available' ('$mem_per_used')'


    # battery
    bat=$(acpi -b)  # get battery info
    bat_path="/sys/class/power_supply/C1F9/"
    bat_state=${${${bat#*: }%, *}%,*}
    bat_per=${${bat#*, }%, *}
    bat_time=$(echo ${(z)${bat#*%, }} | cut -d' ' -f1)
    bat_draw=$(echo - | awk "{printf \"%.1f\", $(( $(cat $bat_path'current_now') * $(cat $bat_path'voltage_now') )) / 1000000000000 }" ; echo "W")

    bat_format=$bat_state' '$bat_per' '$bat_time' ('$bat_draw')'


    # audio
    audio_vol=$(pamixer --get-volume-human)
    audio_state='🔊'
    if [[ $audio_vol = "muted" ]]; then
        audio_state='🔇'
        audio_vol='0%'
    fi

    audio_format=$audio_state' '$audio_vol


    # load
    load_cmd=$(uptime)
    load=${${load_cmd#*average: }//,/}

    load_format=$load


    # networking
    net_connection=$(echo ${(z)$(nmcli c show)} | cut -d' ' -f5)
    net_quality=$(echo ${(z)$(nmcli d wifi list | grep '*')} | cut -d' ' -f8)

    net_format=$net_quality'% ('$net_connection')'


    format=$mem_format' | '$bat_format' | '$net_format' | '$load_format' | '$audio_format' | '$time
    xsetroot -name $format
    sleep $interval
done
