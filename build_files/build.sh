#!/bin/bash
set -ouex pipefail

# Fix home dir
rm -rf /home
ln -s /var/home /home
mkdir -p /var/home
chmod 755 /var/home

# Install packages
dnf -y install sudo shadow-utils iptables-nft NetworkManager iproute hostname

# Add user
sudo useradd -g wheel -m -p '$6$t8FzFHM1/JNawaqT$mUBJK8O/qIenmS4XaPrnSHjfEYchFj99jGRG5ectEe/2eYu9LLrWKLHZuAEfnWEE4JFIzUYX94.RTOgklPypS.' admin

# Disble kernel console messages
echo "kargs = [\"loglevel=4\"]" >/usr/lib/bootc/kargs.d/loglevel.toml
