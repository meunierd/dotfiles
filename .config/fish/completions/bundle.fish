function __fish_bundle_binstubs
    mkdir -p $HOME/.cache/bundle_binstubs/fetch_head

    set -l pwd_hash (pwd | md5)
    set -l cache_dir "$HOME/.cache/bundle_binstubs/completions/$pwd_hash"
    set -l fetch_head "$HOME/.cache/bundle_binstubs/fetch_head/$pwd_hash"

    if begin not test -f $fetch_head; or test (cat .git/FETCH_HEAD | md5) != (cat $fetch_head); end
        rm -rf $cache_dir
        mkdir -p $cache_dir
        bundle install --binstubs=$cache_dir --quiet
        cat .git/FETCH_HEAD | md5 > $fetch_head
    end
    ls "$cache_dir"
end

function __fish_bundle_gems
    bundle list | grep '  \*' | awk '{ print $2 }'
end

complete -c bundle -n '__fish_use_subcommands exec' -x -a '(__fish_bundle_binstubs)'

complete -c bundle -n '__fish_use_subcommand' -x -a 'install' -d 'Install the gems specified by the Gemfile or Gemfile.lock'
complete -c bundle -n '__fish_use_subcommand' -x -a 'update' -d 'Update dependencies to their latest versions'
complete -c bundle -n '__fish_use_subcommand' -x -a 'package' -d 'Package the .gem files required by your application into the vendor/cache directory'
complete -c bundle -n '__fish_use_subcommand' -x -a 'exec' -d 'Execute a script in the context of the current bundle'
complete -c bundle -n '__fish_use_subcommand' -x -a 'config' -d 'Specify and read configuration options for bundler'
complete -c bundle -n '__fish_use_subcommand' -x -a 'help' -d 'Displays detailed help for each subcommand'
complete -c bundle -n '__fish_use_subcommand' -x -a 'check' -d 'Determine whether the requirements for your application are installed and available to bundler'
complete -c bundle -n '__fish_use_subcommand' -x -a 'list' -d 'Show all of the gems in the current bundle'
complete -c bundle -n '__fish_use_subcommand' -x -a 'show' -d 'Show the source location of a particular gem in the bundle'
complete -c bundle -n '__fish_use_subcommand' -x -a 'outdated' -d 'Show all of the outdated gems in the current bundle'
complete -c bundle -n '__fish_use_subcommand' -x -a 'console' -d 'Start an IRB session in the context of the current bundle'
complete -c bundle -n '__fish_use_subcommand' -x -a 'open' -d 'Open an installed gem in the editor'
complete -c bundle -n '__fish_use_subcommand' -x -a 'lock' -d 'Generate a lockfile for your dependencies'
complete -c bundle -n '__fish_use_subcommand' -x -a 'viz' -d 'Generate a visual representation of your dependencies'
complete -c bundle -n '__fish_use_subcommand' -x -a 'init' -d 'Generate a simple Gemfile, placed in the current directory'
complete -c bundle -n '__fish_use_subcommand' -x -a 'clean' -d 'Cleans up unused gems in your bundler directory'

complete -c bundle -n '__fish_use_subcommands update' -x -a '(__fish_bundle_gems)'
complete -c bundle -n '__fish_use_subcommands show' -x -a '(__fish_bundle_gems)'
complete -c bundle -n '__fish_use_subcommands open' -x -a '(__fish_bundle_gems)'
