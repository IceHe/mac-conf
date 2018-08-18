#########
# Proxy #
#########

function sss() {
    #export ALL_PROXY=socks5://127.0.0.1:1081
    export http_proxy=http://127.0.0.1:1083;
    export https_proxy=http://127.0.0.1:1083;
}

function uss() {
    #unset ALL_PROXY
    unset http_proxy;
    unset https_proxy;
}

#alias ss='env | grep ALL_PROXY'
alias ss='env | grep _proxy=' 

