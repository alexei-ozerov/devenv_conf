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
