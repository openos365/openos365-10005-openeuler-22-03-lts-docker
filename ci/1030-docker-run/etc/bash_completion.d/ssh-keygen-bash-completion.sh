# ssh-keygen(1) completion                                 -*- shell-script -*-

_ssh_keygen()
{
    local cur prev words cword
    _init_completion -n = || return

    case $prev in
        -*[abCIJjMNnrPSVWz])
            return
            ;;
        -*E)
            COMPREPLY=( $(compgen -W 'md5 sha256' -- "$cur") )
            return
            ;;
        -*[FR])
            # TODO: trim this down to actual entries in known hosts files
            _known_hosts_real -- "$cur"
            return
            ;;
        -*D)
            _filedir so
            return
            ;;
        -*[fGKsT])
            _filedir
            return
            ;;
        -*m)
            COMPREPLY=( $(compgen -W 'PEM PKCS8 RFC4716' -- "$cur") )
            return
            ;;
        -*O)
            if [[ $cur != *=* ]]; then
                COMPREPLY=( $(compgen -W 'clear force-command=
                    no-agent-forwarding no-port-forwarding no-pty no-user-rc
                    no-x11-forwarding permit-agent-forwarding
                    permit-port-forwarding permit-pty permit-user-rc
                    permit-x11-forwarding source-address=' -- "$cur") )
                [[ $COMPREPLY == *= ]] && compopt -o nospace
            fi
            return
            ;;
        -*t)
            local protocols=$(_xfunc ssh _ssh_query "$1" protocol-version)
            local types='dsa ecdsa ed25519 rsa sm2'
            if [[ $protocols == *1* ]]; then
                types+=' rsa1'
            fi
            COMPREPLY=( $(compgen -W "$types" -- "$cur") )
            return
            ;;
    esac

    if [[ $cur == -* ]]; then
        local opts=$(_parse_usage "$1" "-?")
        [[ -z "$opts" ]] && opts=$(_parse_help "$1" "-?")  # OpenSSH < 7
        COMPREPLY=( $(compgen -W "$opts" -- "$cur") )
    fi
} &&
complete -F _ssh_keygen ssh-keygen

# ex: filetype=sh
