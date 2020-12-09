#!/usr/bin/env bash

#set -u
#set -x

# This script auto installs the list of brews that I use automatically on the local machine
# Author: Penn Su (pennsu@gmail.com)

RECIPES="brew-cask
z
sqlite
the_silver_searcher
tmux
mongodb
postgresql
git
ctags-exuberant
cscope
android-sdk
autoconf
automake
ranger
reattach-to-user-namespace
rbenv
ruby-build
python
macvim
vim
hub
dnsmasq
nginx
imagemagick
ack
findutils
gnu-tar
tree
wget
ondir
"

CASKS="teamviewer
android-studio
adium
mactex
sourcetree
dropbox
google-drive
google-hangouts
google-chrome-dev
caffeine
f-lux
spectable
monolingual
limechat
multibit
mumble
vlc
vox
vagrant
appzapper
arduino
pckeyboardhack
xquartz
xld
virtualbox
asepsis
skype
sparrow
firefox
handbrake
latexit
libreoffice
mongohub
pgadmin3
skim
emacs
subler
sublime-text
textmate
teamspeak-client
transmission
unity3d
coconutbattery
cyberduck
electric-sheep
ichm
jdownloader
retinizer
sabnzbd
simple-comic
bootxchanger
osxfuse
sshfs
gfxcardstatus
gimp
google-app-engine-launcher
cord
boxer
"

command_exists() {
  hash $1 2>/dev/null;
}

install_brew() {
  # Install homebrew
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
}

check() {
  # Check brew
  if ! command_exists brew; then
    install_brew
  fi
}

info () {
  printf "  [ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
}

tap() {
  brew tap homebrew/cask
  brew tap homebrew/cask-versions
}

has_brew() {
  path="$(brew --prefix)/Cellar/$1"
  [ -f $path ] || [ -d $path ]
}

install_recipes() {
  info 'installing recipes'

  for recipe in $RECIPES
  do
    if ! has_brew $recipe; then
      info "installing ${recipe}"
      if brew install $recipe; then
        success 'installed'
      else
        fail ''
      fi
    fi
  done
}

has_cask() {
  path="/opt/homebrew-cask/Caskroom/$1"
  [ -f $path ] || [ -d $path ]
}

install_casks() {
  info 'installing casks'

  for cask in $CASKS
  do
    if ! has_cask $cask; then
      info "installing ${cask}"
      if brew cask install $cask; then
        success 'installed'
      else
        fail ''
      fi
    fi
  done
}

install_zsh() {
  info 'setup zsh'
  brew install zsh
  # Setup Oh My Zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # Setup homebrew zsh
  sudo sh -c 'echo "/usr/local/bin/zsh" >> /etc/shells'
  chsh -s /usr/local/bin/zsh
}


check
tap
install_zsh
install_recipes
#install_casks
