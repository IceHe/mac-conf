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

    # lib
    tmux rename-window -t 'icehe:1' lib
    tmux send -t 'icehe:lib' 'cd ~/Documents/Lib' Enter 'git pull' Enter
    tmux split-window -t 'icehe:lib' -c ~/Documents/Lib/_private
    tmux send -t 'icehe:lib' 'git pull' Enter

    # home
    tmux neww -a -t icehe -n home -c ~
    tmux send -t 'icehe:home' 'brew update && brew upgrade' Enter

    tmux
}
