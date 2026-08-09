#! /home/zethec/.nix-profile/bin/bash

mkdir -p extra-files/etc/nixos
cp flake.lock flake.nix extra-files/etc/nixos/
cp -r nixos extra-files/etc/nixos/

nix run github:nix-community/nixos-anywhere -- \
	--build-on local \
	--flake .#tyrosse \
	--generate-hardware-config nixos-generate-config ./nixos/hardware-configuration.nix \
	--extra-files ./extra-files \
	nixos@192.168.1.115
