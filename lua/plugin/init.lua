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
	{

		"nvim-lua/plenary.nvim",
		event = "VeryLazy",
	},
	-- UI
	-- Color Scheme
	{
		"neanias/everforest-nvim",
		config = function()
			require("plugin.colorschema")
		end,
		event = "VimEnter",
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "UIEnter",
		config = function()
			require("plugin.lualine")
		end,
	},
	{
		"akinsho/bufferline.nvim",
		version = "*",
		event = "UIEnter",
		config = function()
			require("plugin.bufferline")
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
		event = "UIEnter",
	},
	-- Which Key
	{

		"folke/which-key.nvim",
		event = "VeryLazy",
		cmd = "WhichKey",
		config = function()
			require("plugin.whichkey")
		end,
	},
	-- Jump
	{

		"ggandor/leap.nvim",
		event = "UIEnter",
		config = function()
			require("plugin.leap")
		end,
	},
	-- NvimTree
	{
		"nvim-tree/nvim-tree.lua",
		cmd = "NvimTreeToggle",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plugin.nvimtree")
		end,
	},
	-- Telesocpe
	{

		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		config = function()
			require("plugin.telescope")
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "UIEnter",
		config = function()
			require("plugin.comment")
		end,
	},
	{

		"akinsho/toggleterm.nvim",
		config = function()
			require("plugin.terminal")
		end,
		event = "CmdlineEnter",
	},
	{

		"windwp/nvim-autopairs",
		event = "UIEnter",
		config = function()
			require("plugin.autopair")
		end,
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugin.treesitter")
		end,
		event = "UIEnter",
		lazy = true,
	},
	{

		"p00f/nvim-ts-rainbow",
		event = "UIEnter",
		lazy = true,
		config = function()
			-- require("ts-rainbow").setup()
		end,
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
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
	{

		"neovim/nvim-lspconfig",
		event = "VimEnter",
	},
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		lazy = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{

		"jose-elias-alvarez/null-ls.nvim",
	},
	{
		"hrsh7th/nvim-cmp",
		lazy = true,
		event = "CmdlineEnter",
		config = function()
			require("plugin.cmp")
		end,
		dependencies = {
			"hrsh7th/cmp-buffer",
			-- buffer completions
			"hrsh7th/cmp-path", -- path completions
			"hrsh7th/cmp-emoji", -- path completions
			"hrsh7th/cmp-cmdline", -- cmdline completions
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			{
				"saadparwaiz1/cmp_luasnip", -- snippet completions
				-- lazy = true,
				-- event = { "InsertEnter" },
				dependencies = {
					{
						"L3MON4D3/LuaSnip",
						version = "v2.*",
						build = "make install_jsregexp",
						dependencies = {
							"rafamadriz/friendly-snippets",
						},
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
		},
	},
	{
		"ahmedkhalf/project.nvim",
		event = "VimEnter",
		config = function()
			require("plugin.project")
		end,
		-- cmd = "Telescope projects",
	},
	{
		"goolord/alpha-nvim",
		cmd = "Alpha",
		event = "VimEnter",
		config = function()
			require("plugin.alpha")
		end,
	},
	{

		"lewis6991/gitsigns.nvim",
		event = "UIEnter",
		config = function()
			require("plugin.gitsigns")
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugin.todo")
		end,
		event = "UIEnter",
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		event = "UIEnter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
	},
	{
		"gbprod/substitute.nvim",
		config = function()
			-- require("plugin.")
		end,
		event = "UIEnter",
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
		event = "UIEnter",
	},
	{

		"voldikss/vim-translator",
		config = function()
			require("plugin.translator")
		end,
		event = "UIEnter",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		-- lazy = true,
		event = "UIEnter",
		config = function()
			require("plugin.indent")
		end,
	},
	{

		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
		event = "VimEnter",
	},

	-- DAP Configuration
	{

		"mfussenegger/nvim-dap",
		cmd = { "DapContinue", "DapUiToggle" },
		config = function()
			require("plugin.dap")
		end,
	},
	{
		-- use this can be without configuration for go dap
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
		cmd = "DapContinue",
	},
	{

		"rcarriga/nvim-dap-ui",
		event = "UIEnter",
		config = function()
			require("dapui").setup()
		end,
		-- cmd = "DapUiToggle",
	},

	{

		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
		cmd = "DapContinue",
	},
	-- dap  for python
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			-- FIXME: config for linux
			require("dap-python").setup("~/.virtualenvs/debugpy/Scripts/python.exe")
		end,
		-- cmd = { "DapUiToggle", "DapContinue" },
		event = "UIEnter",
	},
	-- DAP Configuration End

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		lazy = true,
		config = function()
			require("plugin.noice")
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},
	{
		"mg979/vim-visual-multi",
		branch = "master",
		event = "UIEnter",
	},

	{
		"kevinhwang91/nvim-ufo",
		event = "UIEnter",
		config = function()
			require("plugin.ufo")
		end,
		dependencies = "kevinhwang91/promise-async",
	},

	{
		"nvim-treesitter/playground",
		config = function()
			require("nvim-treesitter.configs").setup({
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
		end,
		cmd = "TSPlaygroundToggle",
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
		event = "UIEnter",
	},
	{
		"LunarVim/bigfile.nvim",
	},
})
