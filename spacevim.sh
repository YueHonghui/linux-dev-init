#!/usr/bin/env bash

# install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash
cd ~/.SpaceVim/bundle/vimproc.vim && make
cd ~
git clone https://github.com/YueHonghui/SpaceVim.d ~/.SpaceVim.d
