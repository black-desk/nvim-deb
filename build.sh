#!/bin/env bash

set -e

sudo apt update
sudo apt install debhelper build-essential

for dir in */; do
	pushd "$dir"
	if [ -f ./tools/buildpackage.sh ]; then
		./tools/buildpackage.sh
	else
		dpkg-buildpackage -us -uc -b
	fi
	popd
done
