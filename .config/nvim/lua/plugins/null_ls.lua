return {
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
}
