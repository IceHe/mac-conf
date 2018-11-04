######
# ls #
######

# List
# ( overwrite $ZSH/lib/directories.zsh )
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
alias lS='ls -AhlS'

# Sort by Time
# - Modified
alias lt='ls -Ahlt'
# - Changed (metadata)
alias ltc='ls -Ahltc'
# - Access
alias ltu='ls -Ahltu'
# - Creation
alias ltU='ls -AhltU'

