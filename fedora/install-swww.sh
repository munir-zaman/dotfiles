!/bin/sh

sudo dnf5 install lz4 lz4-devel

git clone https://github.com/LGFae/swww
cd swww
cargo build --release
