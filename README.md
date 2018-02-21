# i3-configs
![The Python configs as of 22 February 2018 running on Arch Linux with i3 4.14.1](https://fusion809.github.io/images/i3/i3-4.14.1-my-configs-20180222.png)

<!--upload/download rates (unfortunately they are incredibly inaccurate, sometimes they will show 0 kB/s even when download/upload rates are > 1,000 kB/s, if you know how to make it accurate please file a new issue or pull request and I will happily accept it!), -->
This repository contains my i3 configs. There are two main routes of using them. Either you can use the i3pystatus (yes you will need to install i3pystatus, a bleeding-edge, from lastest git snapshot, version of the package is needed!) powered bar or the C/C++/Shell-powered bar. 

The C/C++/Shell-powered bar includes weather conditions (including temperatures; presently calculates it for my location, feel free to edit it in `~/.i3/i3status.sh`), uptime, % CPU used, RAM usage, core temperatures (set up for my system in particular so may not work for others. It is fairly easy to edit `~/.i3/i3status.sh` to set it up for your system) and time. 

The Python-based (or i3pystatus) bar displays the following: weather conditions (although sometimes it botches it and labels the temperature in Farenheit as degrees Celsius), download/upload rates for wlo1 (not hard to change to another interface by editing `~/.i3/i3status.py`), uptime, disk space (used/total), core temperatures, CPU usage (%), load (average over 1 minute), RAM usage (used/total) and date. 

## What's in the i3bar (Python)
Presently the following are in the i3bar, from left to right:
* Atom update status. 'A OK' means there's no Atom beta channel updates, while if it says 'A' with a package version after it there is a new release and that is the version of the release. 
* Sway update status. 'S OK' means there's no Sway updates. As above, if a version is given instead of 'OK' that means there's a new version and that is it.
* Vim update status, formatting/meaning as per above.
* Visual Studio Code update status, formatting as per above.
* Uptime, format: h:m:s. Unfortunately I cannot get it to show it in my preferred format of hh:mm:ss. So, for example, you see 0:0:2 if the system has been up two seconds (and no Arch doesn't boot that quickly for me :P), as opposed to how I would like it to the hh:mm:ss format of 00:00:02. Likewise if the system has been up for 13 hours, 12 minutes and 5 seconds it would be formatted as 13:12:5. 
* Weather conditions, such as 'Partly Cloudy 28°C' (which yes is the condition given at the time of typing).
* Battery status.
* Download rate, upload rate over the wlo1 interface.
* Core temperature in °C.
* CPU usage in %.
* CPU load.
* RAM usage in format used/totalG. for example 2.764/15.606G would indicate that 2.764 GiB is in use, but a total of 15.606 GiB is available. 
* Disk usage (root partition), in the same format as RAM usage was.
* Data partition usage, also in the used/totalG format.
* Date and time by local time in format: %a %-d %b %y %r. For example, Sat 23 Dec 17 07:27:32 PM. 

## Requirements
For these configs to work out-of-the-box one needs to have the following installed:

* feh for desktop background.
* g++ for CPU/RAM information.
* i3bar.
* i3pystatus (for Python-based counterpart of the bar)
* ImageMagick, so that one can take screenshots with <kbd>PrtScrn</kbd> (or <kbd>Print</kbd> or <kbd>PrntScr</kbd>).
* tmux, for the terminal split views.
* xterm, for the <kbd>Win</kbd>+<kbd>Tab</kbd> shortcut to open a terminal.
* Zsh, which is required for the floating point arithmetic used in download/upload calculations. 

## Quick install
To install on distributions without the bash executable in `/bin` run:

```bash
bash -c "$(wget -cqO- https://git.io/vHDJ7)"
```

while for those with bash in `/bin` run:

```bash
/bin/bash -c "$(wget -cqO- https://git.io/vHDUm)"
```

## Customization
If you do not want to use these apps (xterm and ImageMagick) and want to use alternative apps edit `~/.i3/config` accordingly. Likewise these configs are set up for PCs with 5 or more cores. If your screen is small and the i3bar does not seem to fit properly on your screen I would suggest editing the font setting line in `~/.i3/config` accordingly. If you use some other internet connection than wlo1 you will need to edit the `~/.i3/download.sh` and `~/.i3/upload.sh` files to use your network connection.

## Shortcuts
| Shortcut                                                                        | Action                                                                                                         |
|---------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| <kbd>F1</kbd>                                                                   | Switch to workspace 1.                                                                                         |
| <kbd>F3</kbd>                                                                   | Switch to workspace 3.                                                                                         |
| <kbd>F4</kbd>                                                                   | Switch to workspace 4.                                                                                         |
| <kbd>F5</kbd>                                                                   | Switch to workspace 5.                                                                                         |
| <kbd>F6</kbd>                                                                   | Switch to workspace 6.                                                                                         |
| <kbd>F7</kbd>                                                                   | Switch to workspace 7.                                                                                         |
| <kbd>F8</kbd>                                                                   | Switch to workspace 8.                                                                                         |
| <kbd>F9</kbd>                                                                   | Switch to workspace 9.                                                                                         |
| <kbd>F10</kbd>                                                                  | Change to the workspace where PCManFM is running.                                                              |
| <kbd>F11</kbd>                                                                  | Change to workspace where an instance of VLC is running.                                                       |
| <kbd>F12</kbd>                                                                  | Change to workspace where an instance of xterm is running.                                                     |
| <kbd>Alt</kbd>+<kbd>d</kbd>                                                     | Focus the child container.                                                                                     |
| <kbd>Win</kbd>+<kbd>&larr;</kbd>                                                | Focus left.                                                                                                    |
| <kbd>Win</kbd>+<kbd>&rarr;</kbd>                                                | Focus right.                                                                                                   |
| <kbd>Win</kbd>+<kbd>&uarr;</kbd>                                                | Focus up.                                                                                                      |
| <kbd>Win</kbd>+<kbd>&darr;</kbd>                                                | Focus down.                                                                                                    |
| <kbd>Win</kbd>+<kbd>Enter</kbd>                                                 | Launch xterm.                                                                                                  |
| <kbd>Win</kbd>+<kbd>Tab</kbd>                                                   | Launch xterm.                                                                                                  |
| <kbd>Win</kbd>+<kbd>;</kbd>                                                     | Focus right.                                                                                                   |
| <kbd>Win</kbd>+<kbd>0</kbd>                                                     | Switch to workspace 10.                                                                                        |
| <kbd>Win</kbd>+<kbd>2</kbd>                                                     | Switch to workspace 2.                                                                                         |
| <kbd>Win</kbd>+<kbd>a</kbd>                                                     | Focus the parent container.                                                                                    |
| <kbd>Win</kbd>+<kbd>c</kbd>                                                     | Launch Chromium browser.                                                                                       |
| <kbd>Win</kbd>+<kbd>d</kbd>                                                     | Launch Rofi (drun mode) so you can enter in a command to run.                                                             |
| <kbd>Win</kbd>+<kbd>e</kbd>                                                     | Layout toggle split.                                                                                           |
| <kbd>Win</kbd>+<kbd>f</kbd>                                                     | Enter full screen for the focused window.                                                                      |
| <kbd>Win</kbd>+<kbd>g</kbd>                                                     | Launch 0 A.D. with Bumblebee (Optirun).                                                                        |
| <kbd>Win</kbd>+<kbd>h</kbd>                                                     | Split horizontally.                                                                                            |
| <kbd>Win</kbd>+<kbd>i</kbd>                                                     | Launch i3-input.                                                                                               |
| <kbd>Win</kbd>+<kbd>j</kbd>                                                     | Focus left.                                                                                                    |
| <kbd>Win</kbd>+<kbd>k</kbd>                                                     | Focus down.                                                                                                    |
| <kbd>Win</kbd>+<kbd>l</kbd>                                                     | Focus up.                                                                                                      |
| <kbd>Win</kbd>+<kbd>m</kbd>                                                     | Launch MarvinSketch (installed from [fusion809-overlay](https://github.com/fusion809/fusion809-overlay))       |
| <kbd>Win</kbd>+<kbd>o</kbd>                                                     | Launch RuneScape NXT Client with Optirun (Bumblebee).                                                          |
| <kbd>Win</kbd>+<kbd>p</kbd>                                                     | Launch PCManFM (LXDE's file manager).                                                                          |
| <kbd>Win</kbd>+<kbd>q</kbd>                                                     | Kill focused window.                                                                                           |
| <kbd>Win</kbd>+<kbd>s</kbd>                                                     | Layout stacking.                                                                                               |
| <kbd>Win</kbd>+<kbd>t</kbd>                                                     | Launch Tor Browser (en).                                                                                       |
| <kbd>Win</kbd>+<kbd>v</kbd>                                                     | Split vertically.                                                                                              |
| <kbd>Win</kbd>+<kbd>w</kbd>                                                     | Layout tabbed.                                                                                                 |
| <kbd>Win</kbd>+<kbd>Print</kbd>                                                 | Start recording the screen.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>&larr;</kbd>                               | Move left.                                                                                                     |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>&rarr;</kbd>                               | Move right.                                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>&uarr;</kbd>                               | Move up.                                                                                                       |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>&darr;</kbd>                               | Move down.                                                                                                     |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>Space</kbd>                                | Toggle between tiling and floating.                                                                            |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>:</kbd>                                    | Move right.                                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>10</kbd>                                   | Move window to workspace 10.                                                                                   |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>1</kbd>                                    | Move window to workspace 1.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>2</kbd>                                    | Move window to workspace 2.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>3</kbd>                                    | Move window to workspace 3.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>4</kbd>                                    | Move window to workspace 4.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>5</kbd>                                    | Move window to workspace 5.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>6</kbd>                                    | Move window to workspace 6.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>7</kbd>                                    | Move window to workspace 7.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>8</kbd>                                    | Move window to workspace 8.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>9</kbd>                                    | Move window to workspace 9.                                                                                    |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>c</kbd>                                    | Reload the configuration file.                                                                                 |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>e</kbd>                                    | Exit i3 (log out of X session).                                                                                |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>f</kbd>                                    | Launch Firefox.                                                                                               |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>j</kbd>                                    | Move left.                                                                                                     |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>k</kbd>                                    | Move down.                                                                                                     |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>l</kbd>                                    | Move up.                                                                                                       |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>m</kbd>                                    | Launch Virt Manager.                                                                                           |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>o</kbd>                                    | Launch OpenRA.                                                                                                 |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>p</kbd>                                    | Launch VLC media player.                                                                                       |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>r</kbd>                                    | Restart i3 (preserves layout and session), can be used to start a newly installed version of i3.               |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>v</kbd>                                    | Launch Oracle VM VirtualBox.                                                                                   |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>w</kbd>                                    | Rofi (window option).                                                                                          |

