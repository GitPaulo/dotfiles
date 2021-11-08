# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Just a check
shell_type=""
[[ $- == *i* ]] && shell_type="Interactive" || shell_type="Non Interactive"
shopt -q login_shell && shell_type="${shell_type} Login Shell" || shell_type="${shell_type} Non Login Shell"
echo "> $shell_type"

# Modes
set show-mode-in-prompt on
set vi-cmd-mode-string "\1\e[2 q\2"
set vi-ins-mode-string "\1\e[6 q\2"

# My bashrc before profiles (dependant on some installation sources)
[ -n "$PS1" ] && source ~/.bashrc
