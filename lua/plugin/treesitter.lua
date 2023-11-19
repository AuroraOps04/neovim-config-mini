local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
configs.setup({
  ensure_installed = {
    "vim",
    --    "bash",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    --    "tsx",
    "css",
    "markdown",
    "markdown_inline",
    --    "java",
    "go",
    --   "regex",
    --   "html",
    --   "vue",
  },
  sync_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,         -- false will disable the whole extension
    disable = { "" },      -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  indent = { enable = true, disable = { "yaml" } },
  autotag = {
    enable = true,
  },
  textobjects = {
    enable = true,
  }
})
local inst_status_ok, inst = pcall(require, "nvim-treesitter.install")
if not inst_status_ok then
  return error("treesitter is not aliveable")
end
-- inst.command_extra_args = {
--   curl = { "--proxy", "http://localhost:7890" },
-- }
