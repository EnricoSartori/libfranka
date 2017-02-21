#!/bin/sh

set -e

rm -rf build
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Debug -DBUILD_COVERAGE=OFF -DBUILD_DOCUMENTATION=OFF -DBUILD_EXAMPLES=ON -DBUILD_TESTS=ON ..
cmake --build . --target check-format
cmake --build .
ctest -V
cmake --build . --target check-tidy