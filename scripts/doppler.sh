#!/bin/sh

notify-send -u low "Loading radar data..."

wget "https://radar.weather.gov/lite/NCR/DIX_loop.gif" -O ~/.cache/radar/reflectivity_composite.gif
wget "https://radar.weather.gov/lite/N0S/DIX_loop.gif" -O ~/.cache/radar/storm_velocity.gif
wget "https://radar.weather.gov/lite/N0R/DIX_loop.gif" -O ~/.cache/radar/reflectivity_base.gif
wget "https://radar.weather.gov/lite/N0V/DIX_loop.gif" -O ~/.cache/radar/base_velocity.gif
wget "https://radar.weather.gov/lite/N1P/DIX_loop.gif" -O ~/.cache/radar/1hr_rain.gif
wget "https://radar.weather.gov/lite/NTP/DIX_loop.gif" -O ~/.cache/radar/storm_rain.gif
wget "https://radar.weather.gov/lite/N0Z/DIX_loop.gif" -O ~/.cache/radar/reflectivity_base_lr.gif

sxiv -a -A8 ~/.cache/radar/reflectivity_base.gif ~/.cache/radar/base_velocity.gif ~/.cache/radar/storm_velocity.gif ~/.cache/radar/reflectivity_composite.gif ~/.cache/radar/reflectivity_base_lr.gif ~/.cache/radar/storm_rain.gif ~/.cache/radar/1hr_rain.gif
