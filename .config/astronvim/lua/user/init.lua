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
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup {}
      end,
    },
    { "vim-test/vim-test" },
  },
  polish = function()
    vim.cmd.colorscheme 'catppuccin-frappe'
    vim.g['test#strategy'] = 'toggleterm'
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
