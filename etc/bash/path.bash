#!/bin/bash

# Append function that avoid duplicate PATH directories

function path.dirs.safe_append
{
    local new_dir="$1";
    local new_dir_desc="$2";

    local new_path=`dirlist.safe_append $new_dir $PATH`;
    export PATH="$new_path";
    return 0;
}

# Prepend function that avoid duplicate PATH directories

function path.dirs.safe_prepend
{
    local new_dir="$1";
    local new_dir_desc="$2";

    local new_path=`dirlist.safe_prepend $new_dir $PATH`;
    export PATH="$new_path";
    return 0
}

# Remove directory from path, if it exists.

function path.dirs.remove
{
    local new_dir="$1";
    local new_dir_desc="$2";    
    local new_path=`dirlist.remove $new_dir $PATH`;
    export PATH="$new_path";
    return 0
}

# add the custom user-env bin to the path
path.dirs.safe_prepend USER_ENV_BIN
