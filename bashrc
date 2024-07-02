# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color -h --group-directories-first'
alias gitsuir='git submodule sync --recursive && git submodule update --init --recursive'
alias gp='git pull'
alias gs='git status'
alias gco='git checkout'
#alias vim='nvim'

EDITOR='nvim'

#WHITE=`tput setaf 7`
#GREEN=`tput setaf 2`
#RED=`tput setaf 1`
#YELLOW=`tput setaf 3`
#MAGENTA=`tput setaf 5`
export PS1="\[\e[32m\]\A\[\e[m\] \[\e[31m\]\W\[\e[m\]\[\e[33m\]\$(__git_ps1)\[\e[m\]: "

# echo ".bashrc has run"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rhanes/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rhanes/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rhanes/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rhanes/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export _IDE_MAGIC_USE_ATTACH_MODE=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
