# .bashrc (INL Shells)

# Default editor
export VISUAL=vim;
export EDITOR=vim;

# Installation appends and others...
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Jabba
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # nvm bash_completion
