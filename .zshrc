######
# IP #
######

function wifi_ip() {
    /sbin/ifconfig en0|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function physical_ip() {
    /sbin/ifconfig en9|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function all_ip() {
    /sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function ip_addr() {
    if [ -n "$(physical_ip)" ]; then
        physical_ip
    elif [ -n "$(wifi_ip)" ]; then
        wifi_ip
    else
        all_ip
    fi
}

## Is Sina Development Env?

init_ip=$(ip_addr)

function is_dev() {
    sina_dev_machine_ip="10.13.130.231"
    [ $init_ip = $sina_dev_machine_ip ]
}

#######
# ENV #
#######

# Auto Correct
zstyle ':completion:*' verbose true
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# NVM
export NVM_DIR="/Users/IceHe/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Plugins
plugins=(brew-cask colored-man copydir copyfile cp git osx sudo tmux vundle z zsh-syntax-highlighting)
## Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
## Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
## Example format: plugins=(rails git textmate ruby lighthouse)
## Add wisely, as too many plugins slow down shell startup.
## Warning: sudo plugin must be put after vi-mode!

# Preferred Editor 
export EDITOR='nvim'
## For local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
  #export EDITOR='vim'
#else
  #export EDITOR='mvim'
#fi

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

## Path to oh-my-zsh
export ZSH=/Users/IceHe/.oh-my-zsh
### TORM: Patch for Sina
if is_dev; then
    export ZSH=/usr/home/zhiyuan16/.oh-my-zsh
fi
### Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Enable Plugin 'zsh-autosuggestions' manually
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/autosuggestions.zsh
zle-line-init() {
    zle autosuggest-start
}

# Key-bindings
bindkey '^n' forward-word
bindkey '^p' backward-word

#########
# ALIAS #
#########

alias cm='chmod' # change mode
alias co='chown' # change owner
alias e='exit'
alias j='jobs'
alias o='open'
alias pb='pbcopy'
alias pbn='tr -d "\n" | pbcopy'
alias rm='safe-rm'
alias rp='realpath'
alias st='open -a /Applications/Sublime\ Text.app/'

# brew: Homebrew
alias bu='bug | bud'
alias bug='brew upgrade -vvv'
alias bud='brew update -vvv'

# cd: change directory
alias zd='cd ~/Desktop'
alias zl='cd ~/Downloads'
alias zo='cd ~/Documents'
alias za='cd ~/Documents/AppleScript'
alias zg='cd ~/Documents/Coding'
alias zp='cd ~/Documents/Python'
alias zb='cd ~/Documents/Blog/icehe.me'
alias z_='cd ~/Documents/Blog/icehe.me/source/_posts'
alias zn='cd ~/Documents/Blog/icehe.me/themes/next'

alias zk='cd ~/Documents/Work'
alias zs='cd ~/Documents/Work/sora'
alias zs2='cd ~/Documents/Work/sora2'
alias zS='cd ~/Documents/Work/Scripts'
alias zw='cd ~/Documents/Work/weibov5_code'
alias zw2='cd ~/Documents/Work/weibov5_code2'

alias ze='cd /etc'
alias zc='cd /usr/local/Cellar'
alias z.='cd ~/.config'
alias zz='cd ~/.oh-my-zsh'
alias uz='cd ~/.oh-my-zsh && git pull && -'

# Crontab
alias crontab="VIM_CRONTAB=true crontab"

# Docker
alias d='docker'
alias dps='docker ps'

alias des='d exec -it sora bash'
alias dsp='d stop sora'
alias drm='d rm sora'
alias dst='d start sora'
alias drs='dsp && docker start sora'

alias rmi='d rmi'

# Git
alias gcf='git config'
alias gcfl='git config -l'
alias gcfe='git config -e'

alias gcm='git commit -m'

alias gcom='git checkout master'

alias gdc='git diff --cached'
alias gdwc='git diff --word-diff --cached'

alias gfap='git fetch -ap'

alias ggr='git grep'

alias glf='git ls-files'

alias glm='git pull main'
alias glmm='git pull main master'

function gnb {
    branch=`git rev-parse --abbrev-ref HEAD`
    echo git push --set-upstream origin $branch
    git push --set-upstream origin $branch
}

alias grm='git rm'

alias gr='git reset'
alias grh='git reset HEAD --hard'

alias gs='git status -bs'

alias gst='git stash'
alias gsd='git stash drop'
alias gsl='git stash list'
alias gsp='git stash pop'

# Hexo
alias h='zb && hexo s'
alias ha='zb && hexo clean && hexo g && hexo s'
alias tg='zb && clear && hexo clean && hexo deploy && -'

# IP
alias ip='ip_addr | tr -d "\n" | pb; ip_addr'

# ls: list

## overwrite $ZSH/lib/directories.zsh
alias l='ls -h'
alias ll='ls -hl'
alias la='ls -hA'
alias lla='ls -hlA'
## grep
alias lg='ls -h | grep'
alias llg='ls -hl | grep'
alias lag='ls -hA | grep'
alias llag='ls -hlA | grep'

# MySQL
alias sm="mysql.server start"

# nc: Netcat
alias no="nc -l 7777 < "
alias ni="nc -n 10.13.130.231 7777 > "

# qrsync: 七牛云存储同步
alias qra='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/blog_att_conf.json'
alias qri='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/blog_img_conf.json'
alias qrt='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/ice_he_test_conf.json'

# Redis
alias sr="redis-server /usr/local/etc/redis.conf"

# Shadowsocks
function sss() {
    #export ALL_PROXY=socks5://127.0.0.1:1081
    export http_proxy=http://127.0.0.1:1083;
    export https_proxy=http://127.0.0.1:1083;
}
function uss() {
    #unset ALL_PROXY
    unset http_proxy;
    unset https_proxy;
}
alias ss='env | grep _proxy=' #alias ss='env | grep ALL_PROXY'

# tmux
alias t='tmux'
alias tn='tmux new-session -s'

# Vim
alias v='nvim'
alias sv='sudo nvim'
#alias v='vim'
#alias sv='sudo vim'

alias vh='v /etc/hosts'
alias vgi='v ./.gitignore'
alias vp='v /usr/local/etc/php/7.1/php.ini'
alias vt='v ~/.tmux.conf'
alias vcv='v ~/.cvimrc'
alias viv='v ~/.ideavimrc'
alias vv='v ~/.vimrc'
alias vz='v ~/.zshrc'
alias vk='v ~/.config/karabiner/karabiner.json'
alias stk='st ~/.config/karabiner/karabiner.json'

# PHP

## Composer
alias civ='composer install -vvv && composer dump'
alias cuv='composer update -vvv && composer dump'

## PHPUnit
function ut {
    num=
    if [[ `pwd` =~ ^.*sora2.*$ ]]; then
        num=2
    fi
    /Users/IceHe/Documents/Work/sora$num/sora test "$@"
    echo "/Users/IceHe/Documents/Work/sora$num/sora test $@"
}

function utc {
    ut --coverage-html=/Users/IceHe/Downloads/coverage $@
}

function uts {
    if [[ "$1" =~ ^.*/tests/(.*)Test\.php$ ]]; then
        ut $1 && echo "\n<<< Generating Coverage Reports... >>>\nopen /Users/IceHe/Downloads/coverage/$match.php.html\n" && utc $1 > /dev/null && open ~/Downloads/coverage/$match.php.html
    fi
}

## PHPCS
function cs {
    num=
    if [[ `pwd` =~ ^.*sora2.*$ ]]; then
        num=2
    fi
    /Users/IceHe/Documents/Work/sora$num/sora cs $1
    echo "/Users/IceHe/Documents/Work/sora$num/sora cs $1"
}

# Work

## Git
function mr {
    branch=`git rev-parse --abbrev-ref HEAD`
    echo $branch
    open https://gitlab.weibo.cn/zhiyuan16/sora/merge_requests/new?merge_request%5Bsource_branch%5D=$branch
}

## Rsync
alias rtd="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_dev.sh"
#alias rtl="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_local.sh" # Seldom
#alias rtd2="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_dev2.sh"
#alias rtl2="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_local2.sh"
alias rtd3="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_dev_131_232.sh"
alias s8001="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_sora_8001.sh"
alias s8011="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_sora_8011.sh"
alias s8012="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_sora_8012.sh"

## Sora
alias sora=/Users/IceHe/Documents/Work/sora/sora
alias mb='sora mk:branch'
alias mc='sora mk:controller'
alias lgi='sora ls:api -l"gray intranet" -a'
alias li='sora ls:issue'
alias lai='sora ls:api'
alias mt='sora mk:tag'
alias mtr='sora mk:tag released*'
alias mtrd='sora mk:tag released* -d'
alias mtc='sora mk:tag candidate*'
alias mtcd='sora mk:tag candidate* -d'
alias mtcy='sora mk:tag candidate* -y'

## SSH
alias sina="/Users/IceHe/Documents/Work/Scripts/sina.sh"
alias sinax="/Users/IceHe/Documents/Work/Scripts/sinax.sh"

## 10.13.130.231 (development env)
if is_dev; then
    # ENV
    export EDITOR='vim'
    export LC_ALL="zh_CN.UTF-8"

    # Alias
    ## Code
    alias zw='cd /data1/v5.weibo.cn/code'
    alias zw2='cd /data1/v5.weibo.cn/code2'

    ## Config
    alias zlc='cd /data1/v5.weibo.cn/library/conf'
    alias vpc='vim /data1/v5.weibo.cn/library/conf/v5_pageconfig.ini'

    ## Log
    alias zt='cd /data1/v5.weibo.cn/logs/ttt/'
    alias rmt="sudo rm -rf /data1/v5.weibo.cn/logs/ttt/*"

    ## HTTP Server
    alias zn='cd /etc/nginx'
    alias vn='sv /etc/nginx/v5.conf'

    alias zp='cd /etc/php.d'
    alias zpf='cd /etc/php-fpm.d'

    alias vx='sv /etc/php.d/xdebug.ini'

    ## Services
    alias rn='sudo service nginx restart'
    alias rp='sudo service php-fpm restart'
    alias rnp='rn && rp'

    # PHP7
    alias p5='/usr/bin/php'
    alias php='/usr/home/zhiyuan16/php7/bin/php'
    alias zp7='/usr/home/zhiyuan16/php7/'
    alias vx7='sv /usr/home/zhiyuan16/php7/lib/php.ini'

    alias rp7='sudo killall -9 php-fpm && sudo /usr/home/zhiyuan16/php7/sbin/php-fpm && echo php7 php-fpm: ok'
    alias rnp7='rn && rp7 && rp'

    ## Vim
    alias vh='sv /etc/hosts'
    alias v='vim'
    alias sv='sudo vim'
fi

#######
# FZF #
#######

# Wiki: <https://github.com/junegunn/fzf/wiki>

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fuzzy grep open via ag
vg() {
  local file

  file="$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1 " +" $2}')"

  if [[ -n $file ]]
  then
     nvim $file
  fi
}

# fd - cd to selected directory
fdr() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# Another fd - cd into the selected directory
# This one differs from the above, by only showing the sub directories and not
#  showing the directories within those.
fd() {
  DIR=`find * -maxdepth 0 -type d -print 2> /dev/null | fzf-tmux` \
    && cd "$DIR"
}

# fda - including hidden directories
fda() {
  local dir
  dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
}

# fdp - cd to selected parent directory
fdp() {
  local declare dirs=()
  get_parent_dirs() {
    if [[ -d "${1}" ]]; then dirs+=("$1"); else return; fi
    if [[ "${1}" == '/' ]]; then
      for _dir in "${dirs[@]}"; do echo $_dir; done
    else
      get_parent_dirs $(dirname "$1")
    fi
  }
  local DIR=$(get_parent_dirs $(realpath "${1:-$PWD}") | fzf-tmux --tac)
  cd "$DIR"
}

# cdf - cd into the directory of the selected file
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fbr - checkout git branch
fbr() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fbr - checkout git branch (including remote branches)
fbrr() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

# fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}

# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
bip() {
  local inst=$(brew search | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}

# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]lugin
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}

# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}

unalias z 2> /dev/null
z() {
  [ $# -gt 0 ] && _z "$*" && return
  cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
}

export FZF_DEFAULT_OPTS='
    --color fg:-1,bg:-1,hl:230,fg+:3,bg+:233,hl+:229
    --color info:150,prompt:110,spinner:150,pointer:167,marker:174
'

clear

