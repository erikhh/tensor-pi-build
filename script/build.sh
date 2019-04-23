#!/bin/bash
set -e

# Run a build, copy the artifacts away at the end.

BUILD_DIR=/home/vagrant/build
SOURCE_DIR=/vagrant
OUTPUT_DIR=/vagrant/target

mkdir -p $BUILD_DIR

# Clone all needed layer repors
cd $BUILD_DIR
repo init -u https://github.com/erikhh/tensor-pi-build.git
repo sync

# One small patch to make meta-tensorflow accept thud.
cd $BUILD_DIR/meta-tensorflow
git reset HEAD --hard
git apply $SOURCE_DIR/script/meta-tensorflow.patch

# Build
cd $BUILD_DIR/poky
source oe-init-build-env tessa
cp -v $SOURCE_DIR/conf/* conf/

time bitbake core-image-base
