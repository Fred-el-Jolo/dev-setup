# Setup fzf
# ---------
if [[ ! "$PATH" == */home/frederic/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/frederic/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/frederic/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/frederic/.fzf/shell/key-bindings.zsh"
