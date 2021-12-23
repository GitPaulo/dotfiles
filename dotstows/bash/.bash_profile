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
echo '[Profile Modules]'
for file in ~/.bash_*; do
	[ $file == '/home/paulo/.bash_profile' || $file == '/home/paulo/.bash_history'] && continue
	echo $file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

echo;
unset file;

# Now load bashrc 
[ -n "$PS1" ] && source ~/.bashrc
