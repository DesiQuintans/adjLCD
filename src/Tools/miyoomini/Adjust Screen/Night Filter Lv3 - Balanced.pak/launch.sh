#!/bin/sh

cd "$(dirname "$0")"
bin=/mnt/SDCARD/.system/miyoomini/bin

$bin/show.elf ./filter_splash.png
usleep 500000

# Assume that we're always starting from a neutral colour temp (easier than trying to save it between sessions).
lastB=128
lastG=128
lastR=128


# These endpoint RGB values are from https://github.com/XK9274 who implemented the Blue Light Filter in OnionOS v4.3.
# They're replicated here with permission; thanks!
# https://github.com/OnionUI/Onion/blob/b5b77c2958dbad6a62e71e33082e9414d9993cad/static/build/.tmp_update/script/blue_light.sh#L21

# # Intensity 1
# endB=110
# endG=125
# endR=140

# # Intensity 2
# endB=100
# endG=120
# endR=140

# Intensity 3
endB=90
endG=115
endR=140

# # Intensity 4
# endB=80
# endG=110
# endR=140

# # Intensity 5
# endB=70
# endG=105
# endR=140


for i in $(seq 0 20); do
    newB=$(( lastB + (endB - lastB) * i / 20 ))
    newG=$(( lastG + (endG - lastG) * i / 20 ))
    newR=$(( lastR + (endR - lastR) * i / 20 ))

    colortemp_call="colortemp 0 0 0 0 $newB $newG $newR"

    echo $colortemp_call > /proc/mi_modules/mi_disp/mi_disp0
    usleep 50000
done

echo "$colortemp_call" > /mnt/SDCARD/.userdata/miyoomini/adjlcd_colortemp.txt
sync

usleep 500000
