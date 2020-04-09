# i3-configs (nixos branch)
![Screenshot of i3 set up using these configs as of 10 April 2020 (b875d43fa891aadbebd3ebf614c3769e950aba50)](https://fusion809.github.io/images/i3/i3-4.18-nixos-configs-20200410-b875d43fa891aadbebd3ebf614c3769e950aba50.png)

***Figure 1: this is what my i3 desktop, using these configs (specifically commit b875d43fa891aadbebd3ebf614c3769e950aba50), looks like as of 10 April 2020 (wallpaper is [this](https://github.com/fusion809/artwork/blob/master/Flags/Boomerang%20with%20white%20star%2C%20blue%20background%20to%20white%20southern%20cross.svg)).***

This repository contains my i3 configs. There are some shell/C/C++ powered scripts in this repository that are redundant, they are kepted in `.redundant/` in case they become useful some time in the future, but for now they are broken.

The Python-based (or i3pystatus) bar displays the following: weather conditions (although sometimes it botches it and labels the temperature in Farenheit as degrees Celsius), download/upload rates, uptime, disk space (used/total), CPU usage (%), load (average over 1 minute), RAM usage (used/total) and date. 

## Requirements
The following must be in your `/etc/nixos/configuration.nix` file:

```bash
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.extraPackages = with pkgs; [
     i3status
     (python37.withPackages(ps: [ (ps.toPythonModule (i3pystatus.override { python3Packages = ps; })) ]))
  ];
```

at an absolute minimum. Although, if you want a comfortable experience, I suggest also having:

```bash
imagemagick rofi konsole pcmanfm lxappearance konsole
```

in line #3 in the above snippet. [This](https://github.com/fusion809/NixOS-configs/blob/20.09-pre/configuration.nix) is my full `/etc/nixos/configuration.nix` file, it provides a very comfortable experience. 

Likewise [`nixos-scripts`](https://github.com/fusion809/nixos-scripts) must be present in `/data/GitHub/mine/scripts/`. 

## Customization
If you do not want to use these apps (Konsole and ImageMagick) and want to use alternative apps edit `~/.i3/config` accordingly. Likewise these configs are set up for PCs with 5 or more cores. If your screen is small and the i3bar does not seem to fit properly on your screen I would suggest editing the font setting line in `~/.i3/config` accordingly.

## Backgrounds
To set your desktop background, you must set `~/.background-image`.

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
| <kbd>F12</kbd>                                                                  | Change to workspace where an instance of Konsole is running.                                                     |
| <kbd>Alt</kbd>+<kbd>d</kbd>                                                     | Focus the child container.                                                                                     |
| <kbd>Win</kbd>+<kbd>&larr;</kbd>                                                | Focus left.                                                                                                    |
| <kbd>Win</kbd>+<kbd>&rarr;</kbd>                                                | Focus right.                                                                                                   |
| <kbd>Win</kbd>+<kbd>&uarr;</kbd>                                                | Focus up.                                                                                                      |
| <kbd>Win</kbd>+<kbd>&darr;</kbd>                                                | Focus down.                                                                                                    |
| <kbd>Win</kbd>+<kbd>Enter</kbd>                                                 | Launch Konsole.                                                                                                  |
| <kbd>Win</kbd>+<kbd>Tab</kbd>                                                   | Launch Konsole.                                                                                                  |
| <kbd>Win</kbd>+<kbd>;</kbd>                                                     | Focus right.                                                                                                   |
| <kbd>Win</kbd>+<kbd>0</kbd>                                                     | Switch to workspace 10.                                                                                        |
| <kbd>Win</kbd>+<kbd>2</kbd>                                                     | Switch to workspace 2.                                                                                         |
| <kbd>Win</kbd>+<kbd>a</kbd>                                                     | Focus the parent container.                                                                                    |
| <kbd>Win</kbd>+<kbd>c</kbd>                                                     | Launch Chromium browser.                                                                                       |
| <kbd>Win</kbd>+<kbd>d</kbd>                                                     | Launch Rofi (drun mode) so you can enter in a command to run.                                                             |
| <kbd>Win</kbd>+<kbd>e</kbd>                                                     | Layout toggle split.                                                                                           |
| <kbd>Win</kbd>+<kbd>f</kbd>                                                     | Enter full screen for the focused window.                                                                      |
| <kbd>Win</kbd>+<kbd>g</kbd>                                                     | Launch 0 A.D..                                                                        |
| <kbd>Win</kbd>+<kbd>h</kbd>                                                     | Split horizontally.                                                                                            |
| <kbd>Win</kbd>+<kbd>i</kbd>                                                     | Launch i3-input.                                                                                               |
| <kbd>Win</kbd>+<kbd>j</kbd>                                                     | Focus left.                                                                                                    |
| <kbd>Win</kbd>+<kbd>k</kbd>                                                     | Focus down.                                                                                                    |
| <kbd>Win</kbd>+<kbd>l</kbd>                                                     | Focus up.                                                                                                      |
| <kbd>Win</kbd>+<kbd>m</kbd>                                                     | Launch MarvinSketch (installed from [fusion809-overlay](https://github.com/fusion809/fusion809-overlay))       |
| <kbd>Win</kbd>+<kbd>o</kbd>                                                     | Launch RuneScape NXT Client.                                                          |
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
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>f</kbd>                                    | Launch Google Chrome.                                                                                               |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>j</kbd>                                    | Move left.                                                                                                     |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>k</kbd>                                    | Move down.                                                                                                     |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>l</kbd>                                    | Move up.                                                                                                       |                                                                                         |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>o</kbd>                                    | Launch OpenRA.                                                                                                 |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>p</kbd>                                    | Launch VLC media player.                                                                                       |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>r</kbd>                                    | Restart i3 (preserves layout and session), can be used to start a newly installed version of i3.               |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>v</kbd>                                    | Launch Oracle VM VirtualBox.                                                                                   |
| <kbd>Win</kbd>+<kbd>Shift</kbd>+<kbd>w</kbd>                                    | Rofi (window option).                                                                                          |

