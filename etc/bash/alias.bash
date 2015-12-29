#!/bin/bash

# Annoying cd typos
alias cd.="cd ."
alias cd..="cd .."

# become root
alias become_root="sudo su - root";

# Listing files in color
if [ "$TERM" != "dumb" ]; then
    # try to do a color listing
    if ls --color=always >& /dev/null; then

        # Configure it with dircolors, using sed to remove "Unknown
        # colorls variable `su'." error on unix machines.
	
        ls_colors=`dircolors -b`;

	eval "$ls_colors";
        if [ `uname` = "Linux" ]
	then
	    alias ls="ls -F --color=always"
	fi
    fi
fi
