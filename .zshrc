#######
# ENV #
#######

# Plugins
plugins=(brew-cask colored-man copydir copyfile cp git osx sudo tmux vundle z zsh-syntax-highlighting)
## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
## Warning: sudo plugin must be put after vi-mode!

# Preferred Editor 
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Theme
ZSH_THEME="sunrise_icehe" # Look in ~/.oh-my-zsh/themes/

# PATH
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/opt/local/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/Users/IceHe/.composer/vendor/bin"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

## Groovy SDK
export GROOVY_HOME=/usr/local/opt/groovy/libexec

## JDK
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

## NVM
export NVM_DIR="/Users/IceHe/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## Oh-my-zsh
export ZSH=/Users/IceHe/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

## Enable Plugin 'zsh-autosuggestions' manually
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
    zle autosuggest-start
}

# Key-bindings
bindkey '^n' forward-word
bindkey '^p' backward-word

# Zstyle : Auto Correct
zstyle ':completion:*' verbose true
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

#########
# ALIAS #
#########

# AAA
alias e='exit'
alias j='jobs'
alias o='open'
alias o.='open .'
alias pb='pbcopy'
alias pbn='tr -d "\n" | pbcopy'
alias rm='safe-rm'
alias rp='realpath'
alias st='open -a /Applications/Sublime\ Text.app/'
alias vc='open -a /Applications/Visual\ Studio\ Code.app'

# Brew ( Homebrew )
alias bu='bug && bud'
alias bug='brew upgrade -vvv'
alias bud='brew update -vvv'

# CD ( change directory )
alias zd='cd ~/Desktop'
alias zl='cd ~/Downloads'
alias zo='cd ~/Documents'
alias za='cd ~/Documents/AppleScript'
alias zb='cd ~/Documents/Blog/blog'
alias z_='cd ~/Documents/Blog/blog/source/_posts'
alias zn='cd ~/Documents/Blog/blog/themes/next'
alias zi='cd ~/Documents/Lib'
alias zs='cd ~/Documents/Snippets'

alias zj='cd ~/Documents/Java'
alias zf='cd ~/Documents/Java/form'
alias zm='cd ~/Documents/Java/medialib'
alias zS='cd ~/Documents/Java/story'
alias zsora='cd ~/Documents/Work/sora'

alias ze='cd /etc'
alias zc='cd /usr/local/Cellar'
alias z.='cd ~/.config'
alias zh='cd ~/.config/zsh'
alias zp='cd ~/.privacy'
alias zz='cd ~/.oh-my-zsh'

# Crontab
alias crontab="VIM_CRONTAB=true crontab"

# Docker
alias d='docker'
alias dps='docker ps'

alias de='d exec -it '
alias dsp='d stop'
alias drm='d rm'
alias dst='d start'
alias rmi='d rmi'

# Docsify
alias doc='docsify'
alias doci='docsify init'
alias docs='docsify serve'

# Expect
alias sx="/Users/IceHe/Documents/Work/Scripts/sinax.sh"

# FZF
source ~/.config/zsh/fzf.zsh

# Git
source ~/.config/zsh/git.zsh

# Gpngquant
alias pngquant='/Users/IceHe/Documents/Tools/pngquant/pngquant'
alias pngquant-openmp='/Users/IceHe/Documents/Tools/pngquant/pngquant-openmp'

# Hexo
alias h='zb && hexo s'
alias ha='zb && hexo clean && hexo g && hexo s'
alias tg='zb && clear && hexo clean && hexo deploy && -'

# IP
source ~/.config/zsh/ip.zsh

# LS ( List Dir Contents )
source ~/.config/zsh/ls.zsh

# Mardownlint (Node.js)
alias ml='/Users/IceHe/Documents/Tools/markdownlint/bin/mdl'

# Maven
alias m='mvn'
alias mn='mvn clean'
alias mc='mvn compile'
alias mt='mvn test'
alias mp='mvn package'
alias mh='mvn -help'

alias imw='mvn -N io.takari:maven:wrapper'
alias mw='./mvnw'
alias mwc='./mvnw clean'
alias mwp='./mvnw package'
alias mwcp='./mvnw clean package'
alias jj='java -jar'
alias mwsbr='./mvnw spring-boot:run'

# MySQL
alias sm="mysql.server start"

# Proxy
source ~/.config/zsh/proxy.zsh

# Qrsync ( 七牛云存储同步 )
alias qra='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/blog_att_conf.json'
alias qri='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/blog_img_conf.json'
alias qrt='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/ice_he_test_conf.json'

# Redis
alias sr="redis-server /usr/local/etc/redis.conf"

# Tmux
source ~/.config/zsh/tmux.zsh

# Touch
alias th='touch'

# Vim
alias v='nvim'
alias sv='sudo nvim'
#alias v='vim'
#alias sv='sudo vim'
alias vim='nvim'

alias vh='v /etc/hosts'
alias vgi='v ./.gitignore'
alias vt='v ~/.tmux.conf'
alias vcv='v ~/.cvimrc'
alias viv='v ~/.ideavimrc'
alias vv='v ~/.vimrc'
alias vz='v ~/.zshrc'

alias vk='v ~/.config/karabiner/karabiner.json'
alias stk='st ~/.config/karabiner/karabiner.json'
alias vck='vc ~/.config/karabiner/karabiner.json'
alias vs='v  ~/.ShadowsocksX-NG/user-rule.txt'
alias vm='v ~/.mdlrc'

# WTool
export DCP_USER=zhiyuan16

alias wt="wtool"
alias jp="wtool jpool"
alias dcp="wtool dcplogin"
## similar to `sx`
alias wl="wtool login" 

