#!/usr/bin/env bash

# install golang 1.17.1
mkdir -p ~/.local/gotmp
mkdir -p ~/.local/gobin
mkdir -p ~/.local/bin
mkdir -p ~/.gomodcache
cd ~/.local/gotmp && \
  wget "https://golang.org/dl/go1.17.1.linux-amd64.tar.gz" &&\
  tar -zxvf go1.17.1.linux-amd64.tar.gz && \
  mv go ../go1.17.1 && \
  cd - && ln -s ~/.local/go1.17.1 ~/.local/go
echo "GOROOT=${HOME}/.local/go" >> ~/.go.env
echo "GOPROXY=https://goproxy.cn,direct" >> ~/.go.env
echo "GOMODCACHE=${HOME}/.gomodcache" >> ~/.go.env
echo "CGO_ENABLED=0" >> ~/.go.env
echo "GOBIN=${HOME}/.local/gobin" >> ~/.go.env
echo "PATH=${HOME}/.local/go/bin:${HOME}/.local/gobin:${HOME}/.local/bin:\${PATH}" >> ~/.go.env

echo "set -o allexport\nsource ${HOME}/.go.env \nset +o allexport" >> ~/.zshrc

GO111MODULE=on GOMODCACHE=${HOME}/.gomodcache GOROOT=${HOME}/.local/go GOPROXY=https://goproxy.cn,direct GOBIN=${HOME}/.local/gobin go get golang.org/x/tools/gopls@latest

envsubst < ./gopls.service.tpl > ./gopls.service && sudo cp -f ./gopls.service /etc/systemd/system/ && sudo systemctl enable gopls && sudo systemctl start gopls
