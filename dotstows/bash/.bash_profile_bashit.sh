#!/usr/bin/env bash

# Path to the bash it configuration
export BASH_IT="/home/paulo/.bash_it"

# Leave empty to disable theming.
export BASH_IT_THEME='sexy'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

# Command duration
export COMMAND_DURATION_MIN_SECONDS=1

# Load Bash It
source "$BASH_IT"/bash_it.sh
