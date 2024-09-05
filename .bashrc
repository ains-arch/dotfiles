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
Green='\e[0;32m'        # Green
Blue='\e[0;94m'         # Blue
Purple='\e[0;95m'       # Purple
Yellow='\e[0;33m'       # Yellow
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
    hoststr="\[$Purple\]\h\[$Blue\]:"
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
export PS1="$hoststr\[$Purple\]\w\[$Green\]\$(__git_ps1 ) \[$Purple\]$\[$Color_Off\] "

school_prompt() {
    local school_dir="$HOME/Documents/School"
    
    # Check if the current directory starts with the school directory
    if [[ "$PWD" == $school_dir* ]]; then
        # Remove the school directory part from the prompt
        local new_dir=$(echo "$PWD" | sed 's|/home/ainsarch/Documents/School||')
        PS1="\[$Yellow\]school:~$new_dir \$ \[$Color_Off\] "
    else
        # Show the full path if not in the school directory
        PS1="\[$Yellow\]$PWD \$ \[$Color_Off\] "
    fi
    export PS1
}

school_cd() {
    if [ -z "$1" ]; then
        # If no argument is passed, go to ~/Documents/School
        builtin cd ~/Documents/School
    else
        # If a directory is passed, go to that directory
        builtin cd "$@"
    fi
    school_prompt  # Update the prompt after changing directories
}

alias school='cd ~/Documents/School && school_prompt && alias cd="school_cd"'

# Function to revert to the original prompt
unschool() {
    unalias cd  # Remove the school_cd alias, restoring the default cd command
    source ~/.bashrc  # Reload original .bashrc settings
    cd "$OLDPWD"      # Return to the previous directory if needed
}

# Unset SSH_ASKPASS to avoid using GTK passwords from the command line
unset SSH_ASKPASS

# Colorize ls output
eval "$(dircolors -b ~/.dircolors)"

# Enable writing messages to the terminal
mesg n
