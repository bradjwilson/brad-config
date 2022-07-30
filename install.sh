#! /bin/bash

git submodule update --init

# Latest neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

# Expose nvim globally
mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim


# Env depends
sudo apt install -y curl ripgrep xsel wl-clipboard tmux dconf-editor python3-pynvim git npm python3-venv

npm i -g neovim

# Copy over tmux config
cp .tmux.conf ~/.tmux.conf

# Apply my patch to public repo 
cd nvim-basic-ide/
git apply ../nvim-basic.patch
cd ..

# Copy over nvim config
mkdir ~/.config/nvim
cp -R nvim-basic-ide/. ~/.config/nvim

# Copy over terminal config
dconf load /org/gnome/terminal/legacy/profiles:/:697efb20-2b3c-4387-9c30-afb2f2ca3769/ < solar-term.dconf

# Download nerd font
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
unzip Ubuntu.zip -d ~/.local/share/fonts/
fc-cache -fv

# Source the fonts for current and all sessions
wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/bin/scripts/lib/i_linux.sh
mv i_linux.sh ~/.local/share/fonts/i_linux.sh
source ~/.local/share/fonts/i_linux.sh

# TODO check if already in bachrc
echo "source ~/.local/share/fonts/i_linux.sh" >> ~/.bashrc



# Copy over themes config
wget https://github.com/rtlewis88/rtl88-Themes/archive/refs/tags/1.0.zip
mkdir ~/.themes
unzip 1.0.zip -d ~/.themes/




