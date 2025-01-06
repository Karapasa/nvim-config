local null_ls = require("null-ls")

null_ls.setup({
    sources = {
      null_ls.builtins.formatting.stylua,
          -- python
      null_ls.builtins.formatting.black.with({
        extra_args = { "--line-length=120" }
      }),
      null_ls.builtins.formatting.isort,
    },
})
