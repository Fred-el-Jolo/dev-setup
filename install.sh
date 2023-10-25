#!/bin/bash

sudo apt install zsh
zsh
echo "type /bin/sh"
chsh
/bin/zsh

sudo apt install ripgrep
sudo apt install fzf

cp ./.zshrc ~/

cp -R ./.config ~/
cp -R ./.dir_colors ~/

git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions
rm -f ~/.zcompdump; compinit

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

sudo apt install zsh-syntax-highlighting

curl -sS https://starship.rs/install.sh | sh
