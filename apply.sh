#!/bin/sh

cd /tmp

sudo apt install atom git vanilla-gnome-desktop

# enable shell themes and install
git clone https://github.com/vinceliuice/Orchis-theme
sh Orchis-theme/install.sh -t yellow

gnome-extensions enable user-theme@gnome-shell-extensions.gcampax.github.com
gsettings set org.gnome.shell.extensions.user-theme name Orchis-yellow
