#!/usr/bin/env bash

set -u
set -x

# This script auto installs the list of brews that I use automatically on the local machine
# Author: Penn Su (pennsu@gmail.com)

RECIPES="brew-cask
the_silver_searcher
tmux
mongodb
postgresql
git
ctags-exuberant
ranger
reattach-to-user-namespace
rbenv
ruby-build
python
macvim
hub
dnsmasq
nginx
zsh
imagemagick
ack
findutils
gnu-tar
tree
wget
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
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit
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

check
install_recipes
