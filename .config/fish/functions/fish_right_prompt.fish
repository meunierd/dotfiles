# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
# set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

set __fish_git_prompt_char_stateseparator ''

set __fish_git_prompt_char_dirtystate '*'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'
set __fish_git_prompt_char_upstream_equal ''

function fish_right_prompt
    set last_status $status
    # set_color $fish_color_cwd
    printf '%s' (prompt_pwd)
    printf '%s ' (__fish_git_prompt ":%s")
    if test $last_status -ne 0
        set_color red
        printf " "$last_status
    end
    set_color normal
end
