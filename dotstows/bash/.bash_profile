#!/usr/bin/env bash

# Exports
export PATH="$HOME/bin:$PATH"
export VISUAL=vim
export EDITOR=vim
export FZF_DEFAULT_COMMAND="find -L"

# Modes
set show-mode-in-prompt on
set vi-cmd-mode-string "\1\e[2 q\2"
set vi-ins-mode-string "\1\e[6 q\2"

# Source bash_ files
red='\033[0;31m'
no_color='\033[0m'
echo -e "\n${red}Profile Modules${no_color}"
for file in ~/.bash_*; do
	[ -L "$file" ] || continue
	[[ $file == *bash_profile ]] && continue
	echo -e " • $file"
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

echo
unset file

# Now load bashrc
[ -n "$PS1" ] && source ~/.bashrc
