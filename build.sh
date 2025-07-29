#!/bin/bash

build() {
	cd build && \
	cmake .. && \
	DCMAKE_POLICY_VERSION_MINIMUM=3.5 make -j $(nproc)
}

flash() {
	devpath="$1"
	mntpath="$2"
	sudo mount "$devpath" "$mntpath" && \
		sudo cp *.uf2 "$mntpath" && \
		sudo umount "$mntpath"
}

if [[ "$#" -ne 1 ]]; then
	echo "usage: $0 device-path"
	exit 1
fi

devpath="$1"
mntpath="/mnt"

build && flash "$devpath" "$mntpath"
