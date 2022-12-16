#!/usr/bin/bash

echo "Welcome to setup!"

echo "Installing nala"
sudo apt install nala

echo "Installing git"
sudo nala install git

echo "Installing neovim and vim"
sudo nala install neovim
sudo nala install vim

echo "Installing python3 and pip"
sudo nala install python3
sudo nala install python3-pip

echo "Installing node (nvm)"
echo -n "Proceed? [y/n]: "
read -r install_nvm

if [[ $install_nvm == "y" ]]; then
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
	nvm install node
	nvm use node
fi

echo "Connect to github!"
echo -n "Proceed? [y/n]: "
read -r connect_gh

if [[ $connect_gh == "y" ]]; then
	sudo nala install gh
	gh auth login
fi

echo "Installing kitty!"
sudo nala install kitty

echo "Installing zsh!"
sudo nala install zsh
chsh -s $(which zsh)

echo "Installing ohmyzsh!"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing pure theme for zsh!"
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "Writting to .zshrc!"
echo "fpath+=($HOME/.zsh/pure)" >> $HOME/.zshrc
echo "autoload -U promptinit; promptinit" >> $HOME/.zshrc
echo "prompt pure" >> $HOME/.zshrc

echo "Install JetBrainsMono Nerd Font?"
echo -n "Proceed? [y/n]"
read -r install_font

if [[ $install_font == "y" ]]; then
	mkdir ~/.fonts
	wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
	mkdir ~/.fonts/JetBrainsMono
	unzip ~/.fonts/JetBrainsMono.zip -d ~/.fonts/JetBrainsMono
fi
