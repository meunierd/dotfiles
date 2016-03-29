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

function __fish_bundle_exec_cmd
    commandline -pc | egrep "^bundle\s+exec\s+$argv\s+\$"
    return $status
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


complete -c bundle -n '__fish_bundle_exec_cmd rake' -x -a '(__fish_rake_tasks)'
complete -c bundle -n '__fish_seen_subcommand_from exec' -x -a '(__fish_bundle_binstubs)'
