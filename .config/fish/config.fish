source ~/.config/fish/vendor/z.fish
status --is-interactive; and source (pyenv init -|psub)
source /opt/dev/dev.fish
set -e fish_greeting
fish_vi_key_bindings

set -x JAVA_HOME (/usr/libexec/java_home -v 1.8)
set -x FZF_DEFAULT_COMMAND 'rg --files --follow'
set -x HEROKU_ORGANIZATION shopify
set -x EDITOR nvim
set -x RUST_SRC_PATH ~/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/
