#! /home/zethec/.nix-profile/bin/bash

set -euo pipefail

TARGET="${1:?Usage: $0 <user@ip>}"

nixos-rebuild switch --flake .#tyrosse --target-host "${TARGET}" --elevate=sudo --ask-elevate-password
