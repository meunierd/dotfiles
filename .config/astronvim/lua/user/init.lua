vim.g['test#strategy'] = 'toggleterm'

return {
  lsp = {
    servers = {
      "sorbet"
    }
  },
  plugins = {
    init = {
      { "tpope/vim-endwise" },
      { "vim-test/vim-test" }
    }
  }
}
