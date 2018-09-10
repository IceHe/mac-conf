######
# ls #
######

# List
## Overwrite $ZSH/lib/directories.zsh
alias l='ls -h'
alias la='ls -hA'
alias ll='ls -hl'
alias lla='ls -hlA'

# List & Grep
alias lg='ls | grep'
alias lag='ls -A | grep'
alias llg='ls -hl | grep'
alias llag='ls -Ahl | grep'

# Sort by Size
## Increasing size
alias lS='ls -hlrS'
alias laS='ls -AhlrS'

# Sort by Time
## Modified
alias lt='ls -Ahlrt'
## Access
alias ltu='ls -Ahlrtu'
## Creation
alias ltU='ls -AhlrtU'

