#!/bin/sh

cd /tmp

# add apt repositories
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'

sudo apt update
sudo apt install atom git vanilla-gnome-desktop

# install Orchis theme
git clone https://github.com/vinceliuice/Orchis-theme
bash Orchis-theme/install.sh -t yellow

# enable shell theming and apply themes
gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name Orchis-yellow
gsettings set org.gnome.desktop.interface gtk-theme Orchis-yellow

# normal mouse behavior
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true

# terminal
gsettings set org.gnome.Terminal.Legacy.Settings theme-variant 'dark'
gsettings set org.gnome.desktop.wm.preferences audible-bell false
gsettings set org.gnome.desktop.wm.preferences visual-bell true

# default shell -> gnome
echo "[Desktop]\nSession=gnome\nLanguage=en_US.UTF-8" > ~/.dmrc
