
_pebble() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    
    opts=" \
    new-project \
    convert-project \
    build \
    clean \
    analyze-size \
    install \
    ping \
    list \
    rm \
    current \
    uuids \
    logs \
    repl \
    screenshot \
    coredump"

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))  
    return 0

}

complete -F _pebble pebble

