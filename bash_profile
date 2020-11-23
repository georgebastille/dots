# .bash_profile
# Exit on close is nice, but does not play well with nested tmux
#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}
[ -z "$TMUX"  ] && { tmux attach || tmux;}

# Clean up python env
# https://gist.github.com/MuhsinFatih/ee0154199803babb449b5bb98d3475f7
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
#export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
export PATH="/usr/local/opt/python/libexec/bin:$PATH"


export HISTSIZE=-1 
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth:erasedups

[ -d ~/.config/bin ] && export PATH=~/.config/bin:$PATH
[ -d ~/.bbconfig/bin ] && export PATH=~/.bbconfig/bin:$PATH

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

[ -d ~/.config/bin ] && export PATH=~/.config/bin:$PATH
[ -d ~/.bbconfig/bin ] && export PATH=~/.bbconfig/bin:$PATH

[ -r ~/.bashrc ] && . ~/.bashrc
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f /etc/bash_completion ] && source /etc/bash_completion
[ -f ~/.config/z/z.sh ] && source ~/.config/z/z.sh
[ -f ~/.dev_profile ] && source ~/.dev_profile
[ -f ~/.mac_profile ] && source ~/.mac_profile
[ -f ~/.crostini_profile ] && source ~/.crostini_profile

echo "Hello there handsome!"
