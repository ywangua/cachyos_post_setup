
echo "=========================================="
echo "== Install Common Apps                  =="
echo "=========================================="
read -r -s -n 1 -P "Press any key to continue..."
# install paru and update system
shelly paru
paru -Syu
# install google chrome
paru -S --noconfirm google-chrome
# install apps for writing
paru -S --noconfirm libreoffice-fresh jdk-openjdk visual-studio-code-bin zotero quarto-cli typst texlive-basic texlive-latex wps-office-cn ttf-fangzheng ttf-ms-fonts hunspell hunspell-en_us espanso-wayland
# install apps for figure/image processing/preparing
paru -S --noconfirm gimp inkscape fiji-bin
# install apps for coding/data analysis
paru -S --noconfirm uv rust ffmpeg
# install apps for reading / signing
paru -S --noconfirm cpdf-bin readest xournalpp okular pdfarranger zathura zathura-pdf-mupdf pdfcraft-bin
# chinese input
paru -S --noconfirm fcitx5 fcitx5-configtool fcitx5-rime rime-luna-pinyin fcitx5-im fcitx5-qt fcitx5-gtk
# other apps / utils
paru -S --noconfirm zoom plasma-camera obs-studio openboard
paru -S --noconfirm rclone github-desktop btop htop 7zip goldendict-ng globus-connect-personal rustdesk-bin localsend cliamp-bin
# install texmaths for libreoffice
cd ~/Downloads
wget -O TexMaths.oxt https://extensions.libreoffice.org/assets/downloads/1236/1772387337/TexMaths-0.52.6.oxt
unopkg add ~/Downloads/TexMaths.oxt
rm ~/Downloads/TexMaths.oxt
# set up wps-zotero
cd ~/Downloads
git clone https://github.com/RajaSunrise/wps-zotero.git
cd wps-zotero
python3 install.py
python3 proxy.py

# config firewall for localsend
sudo ufw allow 53317/tcp
sudo ufw allow 53317/udp
sudo ufw reload

echo "=========================================="
echo "== Set Up Box via rclone                =="
echo "==    Follow the instructions             "
echo "=========================================="
read -r -s -n 1 -P "Press any key to continue..."
# set up Box via rclone
rclone config

echo "=========================================="
echo "== Set Up Chinese Input Method          =="
echo "==    1) Virtual Keyboard => Wayland Launcher"
echo "==    2) Input Method => Add Input Method (Rime) => Configure global options"
echo "==    3) Set to Simplified Chinese (add 'reset: 1' to 'name: simplifcation' in the switches section)"
echo "=========================================="
read -r -s -n 1 -P "When 2) is completed, press any key to continue..."
# set up Chinese Input Method
vim ~/.local/share/fcitx5/rime/build/luna_pinyin.schema.yaml



echo "=========================================="
echo "=============    DONE   =================="
echo "=========================================="
read -r -s -n 1 -P "Press any key to continue..."
