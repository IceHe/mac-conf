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

    # CS1
    tmux new-window -a -t icehe -n cs1 -c ~/Documents/conan-commerce-shipment
    tmux send -t 'icehe:cs1' 'git pull' Enter
    tmux send -t 'icehe:cs1' 'clear' Enter

    # CS2
    tmux new-window -a -t icehe -n cs2 -c ~/Documents/another/conan-commerce-shipment
    tmux send -t 'icehe:cs2' 'git pull' Enter
    tmux send -t 'icehe:cs2' 'clear' Enter

    # CS2
    tmux new-window -a -t icehe -n cs3 -c ~/Documents/yet-another/conan-commerce-shipment
    tmux send -t 'icehe:cs3' 'git pull' Enter
    tmux send -t 'icehe:cs3' 'clear' Enter

    # Desktop
    tmux new-window -a -t icehe -n desktop -c ~/Desktop
    tmux send -t 'icehe:desktop' 'git pull' Enter
    tmux send -t 'icehe:desktop' 'clear' Enter
    tmux split-window -t 'icehe:desktop' -c ~/Desktop
    #tmux send -t 'icehe:desktop' 'tmux split-window -h' Enter
    tmux send -t 'icehe:desktop' 'clear' Enter

    # LIB
    tmux new-window -a -t icehe -n lib -c ~/Documents/lib
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'nohup docsify serve . &' Enter
    tmux send -t 'icehe:lib' 'clear' Enter
    tmux split-window -t 'icehe:lib' -c ~/Documents/lib/_private
    tmux send -t 'icehe:lib' 'git pull' Enter
    tmux send -t 'icehe:lib' 'clear' Enter

    # HOME
    tmux neww -a -t icehe -n home -c ~
    tmux send -t 'icehe:home' 'brew update && brew upgrade' Enter
    tmux send -t 'icehe:home' 'clear' Enter

    # Docsify
    #tmux neww -a -t icehe -n docsify -c ~/Documents/lib
    #tmux send -t 'icehe:docsify' 'docsify serve .' Enter

    # clean-up
    tmux send -t 'icehe:init' 'exit' Enter
    tmux select-window -t 'icehe:cs1'

    tmux
}
