######
# ls #
######

# List
# ( overwrite $ZSH/lib/directories.zsh )
# ( reference $ZSH/plugins/common-aliases )
alias l='ls -Fh'
alias la='ls -AFh'
alias ll='ls -Fhl'
alias lla='ls -AFhl'

# List & Grep
alias lg='l | grep'
alias lag='la | grep'
alias llg='ll | grep'
alias llag='lla | grep'

# Sort
# by size
alias lS='ls -AFhlS'
# by mtime ( modification )
alias lt='ls -AFhlt'
# by ctime ( changed metadata )
alias ltc='ls -AFhltc'
# by atime ( access )
alias ltu='ls -AFhltu'
# by creation time ( only macOS )
alias ltU='ls -AFhltU'
