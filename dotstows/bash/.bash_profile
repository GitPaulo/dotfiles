# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Just a check
red="\033[0;31m"
shell_type=""
[[ $- == *i* ]] && shell_type="Interactive" || shell_type="Non Interactive"
shopt -q login_shell && shell_type="${shell_type} Login Shell" || shell_type="${shell_type} Non Login Shell"
echo "${red}> $shell_type"

# Modes
set show-mode-in-prompt on
set vi-cmd-mode-string "\1\e[2 q\2"
set vi-ins-mode-string "\1\e[6 q\2"

# My bashrc before profiles (dependant on some installation sources)
[ -n "$PS1" ] && source ~/.bashrc

# Source bash_profile_ files
echo '[Profile Modules]'
for file in ~/.bash_profile_*; do
	echo $file
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

unset file;

# Neofetch at the end
[ -x "$(which neofetch)" ] && neofetch
