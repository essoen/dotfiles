#!/bin/bash
rm $HOME/.bashrc
ln -s $PWD/bash/profile $HOME/.bashrc
echo "Created symbolic link for .bash_profile"

rm $HOME/.bash_aliases
ln -s $PWD/bash/aliases $HOME/.bash_aliases
echo "Created symbolic link for .bash_aliases"

rm $HOME/.vimrc
ln -s $PWD/bash/vimrc $HOME/.vimrc
echo "Created symbolic link for .vimrc"

rm $HOME/.gitconfig
ln -s $PWD/git/gitconfig $HOME/.gitconfig
echo "Created symbolic link for .gitconfig"

rm $HOME/.ssh/config
ln -s $PWD/ssh/config $HOME/.ssh/config
echo "Created symbolic link for .ssh/config"
gsettings set org.gnome.desktop.interface clock-show-date true

