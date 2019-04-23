#!/usr/bin/env bash
set -e

# This is the provision script used by Vagrant to setup the build guest during 'vagrant provision'.

# Get up to date first
apt update
apt upgrade -y

# Install things needed
apt install -y \
  gawk wget git-core diffstat unzip texinfo gcc-multilib \
  build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
  xz-utils debianutils iputils-ping libsdl1.2-dev xterm locales python-virtualenv \
  linux-headers-$(uname -r) awscli
apt-get autoremove -y
apt install -y gcc-arm-linux-gnueabi device-tree-compiler

# Install git-repo so we can download lots of git repos at once.
curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
chmod a+x /usr/local/bin/repo

# Set corret locale for Python
locale-gen en_US.UTF-8
