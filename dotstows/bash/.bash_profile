# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Just a check
shell_type=""
[[ $- == *i* ]] && shell_type="Interactive" || shell_type="Non Interactive"
shopt -q login_shell && shell_type="${shell_type} Login Shell" || shell_type="${shell_type} Non Login Shell"
echo "$shell_type"

# Source bash_profile_ files
for file in ~/.bash_profile_*; do
	echo $file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;
