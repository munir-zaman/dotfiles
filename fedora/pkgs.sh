#!/bin/sh

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

# fonts
echo "INSTALLING NERD-FONTS"
FONT_DIR="$HOME/.fonts"
# see (https://github.com/ryanoasis/nerd-fonts/releases) for more fonts
FONTS=("FiraCode" "JetBrainsMono")
for FONT_NAME in "${FONTS[@]}"; do
	echo "INSTALLING $FONT_NAME"
	# intsall font in FONT_DIR
	curl --create-dirs --output-dir "$FONT_DIR/$FONT_NAME" -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT_NAME.tar.xz
	# unzip tar 
	tar -xvf "$FONT_DIR/$FONT_NAME/$FONT_NAME.tar.xz" -C "$FONT_DIR/$FONT_NAME"
done
