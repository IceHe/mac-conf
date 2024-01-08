########
# Tmux #
########

alias t='tmux' alias tn='tmux new-session -s'

alias tch="tmux split-window -h -c '#{pane_current_path}'"
alias tcv="tmux split-window -v -c '#{pane_current_path}'"

# Tmux Windows
function tw {

    # Prepare
    
    # ## Pull latest IceHe's mac-conf
    # echo -e "\n\$ cd ~ && git pull || return"
    # cd ~ && git pull || return

    # ## Upgrade Oh-My-Zsh!
    # echo -e "\n\$ .oh-my-zsh/tools/upgrade.sh"
    # .oh-my-zsh/tools/upgrade.sh

    ## Reload .zshrc
    echo -e "\n\$ source ~/.zshrc"
    source ~/.zshrc && echo

    ## Switch PWD to lib
    # cd ~/Projects/lib
    
    ###########################################

    # Session icehe
    tmux new -s icehe -d

    # Window init 
    tmux rename-window -t 'icehe:1' init
    tmux send -t 'icehe:init' 'cd ~' Enter

    # Java
    tmux new-window -a -t icehe -n java -c ~/Projects/java
    #tmux send -t 'icehe:java' 'git add --all && git stash && echo && git pull && git stash pop' Enter

    # # Private
    # tmux new-window -a -t icehe -n priv -c ~/Projects/lib/_private
    # #tmux send -t 'icehe:priv' 'git add --all && git stash && echo && git pull && git stash pop' Enter

    # # Lib
    # tmux new-window -a -t icehe -n lib -c ~/Projects/lib
    # #tmux send -t 'icehe:lib' 'git add --all && git stash && echo && git pull && git stash pop' Enter
    # tmux send -t 'icehe:lib' 'nohup npx docsify serve -p 3100 . &' Enter

    # Lib & Private
    tmux new-window -a -t icehe -n lib -c ~/Projects/lib
    #tmux send -t 'icehe:lib' 'git add --all && git stash && echo && git pull && git stash pop' Enter
    tmux send -t 'icehe:lib' 'nohup npx docsify serve -p 3100 . &' Enter
    tmux split-window -t 'icehe:lib' -c ~/Projects/lib/_private
    #tmux send -t 'icehe:lib' 'git pull' Enter

    # # Go
    # tmux new-window -a -t icehe -n go -c ~/Projects/go
    # #tmux send -t 'icehe:go' 'git add --all && git stash && echo && git pull && git stash pop' Enter

    # # Python
    # tmux new-window -a -t icehe -n python -c ~/Projects/python
    # #tmux send -t 'icehe:python' 'git add --all && git stash && echo && git pull && git stash pop' Enter

    # Go & Python
    tmux new-window -a -t icehe -n go_py -c ~/Projects/go
    #tmux send -t 'icehe:go_py' 'git add --all && git stash && echo && git pull && git stash pop' Enter
    tmux split-window -t 'icehe:go_py' -c ~/Projects/python
    #tmux send -t 'icehe:go_py' 'git pull' Enter

    # Home
    tmux neww -a -t icehe -n home -c ~
    tmux send -t 'icehe:home' 'brew update && brew upgrade' Enter
    tmux split-window -t 'icehe:home' -c ~

    # Clean up
    tmux send -t 'icehe:init' 'exit' Enter
    tmux select-window -t 'icehe:java'

    tmux
}
