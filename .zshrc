###############################################################################
# oh-my-zsh
###############################################################################

#Path to your oh-my-zsh installation.
case `uname` in
  Darwin)
    # commands for OS X go here
    export ZSH=/Users/olivier/.oh-my-zsh
  ;;
  Linux)
    # commands for Linux go here
    export ZSH=/usr/share/oh-my-zsh
  ;;
esac

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh



###############################################################################
# User configuration
###############################################################################

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi


# Enable vim mode on command line
bindkey -v

# Workaround to enable backspace after switching from normal to insert mode
bindkey "^?" backward-delete-char

# Workaround to get autocomplete based on history working in vim mode
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Don't share history between terminals
unsetopt share_history

###############################################################################
# Aliases
###############################################################################
alias la="ls -A"
alias ll="ls -alF"
alias l="ls -CF"
alias shutdown="shutdown now"
alias k="kubectl"



###############################################################################
# Command Completion
###############################################################################
source <(kubectl completion zsh)
source <(helm completion zsh)

autoload -Uz compinit
compinit

zstyle ':completion:*' completer _expand _complete _ignored

