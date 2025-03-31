# by juniosxs

termux-setup-storage
pkg update -y
pkg upgrade -y
pkg install openjdk-21 wget gh git -y
curl -sLo builder-revanced.zip https://github.com/juniosxs/builder-revanced/archive/refs/heads/main.zip
unzip builder-revanced.zip
mv builder-revanced-main builder-revanced
chmod +x builder-revanced/*.sh builder-revanced/custom/aapt2*
rm builder-revanced.zip builder-revanced-termux-setup.sh
cd builder-revanced
