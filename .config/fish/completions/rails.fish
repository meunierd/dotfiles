function __fish_rails_generators
    mkdir -p $HOME/.cache/rails_generators/completions
    mkdir -p $HOME/.cache/rails_generators/fetch_head

    set -l pwd_hash (pwd | md5)
    set -l cache_file "$HOME/.cache/rails_generators/completions/$pwd_hash"
    set -l fetch_head "$HOME/.cache/rails_generators/fetch_head/$pwd_hash"

    if begin not test -f $fetch_head; or test (cat .git/FETCH_HEAD | md5) != (cat $fetch_head); end
        rails generate --help | egrep '^\s+\w' | awk '{ print $1 }' > "$cache_file"
        cat .git/FETCH_HEAD | md5 > $fetch_head
    end
    cat "$cache_file"
end

complete -c rails -n '__fish_use_subcommand' -x -a 'generate' -d 'Generate new code'
complete -c rails -n '__fish_use_subcommand' -x -a 'console' -d 'Start the Rails console'
complete -c rails -n '__fish_use_subcommand' -x -a 'server' -d 'Start the Rails server'
complete -c rails -n '__fish_use_subcommand' -x -a 'server' -d 'Start the Rails server'
complete -c rails -n '__fish_use_subcommand' -x -a 'dbconsole' -d 'Start a console for the database specified in config/database.yml'
complete -c rails -n '__fish_use_subcommands generate' -x -a '(__fish_rails_generators)'
