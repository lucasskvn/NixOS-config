#!/usr/bin/env bash

pkill waybar

rm -rf ~/.cache/spotify 

swww init &

waybar &

exec ~/.config/waypaper/wallpaper.sh

dunst