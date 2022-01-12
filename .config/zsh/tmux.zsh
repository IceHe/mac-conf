########
# Tmux #
########

alias t='tmux'
alias tn='tmux new-session -s'

alias tch="tmux split-window -h -c '#{pane_current_path}'"
alias tcv="tmux split-window -v -c '#{pane_current_path}'"

function tw {
    cd ~/Projects/lib

    # ICEHE
    tmux new -s icehe -d

    # init
    tmux rename-window -t 'icehe:1' init
    tmux send -t 'icehe:init' 'cd ~' Enter

    # JS
    tmux neww -a -t icehe -n js -c ~/Projects/js
    tmux send -t 'icehe:js' 'git pull' Enter
    tmux send -t 'icehe:js' 'clear' Enter
    tmux split-window -t 'icehe:js' -c ~/Projects/js/packages/js
    tmux send -t 'icehe:js' 'clear' Enter

    ## JS / client
    #tmux neww -a -t icehe -n client -c ~/Projects/js/packages/client
    #tmux send -t 'icehe:client' 'clear' Enter

    ## JS / playground
    #tmux neww -a -t icehe -n playground -c ~/Projects/js/packages/playground
    #tmux send -t 'icehe:playground' 'clear' Enter

    ## JS / packages
    #tmux neww -a -t icehe -n js/pkgs -c ~/Projects/js/packages/client
    #tmux send -t 'icehe:js/pkgs' 'clear' Enter
    #tmux split-window -t 'icehe:js/pkgs' -c ~/Projects/js/packages/playground
    #tmux send -t 'icehe:js/pkgs' 'clear' Enter

    # KOTLIN / android
    tmux neww -a -t icehe -n kt/android -c ~/Projects/kotlin/android
    tmux send -t 'icehe:kt/android' 'git pull' Enter
    tmux send -t 'icehe:kt/android' 'clear' Enter

    # LOGTO
    tmux neww -a -t icehe -n logto -c ~/Projects/logto
    tmux send -t 'icehe:logto' 'git pull' Enter
    tmux send -t 'icehe:logto' 'clear' Enter
    tmux split-window -t 'icehe:logto' -c ~/Projects/logto/packages/core
    tmux send -t 'icehe:logto' 'clear' Enter

    # LIB
    tmux new-window -a -t icehe -n lib -c ~/Projects/lib
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'nohup npx docsify serve -p 3100 . &' Enter
    tmux send -t 'icehe:lib' 'clear' Enter
    tmux split-window -t 'icehe:lib' -c ~/Projects/lib/_private
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'clear' Enter

    # HOME
    tmux neww -a -t icehe -n home -c ~
    tmux send -t 'icehe:home' 'brew update && brew upgrade' Enter
    tmux send -t 'icehe:home' 'clear' Enter
    tmux split-window -t 'icehe:home' -c ~
    tmux send -t 'icehe:home' 'clear' Enter

    # JS
    tmux neww -a -t icehe -n js-2 -c ~/Projects/js-2
    tmux send -t 'icehe:js-2' 'git pull' Enter
    tmux send -t 'icehe:js-2' 'clear' Enter
    tmux split-window -t 'icehe:js-2' -c ~/Projects/js-2/packages/client
    tmux send -t 'icehe:js-2' 'clear' Enter

    # clean-up
    tmux send -t 'icehe:init' 'exit' Enter
    tmux select-window -t 'icehe:lib'

    tmux
}
