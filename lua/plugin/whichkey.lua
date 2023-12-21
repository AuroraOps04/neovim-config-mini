local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true,    -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },               -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,   -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,   -- default bindings on <c-w>
      nav = true,       -- misc bindings to work with windows
      z = true,         -- bindings for folds, spelling and others prefixed with z
      g = true,         -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded",     -- none, single, double, shadow
    position = "bottom",    -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 },                                            -- min and max height of the columns
    width = { min = 20, max = 50 },                                            -- min and max width of the columns
    spacing = 3,                                                               -- spacing between columns
    align = "left",                                                            -- align columns left, center or right
  },
  ignore_missing = true,                                                       -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                            -- show help message on the command line when the popup is visible
  triggers = "auto",                                                           -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n",    -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,  -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating eeymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  a = { "ggVG", "Select all" },
  A = { "<cmd>Alpha<cr>", "Alpha" },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  -- ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>wq!<CR>", "Save and quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  s = { "<cmd>write <CR>", "Save and formt current buffer" },
  P = { "<cmd>Telescope projects<cr>", "Find projects" },
  c = { "<cmd>bd<cr>", "Delete current buffer" },
  C = { "<cmd>e $MYVIMRC<cr>", "Edit Configuration" },
  w = {
    name = "Window",
    h = { "<cmd>split<cr>", "Split horizontal" },
    v = { "<cmd>vsplit<cr>", "Split vertical" },
    c = { "<cmd>close<cr>", "Close window" },
  },
  f = {
    --"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{})<cr>",
    "<cmd>Telescope fd<cr>",
    "Find Files",
  },
  F = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

  S = {
    name = "Search",
    s = { "<cmd>Telescope lsp_document_symbols <cr>", "Current file Symbol" },
    S = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace Symbol" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
  },
  -- LSP
  l = {
    name = "LSP",
    i = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Lsp Tips" },
    I = { "<cmd>LspInfo<cr>", "Lsp Info" },
    l = { "<cmd>LspLog<cr>", "Lsp Log" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Lsp Code Action" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Lsp rename" },
    e = { "<cmd>Telescope diagnostics<cr>", "Show diagnostic" },
  },
  -- DAP
  d = {
    name = "Debugger",
    b = { "<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint" },
    d = { "<cmd>DapUiToggle<cr>", "Dap ui toggle" },
    c = { "<cmd>DapContinue<cr>", "Dap Start" },
    r = { "<cmd>DapRerun<cr>", "Dap run or rerun" },
    s = { "<cdm>DapStop<cr>", "Dap stop" },
    i = { "<cmd>DapShowLog<cr>", "Dap log" },
  },
  -- Buffers
  b = {
    name = "Buffers",
    b = { "<cmd>Telescope buffers<cr> ", "Show Buffers" },
    r = { "<cmd>BufferLineCloseRight<cr>", "Close right buffers" },
    l = { "<cmd>BufferLineCloseLeft<cr>", "Close left buffers" },
    -- o = { "<cmd>BufferLineCloseOther<cr>", "Close other buffers" },
  },
  -- Git
  g = {
    name = "Git",
    t = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Git Terminal" },
    s = { "<cmd>Telescope git_status<cr>", "Git Status" },
    b = { "<cmd>Telescope git_branches<cr>", "Git branchs" },
    c = { "<cmd>Telescope git_commits<cr>", "Git commits" },
    l = { "<cmd>Gitsigns blame_line<cr> ", "Git blame lines" },
    j = { "<cmd>Gitsigns next_hunk<cr>", "Git next hunk" },
    k = { "<cmd>Gitsigns prev_hunk<cr>", "Git prev hunk" },
    p = { "<cmd>Gitsigns preview_hunk<cr>", "Git hunk preview" },
  },
  T = {
    name = "Terminal",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit terminal" },
  },
}
which_key.setup(setup)
-- start with <leader>
which_key.register(mappings, opts)

which_key.register({
  g = {
    name = "jump",
    d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
    D = { "<cmd>Telescope lsp_type_definitions <cr>", "Go to type definition" },
    i = { "<cmd>Telescope lsp_implementations<cr>", "Go to implemention" },
    r = { "<cmd>Telescope lsp_references<cr>", "Go to references" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to prev diagnostic" },
  },
  c = {
    name = "Change",
    -- NOTE: don't use a i!
    e = { require("substitute").operator, "Exchange motion from register" },
    l = { require("substitute").line, "Exchange line from register " },
  },
  ["<F6>"] = { "<cmd>DapStepOver<cr>", "Dap step over" },
  ["<F7>"] = { "<cmd>DapStepInto<cr>", "Dap step into" },
  ["<F8>"] = { "<cmd>DapStepOut<cr>", "Dap step out" },
}, {
  nowait = true,
  noremap = true,
  silent = true,
  mode = "n",
  buffer = nil,
})
