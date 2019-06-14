# .bash_profile

export PATH=~/bin:$PATH
export HISTSIZE=-1 
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth:erasedups

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.config/z/z.sh ] && source ~/.config/z/z.sh
[ -f ~/.dev_profile ] && source ~/.dev_profile
[ -f ~/.mac_profile ] && source ~/.mac_profile

# Goodies here:
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html#The-Shopt-Builtin
# and here:
# https://github.com/ericvw/dotfiles/blob/master/bash/.bashrc

# Prevent existing files from being overwritten by redirection.
set -o noclobber

# Auto-correct minor typos on `cd`.
shopt -s cdspell

# If hash lookup fails, default to $PATH.
shopt -s checkhash

# List status of any jobs before shell exit.
shopt -s checkjobs

# Update winsize after each command for better line-wrapping.
shopt -s checkwinsize

# Save muti-line command as one history entry.
shopt -s cmdhist

# Expand directory names (e.g., $HOME => /home/$(whoami)).
shopt -s direxpand

# Auto-correct minor typos on directory word completion.
shopt -s dirspell

# Recursive globbing (e.g., ls **/*.txt).
shopt -s globstar

# append history entries..
shopt -s histappend

# a command name that is the name of a directory is executed as if it were the argument to the cd command
# shopt -s autocd

# Don't start auto-completion if there is nothing on the command line.
shopt -s no_empty_cmd_completion

# After each command, save and reload history
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Get the aliases and functions
[ -r ~/.bashrc ] && . ~/.bashrc

#echo ".bash_profile has run"
