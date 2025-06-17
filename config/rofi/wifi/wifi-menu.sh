#!/bin/sh
nmcli device wifi rescan
nmcli device wifi list | rofi -dmenu -p "WiFi SSID" | awk '{print $1}' | xargs -r nmcli device wifi connect