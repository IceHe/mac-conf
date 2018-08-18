######
# IP #
######

function wifi_ip() {
    /sbin/ifconfig en0|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function physical_ip() {
    /sbin/ifconfig en9|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function all_ip() {
    /sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d 'addr:'
}

function ip_addr() {
    if [ -n "$(physical_ip)" ]; then
        physical_ip
    elif [ -n "$(wifi_ip)" ]; then
        wifi_ip
    else
        all_ip
    fi
}

alias ip='ip_addr | tr -d "\n" | pb; ip_addr'

