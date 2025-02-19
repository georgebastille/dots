# Linux on a 2017 Pixelbook (eve)
2025-02-14  
Tried a few distros, some quite bulky, ended up with Manjaro Sway edition and it is great! Sway is just right for me, a launcher menu and efficient use of space.

A few note for me to remmeber to do a full install.


Install the scripts from Chrultrabok for keybindings and sound

### File picker for Zed
sudo pacman -S xdg-desktop-portal-lxqt

### Screen Brightness
GRUB_CMDLINE_LINUX="... i915.enable_dpcd_backlight=1"

### Use Search Key as Control
Add this line to /etc/udev/hwdb.d/61-pixel-keyboard.hwdb  
KEYBOARD_KEY_d8=leftmeta
KEYBOARD_KEY_db=leftctrl

### Install fish
Then install fisher https://github.com/jorgebucaran/fisher

then install the tide prompt:  
https://github.com/IlanCosman/tide  

fzf keybindings 
https://github.com/PatrickF1/fzf.fish

To get brew working with fish use this:  
https://github.com/orgs/Homebrew/discussions/4412

### Manjaro Sway docs
https://github.com/manjaro-sway/manjaro-sway/blob/main/SUPPORT.md

### Stuff to install
vimplug, zed, uv, fd, ripgrep, tmux, fish  
Do this with native pacman or with homebrew?

### Full install with SuzyQ
https://github.com/yusefnapora/pixelbook-linux/blob/master/README.md#installation
