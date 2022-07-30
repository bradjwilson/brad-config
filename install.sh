#! /bin/bash

# Env depends
apt install -y curl ripgrep xsel wl-clipboard neovim tmux dconf-editor python3-pynvim git

# Copy over tmux config
mv .tmux.conf ~/.tmux.conf

# Apply my patch to public repo 
cd nvim-basic-ide/
git apply ../nvim-basic.patch
cd ..

# Copy over nvim config
mv nvim ~/.config/nvim

# Copy over terminal config
dconf load /org/gnome/terminal/legacy/profiles:/:697efb20-2b3c-4387-9c30-afb2f2ca3769/ < solar-term.dconf

# Download nerd font
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Ubuntu Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Ubuntu/Regular/complete/Ubuntu%20Nerd%20Font%20Complete.ttf

