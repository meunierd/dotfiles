function __fish_rake_tasks
    mkdir -p $HOME/.cache/rake_completions/completions
    mkdir -p $HOME/.cache/rake_completions/fetch_head

    set -l pwd_hash (pwd | md5)
    set -l cache_file "$HOME/.cache/rake_completions/completions/$pwd_hash"
    set -l fetch_head "$HOME/.cache/rake_completions/fetch_head/$pwd_hash"

    if begin not test -f $fetch_head; or test (cat .git/FETCH_HEAD | md5) != (cat $fetch_head); end
        bundle exec rake -T 2>&1 | awk '{ print $2 }' > "$cache_file"
        cat .git/FETCH_HEAD | md5 > $fetch_head
    end
    cat "$cache_file"
end

function __fish_bundle_subcommands
    set -l cmd (commandline -poc)
    set -e cmd[1]
    if test (count $argv) != (count $cmd)
        return 1
    end
    while test -n "$cmd"
        if test $cmd[1] != $argv[1]
            return 1
        end
        set -e cmd[1]
        set -e argv[1]
    end
    return 0
end

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

function __fish_rails_generators
    mkdir -p $HOME/.cache/rails_generators/completions
    mkdir -p $HOME/.cache/rails_generators/fetch_head

    set -l pwd_hash (pwd | md5)
    set -l cache_file "$HOME/.cache/rails_generators/completions/$pwd_hash"
    set -l fetch_head "$HOME/.cache/rails_generators/fetch_head/$pwd_hash"

    if begin not test -f $fetch_head; or test (cat .git/FETCH_HEAD | md5) != (cat $fetch_head); end
        bundle exec rails generate --help | egrep '^\s+\w' | awk '{ print $1 }' > "$cache_file"
        cat .git/FETCH_HEAD | md5 > $fetch_head
    end
    cat "$cache_file"
end


complete -c bundle -n '__fish_bundle_subcommands exec rake' -x -a '(__fish_rake_tasks)'
complete -c bundle -n '__fish_bundle_subcommands exec' -x -a '(__fish_bundle_binstubs)'
complete -c bundle -n '__fish_bundle_subcommands exec rails' -x -a 'generate' -d 'Generate new code'
complete -c bundle -n '__fish_bundle_subcommands exec rails' -x -a 'console' -d 'Start the Rails console'
complete -c bundle -n '__fish_bundle_subcommands exec rails' -x -a 'server' -d 'Start the Rails server'
complete -c bundle -n '__fish_bundle_subcommands exec rails' -x -a 'server' -d 'Start the Rails server'
complete -c bundle -n '__fish_bundle_subcommands exec rails' -x -a 'dbconsole' -d 'Start a console for the database specified in config/database.yml'
complete -c bundle -n '__fish_bundle_subcommands exec rails generate' -x -a '(__fish_rails_generators)'
