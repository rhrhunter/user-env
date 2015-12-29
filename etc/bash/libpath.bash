#!/bin/bash

# Append function that avoid duplicate LD_LIBRARY_PATH directories
function libpath.dirs.safe_append
{
    local new_dir="$1";
    local new_dir_desc="$2";

    local new_path=`dirlist.safe_append $new_dir $LD_LIBRARY_PATH`;
    export LD_LIBRARY_PATH="$new_path";
    return 0
}

# Prepend function that avoid duplicate LB_LIBRARY_PATH directories
function libpath.dirs.safe_prepend
{
    local new_dir="$1";
    local new_dir_desc="$2";

    local new_path=`dirlist.safe_prepend $new_dir $LD_LIBRARY_PATH`;
    export LD_LIBRARY_PATH="$new_path";
    return 0
}

