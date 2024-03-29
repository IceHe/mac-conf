#######
# Git #
#######

unalias ls

alias gau='git add -u && gs'

alias gcf='git config'
alias gcfl='git config -l'
alias gcfe='git config -e'
alias gcfgl='git config --global -e'
alias gcfge='git config --global -e'

alias gcm='git commit -m'
#alias g.='git commit -m "`date +%F\ %T\ %a`"'
alias g.='git commit -m "."'
alias g.p='g. && gp'
alias ga.='gaa && g.'
alias ga.p='ga. && gp'

alias gcom='git checkout master'

alias gcfd='git clean -fd'

alias gdc='git diff --cached'
alias gdwc='git diff --word-diff --cached'

alias gfap='git fetch -ap'

alias ggr='git grep'

alias gi='git init'

alias glf='git ls-files'

alias glm='git pull main'
alias glmm='git pull main master'
alias glom='git pull origin master'

alias gls='git ls-files'

#alias gmom='git merge origin/master'
alias gmom='git pull --rebase origin master'

alias gmv='git mv'

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

# 显示最近的 commit id
# Latest Commit ID
alias glci="git log --oneline | head -1 | awk -F ' ' '{ print \$1 }'"

##############
# DEPRECATED #
##############

## Git Experimental
function args {
    echo \$?=$?
    echo \$#=$#
    echo \$@=$@
    echo \$*=$*
    echo \$0=$0
    echo \$1=$1
    echo \$2=$2
    echo \$3=$3
    echo \$4=$4
    echo \$5=$5
}

# Git Commit Message from Clipboard
function gcmc {
    if [[ $1 == "" ]]; then
        echo && echo custom text for git 404!
        return
    fi

    export clipboard=`pbpaste`
    echo

    echo \$ git add $clipboard
    ga $clipboard
    gs
    echo

    echo \$ git commit -m \"$1\"
    gcm "$1"
}

# Git Commit Message with Prefix
function gcmp {
    if [[ $1 == "" ]]; then
        echo && echo verb prefix for git 404!
        return
    fi

    gcmc "$1 `pbpaste`"
}

alias gadd="gcmp Add"
alias gupd="gcmp Update"
alias gfix="gcmp Fix"
alias gimp="gcmp Improve"
alias gref="gcmp Refactor"
alias grem="gcmp Remove"
alias grvt="gcmp Revert"
alias gsim="gcmp Simplify"
alias gtt="gcmp Test"
alias gdep="gcmp Deprecate"

# Git Commit Short Message with Prefix
function gcsmp {
    if [[ $1 == "" || $2 == "" ]]; then
        echo && echo verb & type prefix for git 404!
        return
    fi

    gs
    echo

    #desc=`git status -s | grep "$2  " | awk -F "[./]" '{print $(NF-1)}'`
    desc=`git status -s | grep "$2  " | awk -F "[/]" '{print $NF}'`

    cmd="git commit -m '$1 $desc'"
    echo \$ $cmd
    echo

    eval $cmd
}

alias gaddj="gcsmp Add A"
alias gupdj="gcsmp Update M"
alias gfixj="gcsmp Fix M"
alias gimpj="gcsmp Improve M"
alias gmovj="gcsmp Move R"
alias grenj="gcsmp Rename R"
alias grefj="gcsmp Refactor M"
alias gremj="gcsmp Remove D"
alias gsimj="gcsmp Simplify M"
alias gttj="gcsmp Test M"
alias gdepj="gcsmp Deprecate M"
alias gfmtj="gcsmp Format M"

function gren {
    gs
    echo

    desc=`git status -s | grep "R  " | awk -F "R  " '{ print $2 }'`

    cmd="git commit -m 'Rename $desc'"
    echo \$ $cmd
    echo

    eval $cmd
}

function gmov {
    gs
    echo

    desc=`git status -s | grep "R  " | awk -F "R  " '{ print $2 }'`

    cmd="git commit -m 'Move $desc'"
    echo \$ $cmd
    echo

    eval $cmd
}

function iCmd {
    local cmd=$1
    echo -e "\n\$ $cmd"
    eval $cmd
}

# 特性分支快速 rebase 主分支的短命令
# Other branch ReBase Master branch
function orbm {
    iCmd "git stash"
    iCmd "git checkout master"
    iCmd "git pull"
    iCmd "git checkout -"
    iCmd "git rebase master"
    # 按需取用
    # iCmd "git stash pop" 
    echo
}

# 将特性分支最新的提交添加到测试分支中
# Deploy-test branch Cherry-Pick Other branch
function dcpo {
    iCmd "git stash"

    echo -e "\n\$ git log --oneline | head -1 | awk -F ' ' '{ print \$1 }'"
    latestCommitId=`git log --oneline | head -1 | awk -F ' ' '{ print \$1 }'`
    echo -e "latestCommitId = $latestCommitId"

    iCmd "git checkout deploy-test"
    iCmd "git pull"
    iCmd "git cherry-pick $latestCommitId"
    echo
}

# 展示 main 和 master 之外的分支
# Git Other Branch
alias gob="git branch -l | grep -E -v 'main|master'"

# 拷贝除 main 和 master 之外的第一个分支的名称
# Git Other Branch Name Copy
alias gobc="git branch -l | grep -E -v 'main|master' | head -1 | tr -d ' \n' | pbcopy"

# 切换到除 main 和 mater 之外的第一个分支的名称
# Git Checkout Other Branch
alias gcoo="git checkout \`git branch -l | grep -E -v 'main|master' | head -1 | tr -d ' \n'\`"

# Git Update JS Project
function gujp {
    iCmd "git fetch -ap" && \
    iCmd "git add --all && git stash" && \
    iCmd "git checkout master && git pull" && \
    iCmd "git checkout - && git pull" && \
    iCmd "pnpm i" && \
    iCmd "git stash pop"
}
