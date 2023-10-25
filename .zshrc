setopt auto_menu
setopt always_to_end
setopt complete_in_word
unsetopt flow_control
unsetopt menu_complete

HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=999999999

setopt inc_append_history
setopt share_history

# CTRL-arrows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

alias ll="ls -la"
alias ls="ls --color"
alias gst="git status"
alias gcb="git checkout -b"
alias gco="git checkout"
alias gaa="git add --all"
alias ga="git add"
alias gcmsg='git commit -m'
alias gd='git diff'
alias gp='git push'
alias gl='git pull'
alias gr='git reset'
alias grh='git reset --hard'
# alias gpsup='git push --set-upstream origin $(git_current_branch)'

# dir colors
eval `dircolors ~/.dir_colors/dircolors`
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.config/fzf/.fzfrc

fpath=(~/.zsh/zsh-completions/src $fpath)

compinit

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
