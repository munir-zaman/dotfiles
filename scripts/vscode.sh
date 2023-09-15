
OUT_DIR="$HOME/Downloads/deb"
NAME="code.deb"
curl --create-dirs --output-dir $OUT_DIR -o $NAME -OL "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

sudo nala install "$OUT_DIR/$NAME"
