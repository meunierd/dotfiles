complete -c python -n '__fish_use_subcommands setup.py' -x -a 'build' \
  -d 'Build everything you need to install'
complete -c python -n '__fish_use_subcommands setup.py' -x -a 'install' \
  -d 'install everything from the build directory'
complete -c python -n '__fish_use_subcommands setup.py' -x -a 'register' \
  -d 'register the distribution with the Python package index'
complete -c python -n '__fish_use_subcommands setup.py' -x -a 'sdist' \
  -d 'create a source distribution (tarball, zip file, etc.)'
complete -c python -n '__fish_use_subcommands setup.py' -x -a 'develop' \
  -d "install package in 'development mode'"
complete -c python -n '__fish_use_subcommands setup.py' -x -a 'upload' \
  -d 'upload binary package to PyPI'
