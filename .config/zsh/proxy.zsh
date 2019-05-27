#########
# Proxy #
#########

function ss() {
    #env | grep ALL_PROXY
    env | grep "_proxy=" || echo "No proxy."
}

function sss() {
    #export ALL_PROXY=socks5://127.0.0.1:1081
    export http_proxy=http://127.0.0.1:1083;
    export https_proxy=http://127.0.0.1:1083;
    ss
}

function uss() {
    #unset ALL_PROXY
    unset http_proxy;
    unset https_proxy;
    ss
}
