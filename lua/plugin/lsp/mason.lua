local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status_ok then
  return
end

mason.setup({
  ui = {
    border = "none",
    icons = {
      package_installed = "◍",
      package_pending = "◍",
      package_uninstalled = "◍",
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
})

local servers = {
  "lua_ls",
  "pyright",
  "jsonls",
  "cmake",
  "tsserver",
  "gopls",
  "clangd",
}
mason_lspconfig.setup({
  ensure_installed = {},
  automatic_installation = false,
})
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}
-- neodev
local status_ok, neodev = pcall(require, "neodev")
if status_ok then
  neodev.setup({})
end

-- 配置 各个 lsp
for _, server in pairs(servers) do
  opts = {
    on_attach = require("plugin.lsp.handlers").on_attach,
    capabilities = require("plugin.lsp.handlers").capabilities,
  }

  server = vim.split(server, "@")[1]
  local require_ok, conf_opts = pcall(require, "plugin.lsp.settings." .. server)
  if require_ok then
    -- 通用的配置 加上 私有的配置
    opts = vim.tbl_deep_extend("force", conf_opts, opts)
  end

  lspconfig[server].setup(opts)
end
-- lspconfig.gopls.setup({
-- 	on_attach = require("plugin.lsp.handlers").on_attach,
-- 	capabilities = require("plugin.lsp.handlers").capabilities,
-- })
