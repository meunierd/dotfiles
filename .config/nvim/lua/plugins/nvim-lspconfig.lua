return {
  "neovim/nvim-lspconfig",
  config = function()
    local util = require 'lspconfig.util'
    local lspconfig = require 'lspconfig'

    lspconfig.sorbet.setup{
      cmd = {"bundle", "exec", "srb", "tc", "--lsp"},
      root_dir = util.root_pattern("sorbet")
    }
  end
}
