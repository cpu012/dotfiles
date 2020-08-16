#!/bin/zsh
# XXX: dependencies: acpi, zsh, pamixer, pulseaudio, networkmanager

# config
interval=1
sep_sym=' | '

# color config
color_good="#66d16b"
color_normal="#41b8f2"
color_degraded="#007dae"
color_bad="#fa2e28"
color_unk="#cf8dd2"
color_sep=$color_degraded


sep='^c'$color_sep'^'$sep_sym'^d^'
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
    mem_per_used=$(($mem_used_byte * 100 / $mem_total_byte))     # calculate ram used percentage

    # define colors for displaying ram
    if [ $mem_per_used -gt 85 ]; then
        mem_color='^c'$color_degraded'^'
    elif [ $mem_per_used -gt 50 ]; then
        mem_color='^c'$color_bad'^'
    elif [ $mem_per_used -le 50 ]; then
        mem_color='^c'$color_normal'^'
    else
        mem_color='^c'$color_unk'^'
    fi
    mem_format=$mem_color$mem_used' - '$mem_available' ('$mem_per_used'%)'


    # battery
    bat=$(acpi -b)  # get battery info
    bat_path="/sys/class/power_supply/C1F9/"
    bat_state=${${${bat#*: }%, *}%,*}
    bat_per=${${bat#*, }%, *}
    bat_time=$(echo ${(z)${bat#*%, }} | cut -d' ' -f1)
    bat_per_raw=${bat_per%'%'}

    if [ $bat_per_raw -gt 40 ]; then
        bat_color='^c'$color_normal'^'
        if [ $bat_state = 'Charging' ]; then
            bat_color='^c'$color_good'^'
        elif [ $bat_state = 'Full' ]; then
            bat_color='^c'$color_good'^'
        fi
    elif [ $bat_per_raw -le 25 ]; then
        bat_color='^c'$color_bad'^'
    elif [ $bat_per_raw -le 40 ]; then
        bat_color='^c'$color_degraded'^'
    else
        bat_color='^c'$color_unk'^'
    fi

    # draw a batery image representing the battery percentage
    if [ $bat_state = 'Charging' ]; then
        bat_chrg_drw='⚡'
    elif [ $bat_state = 'Full' ]; then
        bat_chrg_drw='⚡'
    fi
    bat_drw=$bat_chrg_drw"^c#cccccc^^r0,7,2,4^^r2,4,22,10^^c#08090e^^r3,5,20,8^"$bat_color"^r"$(( 23 - $bat_per_raw / 5 ))",5,"$(( $bat_per_raw / 5 ))",8^^d^^f24^ "

    bat_format=$bat_color$bat_drw$bat_per' '$bat_time


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

    load_minute=$(echo $load | cut -d' ' -f1)
    load_minute_int=${load_minute//./}

    if [ $load_minute_int -gt 80 ]; then
        load_color='^c'$color_bad'^'
    elif [ $load_minute_int -gt 60 ]; then
        load_color='^c'$color_degraded'^'
    elif [ $load_minute_int -lt 60 ]; then
        load_color='^c'$color_normal'^'
    else
        load_color='^c'$color_unk'^'
    fi

    load_format=$load_color$load


    format=$mem_format$sep$bat_format$sep$load_format$sep$audio_format$sep$time'^d^'
    xsetroot -name $format
    sleep $interval
done
