########
# Tmux #
########

alias t='tmux'
alias tn='tmux new-session -s'

alias tch="tmux split-window -h -c '#{pane_current_path}'"
alias tcv="tmux split-window -v -c '#{pane_current_path}'"

function tw {
    cd ~/Documents/lib

    # ICEHE
    tmux new -s icehe -d
    
    # init
    tmux rename-window -t 'icehe:1' init
    tmux send -t 'icehe:lib' 'cd ~' Enter

    # LIB
    tmux new-window -a -t icehe -n lib -c ~/Documents/lib
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'nohup npx docsify serve -p 3100 . &' Enter
    tmux send -t 'icehe:lib' 'clear' Enter
    tmux split-window -t 'icehe:lib' -c ~/Documents/lib/_private
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'clear' Enter

    # JS
    tmux neww -a -t icehe -n js -c ~/Documents/js
    tmux send -t 'icehe:js' 'git pull' Enter
    tmux send -t 'icehe:js' 'clear' Enter

    # ANDROID
    tmux neww -a -t icehe -n android -c ~/Documents/kotlin/android
    tmux send -t 'icehe:android' 'git pull' Enter
    tmux send -t 'icehe:android' 'clear' Enter

    # LOGTO
    tmux neww -a -t icehe -n logto -c ~/Documents/logto
    tmux send -t 'icehe:logto' 'git pull' Enter
    tmux send -t 'icehe:logto' 'clear' Enter

    # PLAYGROUND
    tmux neww -a -t icehe -n playground -c ~/Documents/playground
    tmux send -t 'icehe:playground' 'git pull' Enter
    tmux send -t 'icehe:playground' 'clear' Enter

    # HOME
    tmux neww -a -t icehe -n home -c ~
    tmux send -t 'icehe:home' 'brew update && brew upgrade' Enter
    tmux send -t 'icehe:home' 'clear' Enter
    tmux split-window -t 'icehe:home' -c ~
    tmux send -t 'icehe:home' 'clear' Enter

    # clean-up
    tmux send -t 'icehe:init' 'exit' Enter
    tmux select-window -t 'icehe:lib'

    tmux
}
