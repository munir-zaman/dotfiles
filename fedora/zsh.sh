#!/bin/sh
sudo dnf install zsh
sudo lchsh $USER

echo "Log Out then Log In to start uisng zsh!!"

# Set up pure
touch "$HOME/.zshrc"
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
echo "fpath+=($HOME/.zsh/pure)" >> "$HOME/.zshrc"
echo "autoload -U promptinit; promptinit" >> "$HOME/.zshrc"
echo "PURE_PROMPT_SYMBOL=󰘧" >> "$HOME/.zshrc"
echo "prompt pure" >> "$HOME/.zshrc"
