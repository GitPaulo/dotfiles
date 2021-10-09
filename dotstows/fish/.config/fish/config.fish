if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting "Welcome Paulo. Remember you're in Fish!"

# Workaround for jabba on fish
[ -s "/home/santosp/.jabba/jabba.fish" ]; and source "/home/santosp/.jabba/jabba.fish"

# Vi mode
fish_vi_key_bindings
