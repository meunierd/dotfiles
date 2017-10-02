# Cask

function __fish_brew_services_started
  brew services list | awk '/started/ { print $1 }'
end

function __fish_brew_services_stopped
  brew services list | awk '/stopped/ { print $1 }'
end

complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'audit' -d 'verifies installability of Casks'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'cat' -d 'dump raw source of the given Cask to the standard output'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'cleanup' -d 'cleans up cached downloads and tracker symlinks'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'create' -d 'creates the given Cask and opens it in an editor'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'doctor' -d 'checks for configuration issues'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'edit' -d 'edits the given Cask'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'fetch' -d 'downloads remote application files to local cache'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'home' -d 'opens the homepage of the given Cask'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'info' -d 'displays information about the given Cask'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'install' -d 'installs the given Cask'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'list' -d 'with no args, lists the installed Casks; given installed Casks, lists staged files'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'search' -d 'searches all known Casks'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'style' -d 'checks Cask style using RuboCop'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'uninstall' -d 'uninstalls the given Cask'
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'update' -d 'a synonym for \'brew update\''
complete -c brew -n '__fish_seen_subcommand_from cask' -x -a 'zap' -d 'zaps all files associated with the given Cask'

complete -c brew -n '__fish_seen_subcommand_from cask uninstall' -x -a '(brew cask list)'
complete -c brew -n '__fish_seen_subcommand_from cask zap' -x -a '(brew cask list)'
complete -c brew -n '__fish_seen_subcommand_from cask install' -x -a '(brew cask search)'
complete -c brew -n '__fish_seen_subcommand_from cask info' -x -a '(brew cask search)'

complete -c brew -n '__fish_seen_subcommand_from services' -x -a 'list' -d 'List all services managed by `brew services`'
complete -c brew -n '__fish_seen_subcommand_from services' -x -a 'cleanup' -d 'Get rid of state services and unused plists'
complete -c brew -n '__fish_seen_subcommand_from services' -x -a 'restart' -d 'Gracefully restart service(s)'
complete -c brew -n '__fish_seen_subcommand_from services' -x -a 'start' -d 'Start service(s)'
complete -c brew -n '__fish_seen_subcommand_from services' -x -a 'stop' -d 'Stop service(s)'

complete -c brew -n '__fish_seen_subcommand_from install' -x -a '(brew search)'
complete -c brew -n '__fish_seen_subcommand_from uninstall' -x -a '(brew list)'
complete -c brew -n '__fish_seen_subcommand_from services start' -x -a '(__fish_brew_services_stopped)'
complete -c brew -n '__fish_seen_subcommand_from services stop' -x -a '(__fish_brew_services_started)'
