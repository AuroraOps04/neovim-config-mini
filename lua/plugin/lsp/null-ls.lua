local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
  autostart = true,
  debug = false,
  sources = {
    -- formatting.prettier.with({
    --   extra_args = {
    --     -- "--no-semi",
    --     -- "--single-quote",
    --     -- "--jsx-single-quote",
    --     -- "--html-whitespace-sensitivity ignore",
    --     -- "--tab-width 2",
    --     -- "--print-width 80",
    --     -- "--use-tabs false",
    --     -- "--quote-props as-needed",
    --   },
    -- }),
    -- formatting.black.with({ extra_args = { "--preview", "-l 79" } }),
    formatting.stylua,
    -- formatting.clang_format,
    -- diagnostics.flake8,
    -- diagnostics.eslint_d,
    -- formatting.eslint_d,
    -- formatting.google_java_format,
    -- null_ls.builtins.formatting.shfmt,
    diagnostics.golangci_lint,
    formatting.gofmt,
    formatting.goimports,
    formatting.golines,
    -- formatting.nginx_beautifier
    -- formatting.black,
  },
  -- this config is not work

  -- format on autosave
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end
})
