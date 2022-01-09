#!/usr/bin/env bash

# Functions

# Create a new directory and enter it
function mkdircd() {
	mkdir -p "$@" && cd "$_"
}

# Create a data URL from a file
function dataurl() {
	local mimeType=$(file -b --mime-type "$1")
	if [[ $mimeType == text/* ]]; then
		mimeType="${mimeType};charset=utf-8"
	fi
	echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')"
}

# Never again use another way :D
function timetoswitch() {
        [ -z "$1" ] && echo 'Branch name required.' && exit 1
        echo "⸙ $(git rev-parse --abbrev-ref HEAD) -> $1"
        git reset --hard
        echo "RESET ✅"
        echo "Clean dry run:"
        git clean -fd --dry-run
        read -n 1 -p "Proceed with clean? (y/n)" ans
        [[ "$ans" =~ ^[Yy]$ ]] && git clean -fd; echo || echo '(skipped)'
        echo "DONE ✅"
        [ $(git branch --list $1) ] && git switch $1 || git switch -C $1
        echo "SWITCHED ✅"
}
alias tts="timetoswitch"

# Here because of expansion?
function vf() {
	vim $(fzf)
}

function vfh() {
	vimg $(fzf --hidden)
}
