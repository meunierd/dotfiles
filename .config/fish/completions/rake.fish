function __fish_rake_tasks
    mkdir -p $HOME/.cache/rake_completions/completions
    mkdir -p $HOME/.cache/rake_completions/fetch_head

    set -l pwd_hash (pwd | md5)
    set -l cache_file "$HOME/.cache/rake_completions/completions/$pwd_hash"
    set -l fetch_head "$HOME/.cache/rake_completions/fetch_head/$pwd_hash"

    if begin not test -f $fetch_head; or test (cat .git/FETCH_HEAD | md5) != (cat $fetch_head); end
        rake -P 2>&1 | grep '^rake' | awk '{ print $2 }' > "$cache_file"
        cat .git/FETCH_HEAD | md5 > $fetch_head
    end
    cat "$cache_file"
end

complete -c rake -n '__fish_use_subcommand' -x -a '(__fish_rake_tasks)'
