#!/usr/bin/bash

echo "Welcome to setup!"

# Install nala
echo "Installing nala"
sudo apt install nala -y

# Update
echo "Update? [y|n]"
read -r yesno
if [[ $yesno == "y" ]]; then
	sudo nala update -y
	sudo nala upgrade -y
fi

# Setup git and github
echo "Installing git"
sudo nala install git -y
git config --global user.email "munir.zaman2k22@outlook.com"
git config --global user.name "Munir Zaman"

echo "Connect to github! [y|n]"
read -r yesno 
if [[ $yesno == "y" ]]; then
	sudo nala install gh -y
	gh auth login
fi

# install vim and neovim
echo "Install neovim and vim? [y|n]"
read -r yesno
if [[ $yesno == "y" ]]; then
	wget -P ~/Downloads https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
	sudo nala install ~/Downloads/nvim-linux64.deb -y
	sudo nala install vim -y
fi
# install vim-plug for vim and neovim
echo "Install vim-plug for vim and neovim? [y|n]"
read -r yesno
if [[ $yesno == "y" ]]; then
	echo "vim-plug -> ~/.vim/autoload/"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	echo "vim-plug -> ${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/"
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# install python and pip
echo "Install python3 and pip? [y|n]"
read -r yesno
if [[ $yesno == "y" ]]; then	
	echo "Installing python3 and pip"
	sudo nala install python3 -y
	sudo nala install python3-pip -y
fi

# install kitty, zsh, oh-my-zsh and pure theme
echo "Install kitty, zsh (set to default), oh-my-zsh and pure theme for zsh? [y|n]"
read -r yesno
if [[ $yesno == "y" ]]; then
	echo "Installing kitty!"
	sudo nala install kitty -y
	echo "Installing zsh!" 
	sudo nala install zsh -y
	#change default shell
	chsh -s $(which zsh)
	echo "Installing ohmyzsh!"
	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	echo "Installing pure theme for zsh!"
	mkdir -p "$HOME/.zsh"
	git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
	# add pure theme to .zshrc
	echo "Writting to .zshrc!"
	echo "fpath+=($HOME/.zsh/pure)" >> $HOME/.zshrc
	echo "autoload -U promptinit; promptinit" >> $HOME/.zshrc
	echo "prompt pure" >> $HOME/.zshrc
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

# install JetBrainsMono Nerd Font
echo "Install JetBrainsMono Nerd Font? [y|n]"
read -r yesno 
if [[ $yesno == "y" ]]; then
	mkdir ~/.fonts
	wget -P ~/.fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
	mkdir ~/.fonts/JetBrainsMono
	unzip ~/.fonts/JetBrainsMono.zip -d ~/.fonts/JetBrainsMono
fi

# install discord 
echo "Install Discord? [y|n]"
read -r yesno
DISCORD_DEB="https://dl.discordapp.net/apps/linux/0.0.22/discord-0.0.22.deb"
if [[ $yesno == "y" ]]; then
	wget -O ~/Downloads/discord.deb $DISCORD_DEB
	sudo nala install ~/Downloads/discord.deb
fi

