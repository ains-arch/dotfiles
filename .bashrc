# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Avoid duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Set history length
HISTSIZE=100000      # Maximum number of commands to remember
HISTFILESIZE=100000  # Maximum number of lines in the history file

# Check window size after each command and update LINES and COLUMNS if necessary
shopt -s checkwinsize

# Less command configuration for non-text input files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac
    
# Alias definitions: load from ~/.bash_aliases if it exists
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Enable programmable completion features if not already enabled
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#######################################
# Colors for the prompt
Color_Off='\e[0m'       # Text Reset
Yellow='\e[0;93m'      # Yellow
Green='\e[0;32m'        # Green
Black='\e[0;90m'       # Black
#######################################

# Update PATH
export PATH=~/.local/bin:~/.cabal/bin:$PATH

# Include paths for C and C++ headers
export C_INCLUDE_PATH=~/.local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=~/.local/include:$CPLUS_INCLUDE_PATH

# Git prompt settings
. ~/.git-prompt.sh
if [ "$(hostname)" = "userland" ]; then
    hoststr=""
else
    hoststr="\[$Yellow\]\h\[$Black\]:"
fi

# Function to show if the repository is dirty
function dirty() {
    if [[ $(git status --porcelain) ]]; then
        echo '- dirty'
    fi
}

# Git prompt configuration
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM='auto'
export PS1="$hoststr\[$Yellow\]\w\[$Green\]\$(__git_ps1 ) \[$Yellow\]$\[$Color_Off\] "

# Unset SSH_ASKPASS to avoid using GTK passwords from the command line
unset SSH_ASKPASS

# Colorize ls output
eval "$(dircolors -b ~/.dircolors)"

# Initialize nosyware
# If the monitor is already running, don't start a new instance of it
if ! pgrep -f "Utils/nosyware/monitor.sh" > /dev/null; then
    nohup ~/Utils/nosyware/monitor.sh > ~/Utils/nosyware/nohup.out 2>&1 &
fi

# Start a new instance of broadcast regardless, for that terminal
bash ~/Utils/nosyware/broadcast.sh &

# Enable writing messages to the terminal
mesg n

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/aarchib2/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/aarchib2/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/aarchib2/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/aarchib2/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
