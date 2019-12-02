#!/bin/sh

# Sets up a custom environment in an Arch installation

# Initialization
packagesFile="$HOME/repos/configs/packages.txt"

# Setup is done from the $HOME directory
cd

# Install git to get needed repos
echo "Installing git"
sudo pacman -S git
echo ""

echo "Setting up git config."
git config --global user.name "InigoGutierrez"
git config --global user.email "inigogf.95@gmail.com"
echo ""

mkdir "repos"

# Clone scripts and configs repos
if [ ! -d "scripts" ]; then
	echo "Cloning scripts repo"
	git clone https://github.com/InigoGutierrez/scripts
	echo ""
fi
if [ ! -d "repos/configs" ]; then
	echo "Cloning configs repo"
	cd repos
	git clone https://github.com/InigoGutierrez/configs
	cd $HOME
	echo ""
fi
cd

# Read programs to install from file
sed -n '/^# pacman/,/^# yay/p' "$packagesFile" | sed '/^#/d' | pacman -S -

# Clone specific programs sources to be compiled and installed later
cd "$HOME/repos"
git clone "https://git.suckless.org/dmenu"
git clone "https://github.com/muennich/sxiv"
git clone "https://aur.archlinux.org/yay.git"
cd

# Put config files in place
echo "Putting config files in place"
cd "$HOME/repos/configs"
sh setup.sh
echo ""
cd

# Compile specific programs

echo "Installing some program repos."
cd "$HOME/repos"
cd dmenu
make
sudo make install
make clean
cd ..

cd sxiv
make
sudo make install
make clean
cd ..

cd yay
makepkg -si
cd
echo ""

# Install programs with yay
sed -n '/^# yay/,$p' "$packagesFile" | sed '/^#/d' | yay -S -
