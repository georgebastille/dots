# .bash_profile

export PATH=~/bin:$PATH
export HISTSIZE=-1 
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth:erasedups

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.dev_profile ] && source ~/.dev_profile

# append history entries..
shopt -s histappend

# After each command, save and reload history
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# Get the aliases and functions
[ -r ~/.bashrc ] && . ~/.bashrc

echo ".bash_profile has run"
