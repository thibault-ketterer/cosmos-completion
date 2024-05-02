
_generate_cosmos_completions() {
    local cur prev opts program
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    program="${COMP_WORDS[0]}" # Use the program name dynamically

    # Identify the command or sub-command being used
    local command=""
    local subcommand=""
    local subsubcommand=""
    for ((i=1; i < COMP_CWORD; i++)); do
        if [[ "${COMP_WORDS[i]}" != -* ]]; then
            if [[ -z "$command" ]]; then
                command="${COMP_WORDS[i]}"
            else
                if [[ -z "$subcommand" ]];then
                    subcommand="${COMP_WORDS[i]}"
                else
                    subsubcommand="${COMP_WORDS[i]}"
                    break
                fi
            fi
        fi
    done

    # Fetch and parse options based on the current context
    if [[ -n "$subsubcommand" ]]; then
        opts="$("${program}" $command $subcommand $subsubcommand --help 2>/dev/null | awk '/Commands:/,/^$/ {if (!/:/ && !/^$/ && $1) print $1}')"
        opts+=" $("${program}" $command $subcommand $subsubcommand --help 2>/dev/null | grep -oE '\-\-[a-zA-Z0-9\-]+' | sort -u)"
    elif [[ -n "$subcommand" ]]; then
        opts="$("${program}" $command $subcommand --help 2>/dev/null | awk '/Commands:/,/^$/ {if (!/:/ && !/^$/ && $1) print $1}')"
        opts+=" $("${program}" $command $subcommand --help 2>/dev/null | grep -oE '\-\-[a-zA-Z0-9\-]+' | sort -u)"
    elif [[ -n "$command" ]]; then
        opts="$("${program}" $command --help 2>/dev/null | awk '/Commands:/,/^$/ {if (!/:/ && !/^$/ && $1) print $1}')"
        opts+=" $("${program}" $command --help 2>/dev/null | grep -oE '\-\-[a-zA-Z0-9\-]+' | sort -u)"
    else
        opts="$("${program}" --help 2>/dev/null | awk '/Commands:/,/^$/ {if (!/:/ && !/^$/ && $1) print $1}')"
        opts+=" $("${program}" --help 2>/dev/null | grep -oE '\-\-[a-zA-Z0-9\-]+' | sort -u)"
    fi

     # Remove duplicate options
    opts=$(echo "$opts" | tr ' ' '\n' | awk '!seen[$0]++' | tr '\n' ' ')

    # Complete based on the current word
    COMPREPLY=($(compgen -W "${opts}" -- "${cur}"))
}

names=(
  namada
  namadaw
  namadan
  namadac
  entagled
  osmosisd
  lavad
  sided
)

for i in "${names[@]}"; do
	complete -F _generate_cosmos_completions "$i"

done
