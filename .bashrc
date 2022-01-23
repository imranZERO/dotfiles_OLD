alias ls='ls -lah'
alias cc='gcc'
alias cls='clear'
alias vi='vim'

set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

shopt -s autocd
