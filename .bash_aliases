# colorize
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls'

# alert alias for long running commands
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias for nvim
alias vim='/opt/nvim-linux64/bin/nvim'

# catdir to cat everything in a directory in a way that's easy to send to an llm
alias catdir='~/Utils/catdir.sh'

# school stuff
alias todo='vim ~/Documents/Todos/main.md'
alias knit='f() { pdflatex "$1" && open "${1%.tex}.pdf"; }; f'
alias lambda='sudo ~/Utils/lambda.sh'
