function __fish_use_subcommands
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
