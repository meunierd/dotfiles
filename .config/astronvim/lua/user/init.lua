return {
  lsp = {
    servers = {
      "sorbet",
      "ruby_ls", 
    },
    formatting = {
      format_on_save = true,
      async = true,
    },
    config = {
      ruby_ls = {
        cmd = { "bundle", "exec", "ruby-lsp" }
      }
    },
  },
  plugins = {
    {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("catppuccin").setup {}
      end,
    },
    {
      "vim-test/vim-test",
      cmd = {
        "TestFile",
        "TestNearest",
        "TestLast",
      }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = {"lua", "ruby"},
        }
      end,
    },
    {
      "rrethy/nvim-treesitter-endwise",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
      },
      ft = "ruby",
      config = function()
        require('nvim-treesitter.configs').setup {
          endwise = {
            enable = true,
          },
        }
      end
    },
    {
      "lewis6991/gitsigns.nvim",
      config = function()
        require('gitsigns').setup {
          current_line_blame=true,
        }
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
          sources = {
            null_ls.builtins.diagnostics.rubocop.with({
              command = "bin/rubocop",
              timeout = 20000,
              async = true,
            }),
          },
        })
      end,
    },
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
