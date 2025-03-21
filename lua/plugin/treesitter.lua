local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
configs.setup({
  modules = {},
  auto_install = true,
  ensure_installed = {
    "fish",
    "cmake",
    "vim",
    "bash",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "tsx",
    "css",
    "markdown",
    "markdown_inline",
    "java",
    "go",
    "regex",
    "html",
    "vue",
    "c",
    "cpp",
  },
  sync_install = true,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,        -- false will disable the whole extension
    disable = { "" },     -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  autotag = {
    enable = true,
  },
  textobjects = {
    enable = true,
    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      -- ["af"] = "@function.outer",
      -- ["if"] = "@function.inner",
      -- ["ac"] = "@class.outer",
      -- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
      -- -- mei yong
      -- -- ["ip"] = "@paramerter.inner",
      -- -- ["ap"] = "@paramerter.outer",
      -- ["ia"] = "@assignment.inner",
      -- ["aa"] = "@assignment.outer",
      -- ["la"] = "@assignment.lhs",
      -- ["ra"] = "@assignment.rhs",
      -- ["ib"] = "@block.inner",
      -- ["ab"] = "@block.outer",
      -- ["il"] = "@loop.inner",
      -- ["al"] = "@loop.outer",
      -- ["as"] = "@statement.outer",
      -- You can optionally set descriptions to the mappings (used in the desc parameter of
      -- nvim_buf_set_keymap) which plugins like which-key display
      -- You can also use captures from other query groups like `locals.scm`
      -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
    },
    -- You can choose the select mode (default is charwise 'v')
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * method: eg 'v' or 'o'
    -- and should return the mode ('v', 'V', or '<c-v>') or a table
    -- mapping query_strings to modes.
    selection_modes = {
      ["@parameter.outer"] = "v", -- charwise
      ["@function.outer"] = "V", -- linewise
      ["@class.outer"] = "<c-v>", -- blockwise
    },
    -- If you set this to `true` (default is `false`) then any textobject is
    -- extended to include preceding or succeeding whitespace. Succeeding
    -- whitespace has priority in order to act similarly to eg the built-in
    -- `ap`.
    --
    -- Can also be a function which gets passed a table with the keys
    -- * query_string: eg '@function.inner'
    -- * selection_mode: eg 'v'
    -- and should return true of false
    include_surrounding_whitespace = true,
  },
})
-- local inst_status_ok, inst = pcall(require, "nvim-treesitter.install")
-- if not inst_status_ok then
--   return error("treesitter is not aliveable")
-- end
-- inst.command_extra_args = {
--   curl = { "--proxy", "http://localhost:7890" },
-- }
