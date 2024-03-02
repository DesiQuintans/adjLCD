#!/bin/sh

cd "$(dirname "$0")"
bin=/mnt/SDCARD/.system/miyoomini/bin

$bin/show.elf ./reset_splash.png
usleep 500000

echo "csc 0 3 50 50 45 45 0 0" > /proc/mi_modules/mi_disp/mi_disp0
rm -f /mnt/SDCARD/.userdata/miyoomini/adjlcd_csc.txt
usleep 500000

echo "colortemp 0 0 0 0 128 128 128" > /proc/mi_modules/mi_disp/mi_disp0
rm -f /mnt/SDCARD/.userdata/miyoomini/adjlcd_colortemp.txt
usleep 500000
