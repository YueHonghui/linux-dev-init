#!/usr/bin/env bash

# set sudo no password
sh ./sudo-no-passwd.sh

# mkdir -p dir
sh ./mkdir-code-dir.sh

# replace apt source with 163 and install default packages
sh ./apt-source-and-packages.sh

# install node.js 14.x & yarn
sh ./nodejs14.sh

# install ccls
sh ./ccls.sh

# install golang
sh ./golang.sh

# install docker
sh ./docker.sh

# install neovim
sh ./neovim.sh

# alias
sh ./alias.sh

# install spacevim
sh ./spacevim.sh
