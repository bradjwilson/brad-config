#! /bin/bash

git submodule update --init

# Latest neovim
brew install neovim --fetch-HEAD
brew install tmux
brew install llvm

pip3 install pynvim

# Copy over tmux config
cp .tmux.conf ~/.tmux.conf

# Apply my patch to public repo 
cd nvim-basic-ide/
git apply ../nvim-basic.patch
cd ..

# Copy over nvim config
sudo rm -r ~/.config/nvim
cp -R nvim-basic-ide/. ~/.config/nvim

# Download nerd font
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
