#!/bin/sh


# AdjLCD - Persistent screen settings on boot-up.

csc_file=/mnt/SDCARD/.userdata/miyoomini/adjlcd_csc.txt
colortemp_file=/mnt/SDCARD/.userdata/miyoomini/adjlcd_colortemp.txt

if [ -f "$colortemp_file" ]; then
    colortemp_call=`cat "$colortemp_file"`
    echo "$colortemp_call" > /proc/mi_modules/mi_disp/mi_disp0
fi

if [ -f "$csc_file" ]; then
	# colortemp can be called without delay, but csc needs a short wait or else it won't be applied.
	# 125000 was too short, 250000 was fine, so I'm giving it 300000 for a safety margin.
	usleep 300000
    csc_call=`cat "$csc_file"`
    echo "$csc_call" > /proc/mi_modules/mi_disp/mi_disp0
fi

# End AdjLCD boot-up section.
