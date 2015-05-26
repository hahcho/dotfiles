create_session() {
    local session=`screen -list | grep -P '^\s*\d+\.app-manager\s+\(Detached\)$'`
    if [ -z "$session" ]; then
        screen -dmS app-manager
    fi
}

app-list() {
    create_session
    screen -r app-manager -p =
}

app-start() {
    create_session
    screen -r app-manager -X screen $@
    local windows=`screen -r app-manager -Q windows`
    local max_window_number=`echo $windows|grep -oP '\d+'|sort -rn|head -n1`
    screen -r app-manager -p $max_window_number
}
