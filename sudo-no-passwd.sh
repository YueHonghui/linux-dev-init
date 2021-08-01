#!/usr/bin/env bash

# no password for user to use sudo
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee -a /etc/sudoers
echo "set no password for user $USER to use sudo"

