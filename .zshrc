# This Variable is also used in ./themes/sunrise_me.zsh-theme !!

function wifi_ip() {
    /sbin/ifconfig en0|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function physical_ip() {
    # Adapter
    #/sbin/ifconfig en9|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'

    # Docking Station
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

init_ip=$(ip_addr)

function is_dev() {
    sina_dev_machine_ip="10.13.130.231"
    [ $init_ip = $sina_dev_machine_ip ]
    #[ "$(ip_addr)" = $dev_ip ]
}

# Path to your oh-my-zsh installation.
if is_dev; then
    export ZSH=/usr/home/zhiyuan16/.oh-my-zsh
else
    export ZSH=/Users/IceHe/.oh-my-zsh
fi

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sunrise_me"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy/mm/dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Warning: sudo plugin must be put after vi-mode!
plugins=(brew-cask colored-man copydir copyfile copydir cp git osx tmux sudo vundle z zsh-autosuggestions zsh-interactive-cd zsh-syntax-highlighting)

# User configuration
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/opt/local/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/usr/bin"
export PATH="$PATH:/sbin"
export PATH="$PATH:/Users/IceHe/.composer/vendor/bin"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if is_dev; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi
#if [[ -n $SSH_CONNECTION ]]; then
  #export EDITOR='vim'
#else
  #export EDITOR='mvim'
#fi

# About Auto Correct
zstyle ':completion:*' verbose true
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Fix *.app which cannot run now

#alias fapp='chmod +x *.app/contents/macos/*'

# Aliases

## Safe-rm !!!
alias rm='safe-rm'

## crontab
alias crontab="VIM_CRONTAB=true crontab"

## Netcat
alias no="nc -l 7777 < "
alias ni="nc -n 10.13.130.231 7777 > "

## List Dir
alias lg='ls -h | grep'
alias llg='ls -hl | grep'
alias lag='ls -hA | grep'
alias llag='ls -hlA | grep'

alias e='exit'

## Homebrew
alias bu='bug | bud'
alias bug='brew upgrade -vvv'
alias bud='brew update -vvv'

## IP
alias ip='ip_addr | tr -d "\n" | pb; ip_addr'

## Background
alias j='jobs'

## Clipboard
alias rp='realpath'
alias pb='pbcopy'
### Cannot use in macOS High Sierra!
alias pbn='tr -d "\n" | pbcopy'

## Hexo
alias h='zb && hexo s'
alias ha='zb && hexo clean && hexo g && hexo s'

alias tg='zb && clear && hexo clean && hexo deploy && -'

## Vim
alias v='nvim'
alias sv='sudo nvim'
#alias v='vim'
#alias sv='sudo vim'

# edit files

## Vim
alias vh='v /etc/hosts'
alias vgi='v ./.gitignore'
alias vp='v /usr/local/etc/php/7.1/php.ini'
alias vt='v ~/.tmux.conf'
alias vcv='v ~/.cvimrc'
alias viv='v ~/.ideavimrc'
alias vv='v ~/.vimrc'
alias vz='v ~/.zshrc'
alias vk='v ~/.config/karabiner/karabiner.json'

## open
alias o='open'

## cd
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
alias zz='cd ~/.oh-my-zsh'
alias zc='cd /usr/local/Cellar'

## qrsync
alias qra='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/blog_att_conf.json'
alias qri='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/blog_img_conf.json'
alias qrt='/Users/IceHe/Documents/Blog/qr_dev_tool/qrsync /Users/IceHe/Documents/Blog/qr_dev_tool/ice_he_test_conf.json'

## Auto Scripts
alias sina="/Users/IceHe/Documents/Work/Scripts/sina.sh"
alias sinax="/Users/IceHe/Documents/Work/Scripts/sinax.sh"

alias rtd="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_dev.sh"
#alias rtl="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_local.sh" # Seldom

#alias rtd2="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_dev2.sh"
#alias rtl2="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_local2.sh"

alias rtd3="/Users/IceHe/Documents/Work/Scripts/rsync_code_to_dev_131_232.sh"

## Shadowsocks Proxy
function sss() {
    #export ALL_PROXY=socks5://127.0.0.1:1081 # 我的老方法
    export http_proxy=http://127.0.0.1:1083;
    export https_proxy=http://127.0.0.1:1083;
}

function uss() {
    #unset ALL_PROXY # 我的老方法
    unset http_proxy;
    unset https_proxy;
}

#alias ss='env | grep ALL_PROXY'
alias ss='env | grep _proxy='

## Docker
alias d='docker'
alias dps='docker ps'

alias des='d exec -it sora bash'
alias dsp='d stop sora'
alias drm='d rm sora'
alias dst='d start sora'
alias drs='dsp && docker start sora'

## MySQL
alias sm="mysql.server start"

## Redis
alias sr="redis-server /usr/local/etc/redis.conf"

## Sublime Text
alias st='open -a /Applications/Sublime\ Text.app/'

## Sora

### PHPUnit

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

### PHP CS

function cs {
    num=
    if [[ `pwd` =~ ^.*sora2.*$ ]]; then
        num=2
    fi
    /Users/IceHe/Documents/Work/sora$num/sora cs $1
    echo "/Users/IceHe/Documents/Work/sora$num/sora cs $1"
}

### ./sora
alias sora=/Users/IceHe/Documents/Work/sora/sora
alias mb='sora mk:branch'
alias mc='sora mk:controller'
alias li='sora ls:issue'
alias mt='sora mk:tag'
alias mtc='sora mk:tag candidate*'
alias mtcy='sora mk:tag candidate* -y'
alias mtr='sora mk:trait'

## Composer
alias civ='composer install -vvv && composer dump'
alias cuv='composer update -vvv && composer dump'

## for Dev Machine (10.13.130.231)

if is_dev; then

    # Encoding
    export LC_ALL="zh_CN.UTF-8"

    # Shortcuts
    alias zlc='cd /data1/v5.weibo.cn/library/conf'
    alias vpc='vim /data1/v5.weibo.cn/library/conf/v5_pageconfig.ini'

    alias zw='cd /data1/v5.weibo.cn/code'
    alias zw2='cd /data1/v5.weibo.cn/code2'

    alias zn='cd /etc/nginx'
    alias zp='cd /etc/php.d'
    alias zpf='cd /etc/php-fpm.d'

    alias vn='sv /etc/nginx/v5.conf'
    alias vx='sv /etc/php.d/xdebug.ini'

    alias zt='cd /data1/v5.weibo.cn/logs/ttt/'

    # Service
    alias rn='sudo service nginx restart'
    alias rp='sudo service php-fpm restart'
    alias rnp='rn && rp'

    alias rp7='sudo killall -9 php-fpm && sudo /usr/home/zhiyuan16/php7/sbin/php-fpm && echo php7 php-fpm: ok'
    alias rnp7='rn && rp7 && rp'

    # Vim
    alias v='vim'
    alias sv='sudo vim'

    # Hosts
    alias vh='sv /etc/hosts'

    # PHP7
    alias p5='/usr/bin/php'
    alias php='/usr/home/zhiyuan16/php7/bin/php'
    alias zp7='/usr/home/zhiyuan16/php7/'
    alias vx7='sv /usr/home/zhiyuan16/php7/lib/php.ini'

    # Netcat
    alias ni="nc -n 10.209.2.181 7777 > "

    # Clear logs
    alias rmt="sudo rm -rf /data1/v5.weibo.cn/logs/ttt/*"

fi

# key-bindings
bindkey '^p' backward-word
bindkey '^n' forward-word

###################
# Tools about fzf #
###################

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

