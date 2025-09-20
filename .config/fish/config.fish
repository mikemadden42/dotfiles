# Remove greeting
set -g fish_greeting

# Vi mode
fish_vi_key_bindings

# Environment variables
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx RIPGREP_CONFIG_PATH $HOME/.ripgreprc
set -gx QT_QPA_PLATFORM xcb

# PATH configuration
set -gx PATH $HOME/bin $HOME/go/bin $HOME/rusty-tools $HOME/.cargo/bin $HOME/.local/bin $HOME/opt/flutter/bin $PATH

# Aliases
alias vim='nvim'
alias vi='nvim'
alias view='nvim -R'
alias vimdiff='nvim -d'

# Gruvbox Dark colors
set -g fish_color_normal normal
set -g fish_color_command green
set -g fish_color_quote yellow
set -g fish_color_redirection cyan
set -g fish_color_end green
set -g fish_color_error red
set -g fish_color_param blue
set -g fish_color_comment grey
set -g fish_color_match --background=brblue
set -g fish_color_selection white --bold --background=brblack
set -g fish_color_search_match bryellow --background=brblack
set -g fish_color_operator cyan
set -g fish_color_escape yellow
set -g fish_color_autosuggestion brblack
