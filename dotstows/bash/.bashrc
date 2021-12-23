#       __               __             
#      / /_  ____ ______/ /_  __________
#     / __ \/ __ `/ ___/ __ \/ ___/ ___/
#  _ / /_/ / /_/ (__  ) / / / /  / /__  
# (_)_.___/\__,_/____/_/ /_/_/   \___/
# paulo's

[ -x "$(which neofetch)" ] && neofetch

# shell prompt (starship)
eval "$(starship init bash)"
