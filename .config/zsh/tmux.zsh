########
# Tmux #
########

alias t='tmux'
alias tn='tmux new-session -s'

alias tch="tmux split-window -h -c '#{pane_current_path}'"
alias tcv="tmux split-window -v -c '#{pane_current_path}'"

function tw {
    cd ~/Documents/Lib

    # ICEHE
    tmux new -s icehe -d
    
    # init
    tmux rename-window -t 'icehe:1' init
    tmux send -t 'icehe:lib' 'cd ~' Enter

    # LIB
    tmux new-window -a -t icehe -n lib -c ~/Documents/Lib
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux split-window -t 'icehe:lib' -c ~/Documents/Lib/_private
    tmux send -t 'icehe:lib' 'git pull' Enter

    # HOME
    tmux neww -a -t icehe -n home -c ~
    tmux send -t 'icehe:home' 'brew update && brew upgrade' Enter

    # clean-up
    tmux send -t 'icehe:init' 'exit' Enter
    tmux select-window -t 'icehe:lib'

    tmux
}
