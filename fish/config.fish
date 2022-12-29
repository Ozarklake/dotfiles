if status is-interactive
    alias vim="nvim";
    alias k="kubectl";
    export TERM="xterm-256color";
    set PATH $PATH ~/.krew/bin

    # Commands to run in interactive sessions can go here
end

# THEME PURE #
set fish_function_path /Users/yh/.config/fish/functions/theme-pure/functions/ $fish_function_path
source /Users/yh/.config/fish/functions/theme-pure/conf.d/pure.fish
