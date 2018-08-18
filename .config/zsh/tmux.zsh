########
# Tmux #
########

alias t='tmux'
alias tn='tmux new-session -s'

alias tch="tmux split-window -h -c '#{pane_current_path}'"
alias tcv="tmux split-window -v -c '#{pane_current_path}'"

# tmux restart window ( for new `.zshrc` config )
function trw {
    tmux rename-window 'tmp_tmux_win'
    tmp_tmux_prev_win_num=$(tmux display-message -p '#I')

    tmux new-window -c "$(pwd)"
    tmp_tmux_cur_win_num=$(tmux display-message -p '#I')
    
    tmux swap-window -s $tmp_tmux_cur_win_num -t $tmp_tmux_prev_win_num
    tmux kill-window -t 'tmp_tmux_win'
}

