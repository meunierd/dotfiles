return {
  "vim-test/vim-test",
  config = function(_, opts)
    vim.g["test#strategy"] = "toggleterm"
  end,
  dependencies = {
    { "akinsho/toggleterm.nvim" },
  },
}
