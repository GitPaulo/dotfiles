# Source bashrc_ files
echo '[Profile Modules]'
for file in ~/.bashrc_*; do
	echo $file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

echo;
unset file;

# Default editor
export VISUAL=vim;
export EDITOR=vim;

# Last things
[ -x "$(which neofetch)" ] && neofetch

eval "$(starship init bash)"
