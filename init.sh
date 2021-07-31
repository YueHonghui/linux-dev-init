#!/usr/bin/env bash

# no password for user to use sudo
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
echo "set no password for user $USER to use sudo"

# mkdir -p dir
mkdir -p ~/code/src/github.com
mkdir -p ~/code/src/k8s.io
mkdir -p ~/code/src/sigs.k8s.io
mkdir -p ~/code/pkg
mkdir -p ~/code/bin
ln -s ~/code/src/github.com ~/github.com
ln -s ~/code/src/k8s.io ~/k8s.io
ln -s ~/code/src/sigs.k8s.io ~/sigs.k8s.io

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
  cmake gcc g++ make

# git alias
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.pl pull
git config --global alias.ps push

# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install node.js 14.x & yarn
sh ./nodejs14.sh
sh ./yarn.sh

# install ccls
sh ./ccls.sh

# install golang 1.16.6
mkdir -p ~/.local/gotmp
mkdir -p ~/.local/gobin
mkdir -p ~/.local/bin
cd ~/.local/gotmp && \
  wget "https://golang.org/dl/go1.16.6.linux-amd64.tar.gz" &&\
  tar -zxvf go1.16.6.linux-amd64.tar.gz && \
  mv go ../go1.16.6 && \
  cd .. && ln -s go1.16.6 go

# install docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo groupadd -f docker
sudo usermod -aG docker $USER


# install neovim
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

# install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash
cd ~/.SpaceVim/bundle/vimproc.vim && make
cd ~
git clone https://github.com/YueHonghui/SpaceVim.d ~/.SpaceVim.d
