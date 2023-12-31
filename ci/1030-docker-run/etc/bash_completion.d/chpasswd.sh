# chpasswd(8) completion                  -*- shell-script -*-

_chpasswd()
{
    local cur prev words cword split
    _init_completion -s || return

    case $prev in
        -c|--crypt)
            COMPREPLY=( $( compgen -W 'DES MD5 NONE SHA256 SHA512 SM3' \
                -- "$cur" ) )
            return
            ;;
        -s|--sha-rounds)
            return
            ;;
    esac

    $split && return

    COMPREPLY=( $( compgen -W '$( _parse_help "$1" )' -- "$cur" ) )
    [[ $COMPREPLY == *= ]] && compopt -o nospace
} &&
complete -F _chpasswd chpasswd

# ex: filetype=sh
