local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  -- Dependencies
  "nvim-lua/plenary.nvim",
  -- UI
  -- Color Scheme
  "neanias/everforest-nvim",
  {

    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = true
  },
  "nvim-lualine/lualine.nvim",
  {
    "akinsho/bufferline.nvim",
    version = "*"
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  },
  -- Which Key
  "folke/which-key.nvim",
  -- Jump
  "ggandor/leap.nvim",
  -- NvimTree
  {
    "nvim-tree/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    }
  },
  -- Telesocpe
  "nvim-telescope/telescope.nvim",


  "numToStr/Comment.nvim",
  "akinsho/toggleterm.nvim",
  "windwp/nvim-autopairs",


  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
  },
  {

    "p00f/nvim-ts-rainbow",
    config = function()
      -- require("ts-rainbow").setup()
    end
  },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  "neovim/nvim-lspconfig",
  {
    "williamboman/mason.nvim",
    --cmd = "Mason",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  "jose-elias-alvarez/null-ls.nvim",
  {
    "hrsh7th/nvim-cmp",
    dependencies = {

      "hrsh7th/cmp-buffer",
      -- buffer completions
      "hrsh7th/cmp-path",    -- path completions
      "hrsh7th/cmp-cmdline", -- cmdline completions
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      {
        "saadparwaiz1/cmp_luasnip", -- snippet completions
        dependencies = {
          "L3MON4D3/LuaSnip",
          "L3MON4D3/LuaSnip",
        },
      },
    },
  },
  "ahmedkhalf/project.nvim",
  {
    "goolord/alpha-nvim",
    cmd = "Alpha",
  },
  "lewis6991/gitsigns.nvim",
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    }
  },
  {
    "gbprod/substitute.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup()
    end
  },
  "voldikss/vim-translator",
  "lukas-reineke/indent-blankline.nvim",
  {

    'ahmedkhalf/project.nvim',
    config = function()
      require('project_nvim').setup()
    end
  },

  -- DAP Configuration
  'mfussenegger/nvim-dap',
  {
    -- use this can be without configuration for go dap
    'leoluz/nvim-dap-go',
    config = function()
      require("dap-go").setup()
    end

  },
  {

    "rcarriga/nvim-dap-ui",
    config = function()
      require('dapui').setup()
    end
  },

  {

    'theHamsta/nvim-dap-virtual-text',
    config = function()
      require('nvim-dap-virtual-text').setup()
    end
  },


  -- DAP Configuration End

  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    'mg979/vim-visual-multi',
    branch
    = 'master'
  },





  { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' }








})
