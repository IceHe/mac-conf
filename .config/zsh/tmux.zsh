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

# tmux restart window ( for new `.zshrc` config )
function trw {
    tmux rename-window 'tmp_tmux_win'
    tmp_tmux_prev_win_num=$(tmux display-message -p '#I')

    tmux new-window -c "$(pwd)"
    tmp_tmux_cur_win_num=$(tmux display-message -p '#I')

    tmux swap-window -s $tmp_tmux_cur_win_num -t $tmp_tmux_prev_win_num
    tmux kill-window -t 'tmp_tmux_win'
}
