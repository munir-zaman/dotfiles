#!/bin/sh

# refer -> https://stackoverflow.com/questions/59838/how-do-i-check-if-a-directory-exists-or-not-in-a-bash-shell-script

DOTFILES_DIR="$HOME/git-repos/dotfiles"
NIXOS_DIR="$DOTFILES_DIR/nixos"

if [ -d "$NIXOS_DIR" ]; then
	sudo rm /etc/nixos/*
	# symlink
	sudo ln -sf $NIXOS_DIR/* /etc/nixos
fi

DOT_CONFIG="$DOTFILES_DIR/.config"
ln -snf $DOT_CONFIG/* ~/.config

