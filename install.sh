# Simlink dotfiles to home folder
stow --ignore='(install.sh|apt_install.sh)' \
     --verbose=1 \
     --dir=$HOME/.dotfiles dotfiles
