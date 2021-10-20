#!/bin/bash

#   Dev Env Config  
# /""""""""""""""""\___/ ==    	2021-10-20 :: Alexei Ozerov
# {          	/ ===- ___       	alexei.ozerov.7@gmail.com
# \______ O    	__/	  |        	github.com/alexei-ozerov
#  \	\   	__/        \ ==    	Version 0.5.0
#   \____\_______/
#
# Note: the language insall feature is designed to work only
#       with Void Linux as of version 0.5.0. You will need
#       to modify this script with your distro's package
#       management tool in order for it to work elsewhere.


Help()
{
   # Display Help
   echo "Download & Set Up Configurations For Personal Development Environment."
   echo
   echo "Syntax: ./install.sh -[h|l|d|a]"
   echo "options:"
   echo "h     Print this Help."
   echo "l     Install only languages."
   echo "d     Install only dotfiles."
   echo "a     Install both dotfiles and languages."
   echo
}

DotFiles()
{
  # Moving Data
  echo -e "Copying Dotfiles ..."
  cp dotfiles/.vimrc ~/.vimrc
  cp dotfiles/.tmux.conf ~/.tmux.conf
  cp -R dotfiles/.config/neovim ~/.config/neovim/

  # Downloading Data
  echo -e "Installing Plugins"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # Configuring Plugins
  echo -e "To enable VIM Plugins, please install them by opening VIM and running :PlugInstall"
}

LangInstall()
{
  # Install Rust
  echo -e "Installing Rust via RustUp. Please make sure you have an executable tmp directory."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

  # Install GoLang Toolchain
  echo -e "Installing GoLang via XBPS."
  xbps-install -y go
  go install github.com/go-delve/delve/cmd/dlv@latest

  # Install C Development Dependencies
  echo -e "Installing GCC & Build Essentials"
  xbps-install -y gcc cmake

  # Install Python3 Toolchain
  echo -e "Installing Python3, venv, and pip3"
  xbps-install -y python3
  pip3 install virtualenv
}

# Get the options
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      d) # install DotFiles
        DotFiles
        exit ;;
   esac
done

