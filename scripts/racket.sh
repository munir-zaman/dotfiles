#!/bin/sh
sudo add-apt-repository ppa:plt/racket
sudo apt update

sudo nala install racket
# install language server
raco pkg install racket-langserver
