#!/usr/bin/env bash

# Functions

# Create a new directory and enter it
function mkdircd() {
	mkdir -p "$@" && cd "$_";
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1");
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8";
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# Weird one
function vf () {
  vim $(f);
}
