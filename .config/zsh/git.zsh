#######
# Git #
#######

alias gcf='git config'
alias gcfl='git config -l'
alias gcfe='git config -e'

alias gcm='git commit -m'

alias gcom='git checkout master'

alias gdc='git diff --cached'
alias gdwc='git diff --word-diff --cached'

alias gfap='git fetch -ap'

alias ggr='git grep'

alias gi='git init'

alias glf='git ls-files'

alias glm='git pull main'
alias glmm='git pull main master'

alias gls='git ls-files'

alias gmom='git merge origin/master'

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

function gcmp {
    if [[ $1 == "" ]]; then
        echo && echo verb prefix for git 404!
        return
    fi

    gcmc "$1 `pbpaste`"
}

alias gadd="gcmp Add"
alias gupd="gcmp Update"
alias gmov="gcmp Move"
alias gfix="gcmp Fix"
alias gimp="gcmp Improve"
alias gref="gcmp Refactor"
alias grem="gcmp Remove"
alias grvt="gcmp Revert"
alias gsim="gcmp Simplify"
alias gtt="gcmp Test"

function ggi {
    echo '.gitignore' | pb
    gupd
}

function gidx {
    echo 'index.html' | pb
    gupd
}

function grdm {
    echo 'README.md' | pb
    gupd
}

function gren {
    gs
    echo

    desc=`git status -s | grep "R  " | awk -F "R  " '{ print $2 }'`

    tmp_cmd="git commit -m 'Rename $desc'"
    echo \$ $tmp_cmd
    echo

    eval $tmp_cmd
}

function gkm {
    /Users/IceHe/.config/
    gr
    ga "Keyboard Maestro Macros.kmsync"
    gcm "Update configs of Keyboard Maestro"
    -
}

function gzs {
    /Users/IceHe/
    gr
    echo '.zshrc' | pb
    gupd
    -
}

function gvc {
    /Users/IceHe/
    gr
    echo '.config/vscode/settings.json' | pb
    gupd
    -
}

function gkr {
    /Users/IceHe/
    gr
    echo '.config/karabiner/karabiner.json' | pb
    gupd
    -
}

