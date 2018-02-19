# Simlink dotfiles to home folder
stow --ignore='(install.sh|atp_install.sh)' \
     --simulate --verbose=1 \
     --dir=$HOME/.dotfiles