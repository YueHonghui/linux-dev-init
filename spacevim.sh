#!/usr/bin/env bash

# install SpaceVim
curl -sLf https://spacevim.org/install.sh | bash
cd ~/.SpaceVim/bundle/vimproc.vim && make
cd ~
git clone https://github.com/YueHonghui/SpaceVim.d ~/.SpaceVim.d
mkdir -p ~/.cache/vimfiles/repos/github.com/YueHonghui 
cd ~/.cache/vimfiles/repos/github.com/YueHonghui && \
  git clone https://github.com/YueHonghui/markdown-preview.nvim && \
  cd markdown-preview.nvim && \
  yarn install && cd -
