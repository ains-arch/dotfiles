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
HISTSIZE=10000000      # Maximum number of commands to remember
HISTFILESIZE=10000000  # Maximum number of lines in the history file

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
shopt -s expand_aliases

# Enable programmable completion features if not already enabled
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#######################################

# Prompt config
if [ -f "$HOME/.bash_prompt" ]; then
    . "$HOME/.bash_prompt"
else
    # Fallback prompt with color for root vs normal user
    if [[ $EUID == 0 ]]; then
        PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
    else
        PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
    fi
fi


# Make envs stop overriding the prompt
activate() {
   VIRTUAL_ENV_DISABLE_PROMPT=1 source "$1/bin/activate"
}

# Unset SSH_ASKPASS to avoid using GTK passwords from the command line
unset SSH_ASKPASS

# Disable writing messages to the terminal
mesg n

#######################################

# Path configuration

# C and C++ headers
export C_INCLUDE_PATH=~/.local/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=~/.local/include:$CPLUS_INCLUDE_PATH

# TeX Live
export MANPATH=/usr/local/texlive/2024/texmf-dist/doc/man:/usr/share/man
export INFOPATH=/usr/local/texlive/2024/texmf-dist/doc/info:/usr/share/info
export PATH=/usr/local/texlive/2024/bin/x86_64-linux:$PATH

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - bash)"

# rust
export PATH=~/.cargo/bin:$PATH

# Remove duplicates
export PATH=$(echo "$PATH" | awk -v RS=: '!a[$1]++' | paste -sd:)
