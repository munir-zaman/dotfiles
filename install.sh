#!/usr/bin/bash

echo "Welcome to setup!"

echo "Installing nala"
sudo apt install nala

echo "Update? [y|n]"
read -r yesno
if [[ $yesno == "y" ]]; then
	sudo nala update
	sudo nala upgrade
fi

# Setup git and github
echo "Installing git"
sudo nala install git
echo "Connect to github! [y|n]"
read -r yesno 
if [[ $yesno == "y" ]]; then
	sudo nala install gh
	gh auth login
fi

# install vim and neovim
echo "Installing neovim and vim"
sudo nala install neovim
sudo nala install vim

# install python and pip
echo "Install python3 and pip? [y|n]"
read -r yesno
if [[ $yesno == "y" ]]; then	
	echo "Installing python3 and pip"
	sudo nala install python3
	sudo nala install python3-pip
fi

# install node for coc.nvim
echo "Install node & nvm? [y|n]"
read -r yesno 
if [[ $yesno == "y" ]]; then
	wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
	export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
	nvm install node
	nvm use node
fi

# install kitty, zsh, oh-my-zsh and pure theme
echo "Installing kitty!"
sudo nala install kitty

echo "Installing zsh!"
sudo nala install zsh
chsh -s $(which zsh)
#change default shell

echo "Installing ohmyzsh!"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing pure theme for zsh!"
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

echo "Writting to .zshrc!"
echo "fpath+=($HOME/.zsh/pure)" >> $HOME/.zshrc
echo "autoload -U promptinit; promptinit" >> $HOME/.zshrc
echo "prompt pure" >> $HOME/.zshrc

# install JetBrainsMono Nerd Font
echo "Install JetBrainsMono Nerd Font? [y|n]"
read -r yesno 

if [[ $yesno == "y" ]]; then
	mkdir ~/.fonts
	wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
	mkdir ~/.fonts/JetBrainsMono
	unzip ~/.fonts/JetBrainsMono.zip -d ~/.fonts/JetBrainsMono
fi
