# .bashrc (INL Shells)

# Installation appends and others...
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

[ -s "/home/paulo/.jabba/jabba.sh" ] && source "/home/paulo/.jabba/jabba.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# My profile (dependant on some installation sources)
[ -n "$PS1" ] && source ~/.bash_profile

# Neofetch at the end
[ -x "$(which neofetch)" ] && neofetch
