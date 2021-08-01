#!/usr/bin/env bash

# replace apt source with 163 mirror
sudo cp sources.list /etc/apt/

# apt update and install necessary packages
sudo apt-get update 
sudo apt-get install -y \
  synaptic \
  build-essential \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  git-all \
  software-properties-common \
  python-dev python-pip python3-dev python3-pip \
  zsh \
  terminator \
  cmake gcc g++ make gettext

# git alias
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.pl pull
git config --global alias.ps push

# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

