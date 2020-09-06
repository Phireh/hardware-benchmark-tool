#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e -u

echo 'Warning: customize_airootfs.sh is deprecated! Support for it will be removed in a future archiso version.'

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
echo "BENCHMARK HARDWARE TOOL" > /etc/motd
echo "shopt -q login_shell && /home/benchmark/benchmark.sh" >> /home/benchmark/.bashrc
# Make sure passwords actually work
echo 'root:benchmark' | chpasswd
echo 'benchmark:benchmark' | chpasswd
