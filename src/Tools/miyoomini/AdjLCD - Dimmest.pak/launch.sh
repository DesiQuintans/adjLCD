#!/bin/sh

cd "$(dirname "$0")"
bin=/mnt/SDCARD/.system/miyoomini/bin


$bin/show.elf ./dimmest_splash.png
usleep 500000

# By default, luma is set to 45.
# According to reddit posts, Miyoo Minis V1 and V2 had a minimum luma of 6 or else the screen turns off.
lastLuma=45
endLuma=6


for i in $(seq 0 20); do
    newLuma=$(( lastLuma + (endLuma - lastLuma) * i / 20 ))
    csc_call="csc 0 3 50 50 $newLuma 45 0 0"

	#    csc [dev] [cscMatrix] [contrast] [hue] [luma] [saturation] [sharpness] [gain]
	echo "$csc_call" > /proc/mi_modules/mi_disp/mi_disp0

    usleep 50000
done

echo "$csc_call" > /mnt/SDCARD/.userdata/miyoomini/adjlcd_csc.txt
sync

usleep 500000
