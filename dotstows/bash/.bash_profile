# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Source bash_profile_ files
for file in ~/.bash_profile_*; do
	echo $file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

[ -s "/home/paulo/.jabba/jabba.sh" ] && source "/home/paulo/.jabba/jabba.sh"
