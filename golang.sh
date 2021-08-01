#!/usr/bin/env bash

# install golang 1.16.6
mkdir -p ~/.local/gotmp
mkdir -p ~/.local/gobin
mkdir -p ~/.local/bin
cd ~/.local/gotmp && \
  wget "https://golang.org/dl/go1.16.6.linux-amd64.tar.gz" &&\
  tar -zxvf go1.16.6.linux-amd64.tar.gz && \
  mv go ../go1.16.6 && \
  cd .. && ln -s go1.16.6 go

