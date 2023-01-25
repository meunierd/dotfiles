return {
  lsp = {
    servers = {
      "sorbet"
    },
    formatting = {
      format_on_save = true,
      async = true,
    }
  },
  plugins = {
    init = {
      { "tpope/vim-endwise" },
      { "vim-test/vim-test" },
      { "catppuccin/nvim" },
    },
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      config.debug = true
      config.sources = {
        null_ls.builtins.formatting.rubocop.with({
          command = "bin/rubocop",
          timeout = 20000,
          async = true,
        }),
      }
      return config
    end,
  },
  polish = function()
    vim.g['test#strategy'] = 'toggleterm'
    vim.cmd.colorscheme 'catppuccin-frappe'
  end
}
