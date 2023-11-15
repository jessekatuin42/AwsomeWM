#!/bin/bash
# Controleer of het script wordt uitgevoerd als root
if [ "$(id -u)" != "0" ]; then
  echo "Dit script moet worden uitgevoerd als root."
  exit 1
fi

# Installeer vereiste pakketten voor het instaleren van yay
pacman -Syu --noconfirm git

# Installeer yay
cd /opt
git clone https://aur.archlinux.org/yay-git.git
chown -R root:root ./yay-git
cd yay-git
sudo -u nobody makepkg -si --noconfirm
echo "Yay is geinstaleerd"

#instaleer de rest van de belangerijke pakketen
yay -Syu --noconfirm
#instaleer de WM
yay -S --noconfirm awesome-git picom xorg-xini xorg-xrandr feh slock terminus-font gnu-free-fonts ttf-liberation xsel
echo "Je WM is geinstaleerd"
#instaleer benodigte pakketen
yay -S --noconfirm vim thunar terminator gparted gnome-disk-utility
echo "Je benodigte pakketen zijn geinstaleerd"
#instaleer handige pakketen
yay -S --noconfirm visual-studio-code-bin discord firefox htop ProtonUp-Qt 
echo "Je extra pakketen zijn geinstaleerd"
#installeer bluetooth
yay -S --noconfirm bluez bluez-utils blueman
systemctl start bluetooth.service
systemctl enable bluetooth.service
echo "Bluetooth is geinstaleerd"

# Directory om te kopiëren
bron_directory="/home/jesse/Documents/GitHub/Linux-Config/.config"
# Bestemming voor de gekopieerde directory
doel_directory="/home/jesse"
# Kopieer de directory
cp -r "$bron_directory" "$doel_directory"
echo "Directory gekopieerd naar $doel_directory"

#install my-bash van christitustech
cd /home/jesse/Documents/GitHub/Linux-Config/mybash
./setup.sh
