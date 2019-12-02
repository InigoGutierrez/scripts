#!/bin/sh

# Sets up a custom environment in an Arch installation

# Initialization
packagesFile="$HOME/repos/configs/packages.txt"

# Setup is done from the $HOME directory
cd

# Pacman config
echo "Adding color and candy to /etc/pacman.conf"
grep -q 'ILoveCandy' /etc/pacman.conf ||
	sudo sed -i 's/^#Color.*$/Color\nILoveCandy/' /etc/pacman.conf

# Install git to get needed repos
if ! type git; then
	echo "Installing git"
	type git || sudo pacman -S git
	echo "Setting up git config."
	git config --global user.name "InigoGutierrez"
	git config --global user.email "inigogf.95@gmail.com"
	echo ""
fi

mkdir "repos"

# Clone scripts and configs repos
if [ ! -d "scripts" ]; then
	echo "Cloning scripts repo"
	git clone https://github.com/InigoGutierrez/scripts
	echo ""
fi
if [ ! -d "repos/configs" ]; then
	echo "Cloning configs repo"
	(
	cd repos
	git clone https://github.com/InigoGutierrez/configs
	echo ""
	)
fi

# Read programs to install from file
sed -n '/^# pacman/,/^# yay/p' "$packagesFile" | sed '/^#/d' | sudo pacman -S -

# Clone specific programs sources to be compiled and installed later
(
cd "$HOME/repos"
[ ! -d "dmenu" ] && git clone "https://git.suckless.org/dmenu"
[ ! -d "sxiv" ] && git clone "https://github.com/muennich/sxiv"
[ ! -d "yay" ] && git clone "https://aur.archlinux.org/yay.git"
)

# Put config files in place
echo "Putting config files in place"
(
cd "$HOME/repos/configs"
sh setup.sh
echo ""
)

# Compile specific programs

echo "Installing some program repos."
(
cd "$HOME/repos"
if ! type dmenu; then
	(
	cd dmenu
	make
	sudo make install
	make clean
	)
fi

if ! type sxiv; then
	(
	cd sxiv
	make
	sudo make install
	make clean
	)
fi

if ! type yay; then
	(
	cd yay
	makepkg -si
	)
fi
echo ""
)

# Install programs with yay
sed -n '/^# yay/,$p' "$packagesFile" | sed '/^#/d' | yay -S -

# Directory structure
mkdir -p "$HOME/downloads/videos"
mkdir -p "$HOME/downloads/audios"
mkdir -p "$HOME/images/screenshots"
mkdir -p "$HOME/images/wallpapers/shufs/current"

# Mainpage
(
cd "$HOME/repos"
git clone "https://github.com/InigoGutierrez/mainpage.git"
cp -r "mainpage" "$HOME/.mainpage"
rm -rf "$HOME/.mainpage/.git"
)

# Set up nvim (as in nvim-from-vim)
mkdir -p "$HOME/.config/nvim"
echo "set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc" >"$HOME/.config/nvim/init.vim"

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Remove default .bash_profile as it avoids .profile execution
if [ -f ".bash_profile" ]; then
	echo "Remove .bash_profile? It prevents .profile from being executed. [y/N]"
	read answer
	echo "$answer" | grep -E -q '^[yY]' && rm .bash_profile
fi
