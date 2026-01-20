#!/bin/bash

# exit on error and print each command
set -e

if [ -d ./build/install ]; then
    rm -rf ./build/install
fi

cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DAIMRT_INSTALL=ON \
    -DCMAKE_INSTALL_PREFIX=./build/install \
    -DCMAKE_CXX_STANDARD=20 \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
    -DREFLECTCPP_BUILD_TESTS=ON \
    $@

cmake --build build --config Release --target install --parallel $(nproc)
