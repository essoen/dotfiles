#!/bin/bash
set -euo pipefail

DOTFILES="$(readlink -f "$PWD")"

rm -f "$HOME/.bashrc"
ln -s "$DOTFILES/bash/profile" "$HOME/.bashrc"
echo "Created symbolic link for .bashrc"

rm -f "$HOME/.bash_aliases"
ln -s "$DOTFILES/bash/aliases" "$HOME/.bash_aliases"
echo "Created symbolic link for .bash_aliases"

rm -f "$HOME/.vimrc"
ln -s "$DOTFILES/bash/vimrc" "$HOME/.vimrc"
echo "Created symbolic link for .vimrc"

rm -f "$HOME/.gitconfig"
ln -s "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
echo "Created symbolic link for .gitconfig"

mkdir -p "$HOME/.ssh"
rm -f "$HOME/.ssh/config"
ln -s "$DOTFILES/ssh/config" "$HOME/.ssh/config"
echo "Created symbolic link for .ssh/config"
