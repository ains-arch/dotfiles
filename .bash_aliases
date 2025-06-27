# colorize
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls aliases
alias l='ls'
alias la='ls -A'
alias ll='ls -alF'

# alert alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# in this house we use neovim
alias vim=nvim

# catdir to cat everything in a directory in a way that's easy to send to an llm
alias catdir='~/Utils/catdir.sh'

# school stuff
alias todo='vim ~/Documents/Todos/main.md'
alias knit='pdflatex'
alias lambda='sudo ~/Utils/lambda.sh'

# prompt handling
alias scrunch='SCRUNCH_STATE="scrunched"'
alias unscrunch='SCRUNCH_STATE="unscrunched"'

# THERE'S A LITTLE GUY ON MY COMPUTER
alias chat='ollama run llama3.2'

alias open='xdg-open'
alias rdp='pkill -9 xfreerdp3; xfreerdp3 ~/Documents/School/capstone/capstone.rdp'

alias zotero='/home/ainsarch/Utils/Zotero_linux-x86_64/zotero &'

# Manjaro's defaults
alias cp="cp -i"
alias df='df -h'
alias free='free -m'
