#!bin/sh

OUT_DIR="$HOME/Downloads/deb"

curl --create-dirs --output-dir $OUT_DIR -o "discord.deb" -OL "https://discord.com/api/download?platform=linux&format=deb"

sudo nala install "$OUT_DIR/discord.deb"


