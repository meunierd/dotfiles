# status --is-interactive; and source (pyenv init -|psub)
fish_vi_key_bindings

set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x EDITOR nvim
set -x GOPATH $HOME
set -x QUOTING_STYLE literal
starship init fish | source

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source; and pyenv virtualenv-init - | source
