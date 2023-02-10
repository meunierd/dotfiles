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
    treesitter = {
      ensure_installed = {"ruby", "lua"},
    },
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      config.debug = true
      config.sources = {
        null_ls.builtins.diagnostics.rubocop.with({
          command = "bin/rubocop",
          timeout = 20000,
          async = true,
        }),
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
    vim.api.nvim_set_keymap("n", "<Leader>Tf", ":TestFile<CR>", { desc = "Test File"})
    vim.api.nvim_set_keymap("n", "<Leader>Tn", ":TestNearest<CR>", { desc = "Test Nearest" })
    vim.api.nvim_set_keymap("n", "<Leader>Tl", ":TestLast<CR>", { desc = "Test Last"})
    vim.api.nvim_set_keymap("n", "<Leader>fs", ":lua require'telescope.builtin'.grep_string{}<CR>", { desc = "Search under cursor"})

    local wk = require("which-key")
    wk.register({
      ["<leader>"] = {
        T = { name = "Test" }
      }
    })
  end
}
