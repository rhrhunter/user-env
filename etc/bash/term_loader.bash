#!/bin/bash

DIR=$1

# bash script Loader
function do_load {
    local script_path=$1;
    local script_desc=$2;

    local abs_path="$DIR/$script_path";

    . "$abs_path" ;
}

# load in all bash scripts here
do_load "dirlist.bash" "Directory list operations"
do_load "path.bash" "PATH Management"
do_load "libpath.bash" "LD_LIBRARY_PATH Management"
do_load "prompt.bash" "Custom prompt"
do_load "alias.bash" "Customized aliases"
do_load "env.bash" "Environment variables"
do_load "bashsettings.bash" "Configure Bash Environment Settings"