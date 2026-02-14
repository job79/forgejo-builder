#!/bin/bash
set -ouex pipefail

dnf -y install sudo
useradd -g wheel -m -p '$6$t8FzFHM1/JNawaqT$mUBJK8O/qIenmS4XaPrnSHjfEYchFj99jGRG5ectEe/2eYu9LLrWKLHZuAEfnWEE4JFIzUYX94.RTOgklPypS.' admin
systemctl enable podman.socket
