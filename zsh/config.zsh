#export LSCOLORS=GxFxCxDxBxegedabagaced
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($DOTFILES/functions $fpath)

autoload -U $DOTFILES/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

# enable vi mode in zsh shell
#This means you edit your shell commands the same way you edit inside vim:
#* b to go back a word
#* dd to delete the entire line
#* 0, $ to move to the line ends
#* …etc.
bindkey -v

# by default there is a 0.4 sec delay after hitting esc key
# let's change it to 0.1 sec
export KEYTIMEOUT=1

#You can also map your alternate escape key just as you do in vim (shown for zsh):
#bindkey -M viins 'escape' vi-cmd-mode

#Another added bonus here is that you navigate your history via j,k as will come natural,
#and you can even have your ctrl-r functionality as well by adding this to your .zshrc file:
bindkey '^R' history-incremental-search-backward
