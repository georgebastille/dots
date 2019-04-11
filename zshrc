source ~/.config/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle command-not-found

# Syntax highlighting bundle.
#antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell Antigen that you're done.
antigen apply

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

# User configuration
export EDITOR='vim'
alias gitsuir='git submodule sync --recursive && git submodule update --init --recursive'
alias gp='git pull'
alias gs='git status'
alias gco='git checkout'

if [ -f ~/.dev_zsh ]; then 
    source ~/.dev_zsh 
fi
if [ -f ~/.mac_zsh ]; then 
    source ~/.mac_zsh 
fi

bindkey -M viins 'jk' vi-cmd-mode
export KEYTIMEOUT=20
