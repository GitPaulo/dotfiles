#       __               __             
#      / /_  ____ ______/ /_  __________
#     / __ \/ __ `/ ___/ __ \/ ___/ ___/
#  _ / /_/ / /_/ (__  ) / / / /  / /__  
# (_)_.___/\__,_/____/_/ /_/_/   \___/
# paulo's

# source bashrc_ files
echo '[Profile Modules]'
for file in ~/.bashrc_*; do
	echo $file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

echo;
unset file;

[ -x "$(which neofetch)" ] && neofetch

# shell prompt (starship)
eval "$(starship init bash)"
