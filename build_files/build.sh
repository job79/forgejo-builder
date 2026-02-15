#!/bin/bash
set -ouex pipefail

# Disble kernel console messages
echo "kargs = [\"loglevel=4\"]" >/usr/lib/bootc/kargs.d/loglevel.toml

# Install packages
dnf -y install sudo rpm-ostree podman skopeo shadow-utils iptables-nft NetworkManager iproute qemu-user-static-arm nodejs24-npm git wget curl jq

# Add user
useradd -g wheel -m -p '$6$t8FzFHM1/JNawaqT$mUBJK8O/qIenmS4XaPrnSHjfEYchFj99jGRG5ectEe/2eYu9LLrWKLHZuAEfnWEE4JFIzUYX94.RTOgklPypS.' runner --base-dir /var/home

systemctl enable podman.socket

export RUNNER_VERSION=$(curl -X 'GET' https://data.forgejo.org/api/v1/repos/forgejo/runner/releases/latest | jq .name -r | cut -c 2-)
export FORGEJO_URL="https://code.forgejo.org/forgejo/runner/releases/download/v${RUNNER_VERSION}/forgejo-runner-${RUNNER_VERSION}-linux-amd64"
wget -O forgejo-runner ${FORGEJO_URL}
chmod +x forgejo-runner
mv forgejo-runner /usr/local/bin/forgejo-runner
