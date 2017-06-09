# i3-configs
![The configs as of 27 May 2017 running on Gentoo Linux with i3 4.13](https://fusion809.github.io/images/desktop-environments/i3-4.13-my-configs-27May2017.png)

This repository contains my i3 configs. The i3bar includes uptime, upload/download rates, % CPU used, RAM usage, CPU load, core temperatures (set up for my system in particular so may not work for others) and time. 

## Requirements
For these configs to work out-of-the-box one needs to have the following installed:

* feh for desktop background
* g++ for CPU/RAM information
* i3bar
* ImageMagick, so that one can take screenshots with <kbd>PrtScrn</kbd> (or <kbd>Print</kbd> or <kbd>PrntScr</kbd>).
* Terminology, for the <kbd>Win</kbd>+<kbd>Enter</kbd> shortcut to open a terminal.
* Zsh, which is required for the floating point arithmetic used in download/upload calcs. 

## Customization
If you do not want to use these apps (Terminator and Spectacle) and want to use alternative apps edit `~/.i3/config` accordingly. Likewise these configs are set up for PCs with 5 or more cores. If your screen is small and the i3bar does not seem to fit properly on your screen I would suggest editing the font setting line in `~/.i3/config` accordingly. If you use some other internet connection than wlo1 you will need to edit the `~/.i3/download.sh` and `~/.i3/upload.sh` files to use your network connection.

## Shortcuts
| Shortcut                                                                          |                           Action                                                                                |
|-----------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| <kbd>F11</kbd>                                                                    | Change to workspace where an instance of VLC is running.                                                        |
| <kbd>F12</kbd>                                                                    | Change to workspace where an instance of Terminology is running.                                                |
| <kbd>Win</kbd>+<kbd>Enter</kbd>                                                   | Launch Terminology.                                                                                             |
| <kbd>Win</kbd>+<kbd>0</kbd>                                                       | Launch 0 A.D. with Optirun (Bumblebee).                                                                         |
| <kbd>Win</kbd>+<kbd>c</kbd>                                                       | Launch Chromium browser.                                                                                        |
| <kbd>Win</kbd>+<kbd>d</kbd>                                                       | Launch dmenu_run so you can enter in a command to run.                                                          |
| <kbd>Win</kbd>+<kbd>g</kbd>                                                       | Launch Google Chrome browser.                                                                                   |
| <kbd>Win</kbd>+<kbd>i</kbd>                                                       | Launch i3-input.                                                                                                |
| <kbd>Win</kbd>+<kbd>m</kbd>                                                       | Launch MarvinSketch (installed from [fusion809-overlay](https://github.com/fusion809/fusion809-overlay))        |


