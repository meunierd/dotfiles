require("lazy").setup({
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({})
    end
  },
  {
    "catppuccin/nvim",
    name="catpuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  },
  {
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
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {"lua", "ruby", "python"},
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
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
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
            null_ls.builtins.formatting.black
          },
        })
    end,
  },
  {
    "AstroNvim/AstroNvim",
    version = "^4", -- Remove version tracking to elect for nighly AstroNvim
    import = "astronvim.plugins",
    opts = { -- AstroNvim options must be set here with the `import` key
      mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
      maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
      icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
      pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
    },
  },
  { import = "community" },
  { import = "plugins" },
} --[[@as LazySpec]], {
  -- Configure any other `lazy.nvim` configuration options here
  install = { colorscheme = { "astrodark", "habamax" } },
  ui = { backdrop = 100 },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
} --[[@as LazyConfig]])
