#########
# Proxy #
#########

function ss() {
    #env | grep ALL_PROXY
    env | grep "_proxy=" || echo "No proxy."
}

function sss() {
    export all_proxy=socks5://127.0.0.1:1081
    export http_proxy=http://127.0.0.1:7890;
    export https_proxy=http://127.0.0.1:7890;
    ss
}

function uss() {
    unset all_proxy
    unset http_proxy;
    unset https_proxy;
    ss
}
