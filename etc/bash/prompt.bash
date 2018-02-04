#!/bin/bash

function prompt.baroque {
    PS1="\[\033[38;5;1m\]\$\[$(tput sgr0)\]\[\033[38;5;31m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\[$(tput sgr0)\]\[\033[38;5;70m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;9m\]\$(date +%I:%M%P)\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;3m\]\$(date +%m/%d/%y)\[$(tput sgr0)\]\[\033[38;5;1m\]#\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\][\[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;1m\]]\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
}

function prompt.simple {
    PS1="\[\033[38;5;1m\]\$\[$(tput sgr0)\]\[\033[38;5;38m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;77m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
}

function prompt.showdir {
    PS1="\[\033[38;5;1m\]\$\[$(tput sgr0)\]\[\033[38;5;38m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;77m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
}

function prompt.gray {
    PS1="\[\033[38;5;1m\]\$\[$(tput sgr0)\]\[\033[38;5;7m\]\u@\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;1m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
}

function prompt.nocolor {
    PS1="\$\u@\h > \[$(tput sgr0)\]"
}

function prompt.anonymous {
    PS1="\$>\[$(tput sgr0)\]"
}

function prompt.gitdir {
    local gitbranch='$(parse_git_branch)';
    PS1="\[\033[38;5;1m\]\$\[$(tput sgr0)\]\[\033[38;5;38m\]\u\[$(tput sgr0)\]\[\033[38;5;7m\]@\[$(tput sgr0)\]\[\033[38;5;77m\]\h\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;7m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;69m\]$gitbranch\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\[\033[38;5;1m\]>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
}

# prompt selection
prompt.gitdir
