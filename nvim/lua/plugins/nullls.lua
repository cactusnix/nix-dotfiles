return {
  "jose-elias-alvarez/null-ls.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })
      end
    end
    local sources = {
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.diagnostics.eslint,
      null_ls.builtins.completion.spell,
    }
    null_ls.setup({
      sources = sources,
      on_attach = on_attach,
    })
  end,
}