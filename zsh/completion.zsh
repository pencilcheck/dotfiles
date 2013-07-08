# no color in tab completion list
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
