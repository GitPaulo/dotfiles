#!/usr/bin/env bash

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# We use it that much..
alias g="git"

# Unixy
colorflag="--color=auto"
alias l="ls -lF ${colorflag}"  # List all files colorized in long format
alias la="ls -lAF ${colorflag}" # List all files colorized in long format, excluding . and ..
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'" # List only directories
alias ls="command ls ${colorflag}" # Always use color output for `ls`
alias ll="la"

# fzf & vim & ranger
alias f="fzf"
alias f.="fzf ."
alias v="vim"
alias v.="vim ."
alias r="ranger"
alias r.="ranger ."

# cheat.sh & bro
alias b="bro"
alias c="cht.sh"
alias cheat="cheat.sh"
alias cheat.sh="cht.sh"

# starship
alias fishship='starship init fish | source'

# tmux
alias t="tmux"

# fuck
alias thefuck="fuck"
alias theshit="fuck"
alias shit="fuck"
alias fixpls="fuck"
alias fix="fuck"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec ${SHELL} -l"

# Print each PATH entry on a separate line
alias path="echo -e ${PATH//:/\\n}"