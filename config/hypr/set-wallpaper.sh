#!/bin/bash

# Dossier contenant les wallpapers
WALLPAPER_DIR="$HOME/Wallpapers"

# Associer un fond d'écran à chaque workspace
case $1 in
  1) WALLPAPER="$WALLPAPER_DIR/wall1.jpg" ;;
  2) WALLPAPER="$WALLPAPER_DIR/wall2.jpg" ;;
  3) WALLPAPER="$WALLPAPER_DIR/wall3.jpg" ;;
  *) WALLPAPER="$WALLPAPER_DIR/default.jpg" ;;
esac

swww img "$WALLPAPER" --transition-type grow --transition-fps 60
