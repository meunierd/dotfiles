return {
  "vim-test/vim-test",
  cmd = {
    "TestFile",
    "TestNearest",
    "TestLast",
  },
  config = function()
    vim.g['test#strategy'] = 'toggleterm'
    vim.api.nvim_set_keymap("n", "<Leader>Tf", ":TestFile<CR>", { desc = "Test File"})
    vim.api.nvim_set_keymap("n", "<Leader>Tn", ":TestNearest<CR>", { desc = "Test Nearest" })
    vim.api.nvim_set_keymap("n", "<Leader>Tl", ":TestLast<CR>", { desc = "Test Last"})
    vim.api.nvim_set_keymap("n", "<Leader>fs", ":lua require'telescope.builtin'.grep_string{}<CR>", { desc = "Search under cursor"})
  end
}
