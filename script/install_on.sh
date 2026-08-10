#! /home/zethec/.nix-profile/bin/bash

set -euo pipefail

TARGET="${1:?Usage: $0 <user@ip>}"

nix run github:nix-community/nixos-anywhere -- \
	--build-on local \
	--flake .#server \
	--generate-hardware-config nixos-generate-config ./nixos/hardware-configuration.nix \
	"${TARGET}"
