# Randy-Hyprland
This are my scripts and configs for randy (rust alternative for conky), to work as widget on hyprland.

## Prerequisites:
- JetBrainsMono Nerd Font *(Is used in .randy.yml config, can be changed)*
- Randy *(https://github.com/iphands/randy)*

## installation:
- clone the repository
	`git clone gh repo clone oDEVU/Randy-Hyprland`
	`cd Randy-Hyprland`
- edit script and config to your liking
	  - **.randy.yml** is randy config file and will be copied to your home directory. refer to [Randy UI Settings](https://github.com/iphands/randy?tab=readme-ov-file#ui-settings)
	  - **randy-widget.sh** has binary path inside and workspace id to configure.
	  - **randy-wrules.conf** is cofigured for 1080p, you might want to change move values
- run **copy.sh** 
	`chmod +x copy.sh`
	`./copy.sh`
- add **randy-widget.sh** and **randy-wrules.conf** to your hyprland config
	`source=configs/randy-wrules.conf`
	`exec-once = scripts/randy-widget.sh &`
