#!/bin/bash

FONT_DIR="$HOME/.fonts"
FONT_NAME="FiraCode"

# intsall font in FONT_DIR
curl --create-dirs --output-dir "$FONT_DIR/$FONT_NAME" -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$FONT_NAME.tar.xz

tar -xvf "$FONT_DIR/$FONT_NAME/$FONT_NAME.tar.xz" -C "$FONT_DIR/$FONT_NAME"
