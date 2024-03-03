# AdjLCD - MinUI Tool Paks for controlling Miyoo Mini + Mini Plus screens



## About

This is a collection of Tool Paks for [MinUI](https://github.com/shauninman/MinUI) (20240128b-0 and later). It adds these tools for controlling the LCD screen of a Miyoo Mini/Mini Plus:

- **Dimmest** sets the LCD to the lowest luma possible.
- **Night Filter (Lv 1-5)** replicates the 5-level Blue Light Filter that [XK9274](https://github.com/XK9274) implemented in OnionOS v4.3 (with gracious permission!).
	- **Dimmest** can be used together with **Night Filter**.
- **Reset Screen** resets the screen to MinUI's defaults.

Changes to your screen settings persist across reboots thanks to an `auto.sh` boot-up script. 

Since the Miyoo doesn't have a real-time clock chip and MinUI doesn't have Wifi support at the time of writing, these tools *do not* support scheduled filters.


## Installation

1. You should have [MinUI](https://github.com/shauninman/MinUI) 20240128b-0 or later installed on your SD card.
2. Download [the latest release of AdjLCD](https://github.com/DesiQuintans/adjlcd/releases/latest).
3. Unzip it to the root folder of your Miyoo's SD card. 
	- It should place the AdjLCD pak folders into your `Tools/miyoomini/` directory, e.g. `Tools/miyoomini/Adjust Screen/Dimmest.pak/`. 
	- It should also create `.userdata/miyoomini/auto.sh`, which allows your screen settings to persist across reboots.
4. Feel free to delete unwanted .paks.
5. Find and use these tools in your *Tools* directory from the main menu, under the 'Adjust Screen' category.


If you do not see the *Tools* menu then you may be in Simple Mode; delete the file `/.userdata/shared/enable-simple-mode` to exit Simple Mode. If this file doesn't exist, then you may have extracted the files to the wrong place.


## Preview

### Luma (normal vs dimmest)

![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/luma_normal.png)
![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/luma_dimmest.png)


### Night Filter (Normal, then Lv 1 to 5)

![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/lv0.png)
![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/lv1.png)
![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/lv2.png)
![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/lv3.png)
![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/lv4.png)
![](https://raw.githubusercontent.com/DesiQuintans/adjlcd/main/art/lv5.png)


## License

This is released into the public domain under the Unlicense.



## Changelog


### v1.0.1 (2024-03-04)

- Put all the tools into an 'Adjust Screen' folder inside Tools. Thanks to AsvinDG for the tip.
- Add a 100 ms wait to the colortemp call in auto.sh.
- Change Night Filter names to add their OnionOS equivalents (e.g. 'Lv1' is called 'Subtle' in OnionOS).



### v1.0.0 (2024-03-03)

- Initial release.
