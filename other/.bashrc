alias ls='ls -lah'
alias cls='clear'
alias v='vim'
alias vi='vim'
alias gc='git clone --depth=1'

TERM=xterm-256color

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

shopt -s autocd

f() {
    # Run command/application and choose paths/files with fzf.
    # Always return control of the terminal to user (e.g. when opening GUIs).
    # The full command that was used will appear in your history just like any
    # other (N.B. to achieve this I write the shell's active history to
    # ~/.bash_history)
    # Usage:
    # f cd [OPTION]... (hit enter, choose path)
    # f vim [OPTION]... (hit enter, choose files)

    # Store the program
    program="$1"

    # Remove first argument off the list
    shift

    # Store option flags with separating spaces, or just set as single space
    options="$@"
    if [ -z "${options}" ]; then
        options=" "
    else
        options=" $options "
    fi

    # Store the arguments from fzf
    arguments=($(fzf --multi))

    # If no arguments passed (e.g. if Esc pressed), return to terminal
    if [ -z "${arguments}" ]; then
        return 1
    fi

    # We want the command to show up in our bash history, so write the shell's
    # active history to ~/.bash_history. Then we'll also add the command from
    # fzf, then we'll load it all back into the shell's active history
    history -w

    # ADD A REPEATABLE COMMAND TO THE BASH HISTORY ############################
    # Store the arguments in a temporary file for sanitising before being
    # entered into bash history
    : > /tmp/fzf_tmp
    for file in "${arguments[@]}"; do
        echo "$file" >> /tmp/fzf_tmp
    done

    # Put all input arguments on one line and sanitise the command by putting
    # single quotes around each argument, also first put an extra single quote
    # next to any pre-existing single quotes in the raw argument
    sed -i "s/'/''/g; s/.*/'&'/g; s/\n//g" /tmp/fzf_tmp

    # If the program is on the GUI list, add a '&' to the command history
    if [[ "$program" =~ ^(nautilus|zathura|evince|vlc|eog|kolourpaint)$ ]]; then
        sed -i '${s/$/ \&/}' /tmp/fzf_tmp
    fi

    # Grab the sanitised arguments
    arguments="$(cat /tmp/fzf_tmp)"

    # Add the command with the sanitised arguments to our .bash_history
    echo $program$options$arguments >> ~/.bash_history

    # Reload the ~/.bash_history into the shell's active history
    history -r

    # EXECUTE THE LAST COMMAND IN ~/.bash_history #############################
    fc -s -1
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
