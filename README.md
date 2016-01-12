[![Build Status](https://travis-ci.org/rhrhunter/user-env.svg?branch=master)](https://travis-ci.org/rhrhunter/user-env)

To install this user environment, simply do:

* make install

This will backup and overwrite your ~/.bashrc, ~/.bash_login, and
~/.bash_logout files. It will then transfer all the files into ~/.user-env

After installing, you probably want to customize things like aliases, environment variables, paths, and libpaths.

To add new aliases after installing, edit:

* ~/.user-env/etc/bash/alias.bash

To add new environment variables after installing, edit:

* ~/.user-env/etc/bash/env.bash

To customize entries in your PATH, edit:

* ~/.user-env/etc/bash/path.bash

To customize entries in your LD_LIBRARY_PATH, edit:

* ~/.user-env/etc/bash/libpath.bash

To uninstall and restore everything back to its original state, do:

* make uninstall

