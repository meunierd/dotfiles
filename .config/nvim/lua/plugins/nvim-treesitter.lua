return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    endwise = {
      enable = true,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
  dependencies = {
    "RRethy/nvim-treesitter-endwise",
  },
}
