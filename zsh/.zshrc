HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY       # Don't overwrite history
setopt SHARE_HISTORY        # Share history across terminals
setopt HIST_IGNORE_ALL_DUPS # Clean up duplicates

autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Case-insensitive matching

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)

bindkey -e
bindkey '^[[3~' delete-char                     # Supr
bindkey '^[[3;5~' kill-word                     # Ctrl+Supr
bindkey '^H' backward-kill-word                 # Ctrl+Backspace 
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey "^[[1;5C" forward-word                  # Ctrl+RightArrow
bindkey "^[[1;5D" backward-word                 # Ctrl+LeftArrow

PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

alias cl='clear'
alias v='nvim'
alias cde='cd /home/jan/emh'
alias cdm='cd /home/jan/emh/emh-mvp'
alias cdmf='cd /home/jan/emh/emh-mvp/emh-frontend'
alias cdmb='cd /home/jan/emh/emh-mvp/emh-backend'
alias cdw='cd /home/jan/emh/emh-web'
alias cda='cd /home/jan/emh/emh-ai'
alias c='code .'
alias a='antigravity .'
alias funcy='ssh emh@100.84.225.125'
alias fl='ssh emh@192.168.1.100'

if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
fi
ssh-add ~/.ssh/id_ed25519 2>/dev/null

fastfetch
export PATH=~/.npm-global/bin:$PATH
# Gnome Keyring setup
if [ -n "$DESKTOP_SESSION" ]; then
    eval $(gnome-keyring-daemon --start --components=secrets)
    export SSH_AUTH_SOCK
fi

export JAVA_HOME=/usr/lib/jvm/default
export PATH=$JAVA_HOME/bin:$PATH
