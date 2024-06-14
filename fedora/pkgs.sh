#!/bin/sh

# have to look into this
function asktoproceed() {
	echo -n "Proceed? [y/n]: "
	read -r ans
	if [[ "$ans" == "n" ]]; then
		return 1
	else
		return 0
	fi
}

# set up git and github
echo "SETTING UP GIT AND GITHUB"
sudo dnf5 install git gh
gh auth login

git config --global user.email "munir.zaman2k22@outlook.com"
git config --global user.name "Munir Zaman"

# install lazygit
echo "INSTALLING LAZYGIT"
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit

# vim and neovim
sudo dnf5 install vim neovim

# kitty
sudo dnf5 install kitty

# g++
sudo dnf5 install gcc-c++

# fonts
function installfonts() {
	FONT_DIR="$HOME/.fonts"
	for FONT_NAME in "$@"; do
		echo "INSTALLING $FONT_NAME"
		# intsall font in FONT_DIR
		curl --create-dirs --output-dir "$FONT_DIR/$FONT_NAME" -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT_NAME.tar.xz
		# unzip tar 
		tar -xvf "$FONT_DIR/$FONT_NAME/$FONT_NAME.tar.xz" -C "$FONT_DIR/$FONT_NAME"
	done
}

# see (https://github.com/ryanoasis/nerd-fonts/releases) for more fonts
echo "INSTALLING NERD-FONTS"
# installfonts "FiraCode" "JetBrainsMono"
if asktoproceed; then
  installfonts "FiraCode" "JetBrainsMono"
fi

sudo dnf5 install fd-find ripgrep npm

# install nitrogen
sudo dnf5 install nitrogen

# install i3
sudo dnf5 install i3
