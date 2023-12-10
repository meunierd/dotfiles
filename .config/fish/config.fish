# status --is-interactive; and source (pyenv init -|psub)
fish_vi_key_bindings

set -x FZF_DEFAULT_COMMAND 'rg --files'
set -x EDITOR nvim
set -x GOPATH $HOME
set -x QUOTING_STYLE literal
starship init fish | source

# opam configuration
source /home/meunierd/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
