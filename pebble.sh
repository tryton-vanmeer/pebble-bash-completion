#!/bin/bash
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

    #
    # Complete the arguments to specific commands
    #
    case "${prev}" in
	install)
		local install_options="--phone --cloudpebble --emulator --serial --qemu"
		COMPREPLY=( $(compgen -W "${install_options}" -- ${cur}) )
		return 0
		;;
	--emulator)
		local emulator_options="aplite basalt chalk"
		COMPREPLY=( $(compgen -W "${emulator_options}" -- ${cur}) )
		return 0
		;;
	*)
	;;
    esac


    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0

}

complete -F _pebble pebble
