#       __               __
#      / /_  ____ ______/ /_  __________
#     / __ \/ __ `/ ___/ __ \/ ___/ ___/
#  _ / /_/ / /_/ (__  ) / / / /  / /__
# (_)_.___/\__,_/____/_/ /_/_/   \___/
# paulo's

# neofetch
[ -x "$(which neofetch)" ] && neofetch

# load profile shortcut
alias paulo="source $HOME/.bash_profile"
[ -t 1 ] && bind -x '"\C-P":"paulo"' 

# shell prompt (starship)
eval "$(starship init bash)"

# git fzf
source <(curl -sSL git.io/forgit)
