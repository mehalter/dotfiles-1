#/bin/sh

# Symlink xorg config for nvidia drivers
sudo ln -sf $HOME/dotfiles/xorg/20-nvidia.conf /etc/X11/xorg.conf.d
sudo ln -sf $HOME/dotfiles/xorg/xorg.conf /etc/X11