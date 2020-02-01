# YOGAへのインストール

## wifiを有効にする

参考: https://askubuntu.com/questions/1104218/no-wifi-adapter-found-on-new-lenovo-yoga-c930-with-ubuntu-18-10

  sudo apt install git dkms build-essential
  git clone -b 4.18 https://github.com/jeremyb31/ideapad-laptop.git
  sudo dkms add ./ideapad-laptop
  sudo dkms install ideapad-laptop/1.0
  echo "options ideapad_laptop override_has_hw_rfkill_switch=0" | sudo tee /etc/modprobe.d/ideapad_laptop.conf

## gpartでパーティション分割

## Xシステムをインストール

## yayをインストール

## i3をインストール

- rofi
- polybar

## オフィスツール

yay -S --noconfirm --needed \
  keepassxc

## ブラウザ

pacman -S --noconfirm --needed firefox firefox-i18n-ja
yay -S --noconfirm --needed google-chrome

## コミュニケーション

yay -S --noconfirm --needed \
  thunderbird{,-i18n-ja}

yay -S --noconfirm --needed \
  slack-desktop

yay -S --noconfirm --needed \
  zoom

yay -S --noconfirm --needed \
  skype

## Debian Package を利用可能にする

yay -S --noconfirm --needed \
  debtap

## S3 - AWS

pip install aws
