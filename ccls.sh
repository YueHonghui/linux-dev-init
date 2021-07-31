#!/usr/bin/env bash

# install ccls
sudo apt-get install clang libclang-dev zlib1g-dev libncurses-dev
cd ~/github.com && mkdir -p MaskRay && cd MaskRay && git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/lib/llvm-10 \
    -DLLVM_INCLUDE_DIR=/usr/lib/llvm-10/include \
    -DLLVM_BUILD_INCLUDE_DIR=/usr/include/llvm-10/
cmake --build Release -j 8
sudo cp Release/ccls /usr/local/bin
