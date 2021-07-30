# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/IceHe/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git)
plugins=(
  #bgnotify
  cp
  #docker
  #docker-compose
  extract
  fd
  git
  globalias
  #golang
  #maven
  redis-cli
  #rsync
  safe-paste
  sudo
  tmux
  z
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#########
# IceHe #
#########

# Notice:
# The configs above section "IceHe" are generated
# when in oh-my-zsh installation.
# Try not to modify them above if unneccessary.
# If I need, I will just overwrite it bewlow.

#######
# ENV #
#######

# Locale
export LANG=en_US.UTF-8
# export LANG=zh_CN.UTF-8
## - macOS 下命令行终端无法输入中文或中文显示 : https://blog.csdn.net/j754379117/article/details/53897115
## - 解决 macOs SSH LC_CTYPE 警告问题 : http://data4q.com/2018/01/06/%E8%A7%A3%E5%86%B3mac-os-x-ssh-lc_ctype%E8%AD%A6%E5%91%8A%E9%97%AE%E9%A2%98/

# PATH
#
# Config files on macOS:
#
# - /etc/paths
# - /etc/paths.d/*
# - /etc/profile
#     - Auto Completion : eval `/usr/libexec/path_helper -s`
#
# e.g. /etc/paths
#
# - Dirs */local/* must be put above /bin, /usr/bin and etc.
#   so that commands within */local/* can be accessible at first.
#
# ```text
# /opt/local/sbin
# /opt/local/bin
# /opt/sbin
# /opt/bin
# /usr/local/sbin
# /usr/local/bin
# /usr/sbin
# /usr/bin
# /sbin
# /bin
# ````

## Go
#export GOPATH=$HOME/go
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:$GOROOT/bin
#### GOBIN must be an absolute path
#export GOBIN=~/go/bin

## Groovy SDK
#export GROOVY_HOME=/usr/local/opt/groovy/libexec

# Homebrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles
export PATH="/opt/homebrew/bin:$PATH"

# JDK
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

## MySQL 5.x
## Current version is 8.0+ by default.
#export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# NVM
export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# BISON
export PATH="/usr/local/opt/bison/bin:$PATHexport PATH="/usr/local/opt/bison/bin:$PATH

#########
# ALIAS #
#########

# Shortest
alias a='arch -x86_64' # Architecture X86
alias b='brew'
alias ib='arch -x86_64 /usr/local/bin/brew'
alias bu='brew update -vvv && brew upgrade -vvv'
alias d='docker'
alias e='exit'
alias f='find'
alias i='ip'
alias m='mvn'
alias o='open'
alias pb='pbcopy'
alias pbn='tr -d "\n" | pbcopy'
alias rm='safe-rm'
alias rp='realpath'
alias zup='.oh-my-zsh/tools/upgrade.sh'

# Applications
alias st='open -a /Applications/Sublime\ Text.app/'
alias vc='open -a /Applications/Visual\ Studio\ Code.app'

# CD ( change directory )
alias zd='cd ~/Desktop'
alias zl='cd ~/Downloads'
alias zo='cd ~/Documents'
alias zi='cd ~/Documents/lib'

alias ze='cd /etc'
alias zc='cd ~/.config'
alias zh='cd ~/.config/zsh'

# Coreutils ( GNU commands )
alias awk='gawk'

# MySQL
alias ms="mysql.server"

# Vim
alias v='nvim'
alias sv='sudo nvim'

## Modify Files
alias vgi='v ./.gitignore'
alias vh='sv /etc/hosts'
alias vv='v ~/.vimrc'
alias viv='v ~/.ideavimrc'
alias vt='v ~/.tmux.conf'
alias vz='v ~/.zshrc'

alias vk='v ~/.config/karabiner/karabiner.json'
alias stk='st ~/.config/karabiner/karabiner.json'
alias vck='vc ~/.config/karabiner/karabiner.json'

# Source
source ~/.config/zsh/fzf.zsh
source ~/.config/zsh/git.zsh
source ~/.config/zsh/ip.zsh
source ~/.config/zsh/ls.zsh
source ~/.config/zsh/proxy.zsh
source ~/.config/zsh/tmux.zsh
# Reload ZSH Configs in .zshrc
alias sz='source ~/.zshrc && echo \$ source ~/.zshrc'

############
# BIND-KEY #
############

# Expand Alias
# ( including global via plugin globalias )
# ( REF : ~/.oh-my-zsh/plugins/globalias/globalias.plugin.zsh )
bindkey -M emacs "^x " globalias
bindkey -M viins "^x " globalias
# Revert improper configs in plugin globalias
bindkey -M isearch " " magic-space
bindkey -M emacs " " magic-space
bindkey -M viins " " magic-space
bindkey -M emacs -r "^ "
bindkey -M viins -r "^ "

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/icehe/.sdkman"
[[ -s "/Users/icehe/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/icehe/.sdkman/bin/sdkman-init.sh"

