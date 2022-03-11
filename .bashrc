alias ls='ls -lah'
alias cls='clear'
alias vi='vim'
alias gc='git clone --depth 1'

TERM=xterm-256color

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

shopt -s autocd
