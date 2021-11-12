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

    # JS
    tmux neww -a -t icehe -n js -c ~/Documents/js
    tmux send -t 'icehe:js' 'git pull' Enter
    tmux send -t 'icehe:js' 'clear' Enter
    tmux split-window -t 'icehe:js' -c ~/Documents/js/packages/client
    tmux send -t 'icehe:js' 'clear' Enter

    ## JS / client
    #tmux neww -a -t icehe -n client -c ~/Documents/js/packages/client
    #tmux send -t 'icehe:client' 'clear' Enter

    ## JS / playground
    #tmux neww -a -t icehe -n playground -c ~/Documents/js/packages/playground
    #tmux send -t 'icehe:playground' 'clear' Enter

    ## JS / packages
    #tmux neww -a -t icehe -n js/pkgs -c ~/Documents/js/packages/client
    #tmux send -t 'icehe:js/pkgs' 'clear' Enter
    #tmux split-window -t 'icehe:js/pkgs' -c ~/Documents/js/packages/playground
    #tmux send -t 'icehe:js/pkgs' 'clear' Enter

    # KOTLIN / android
    tmux neww -a -t icehe -n kt/android -c ~/Documents/kotlin/android
    tmux send -t 'icehe:kt/android' 'git pull' Enter
    tmux send -t 'icehe:kt/android' 'clear' Enter

    # LOGTO
    tmux neww -a -t icehe -n logto -c ~/Documents/logto
    tmux send -t 'icehe:logto' 'git pull' Enter
    tmux send -t 'icehe:logto' 'clear' Enter
    tmux split-window -t 'icehe:logto/core' -c ~/Documents/logto/packages/core
    tmux send -t 'icehe:logto/core' 'clear' Enter

    # LIB
    tmux new-window -a -t icehe -n lib -c ~/Documents/lib
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'nohup npx docsify serve -p 3100 . &' Enter
    tmux send -t 'icehe:lib' 'clear' Enter
    tmux split-window -t 'icehe:lib' -c ~/Documents/lib/_private
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'clear' Enter

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
