local tab = {
	{
		keys = { "everforest" },
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("everforest").setup({
				-- 0 | 1 | 2
				transparent_background_level = 2,
			})
		end,
	},
	{
		keys = {
			"tokyonight-night",
			"tokyonight-storm",
			"tokyonight-day",
			"tokyonight-moon",
		},
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
		end,
	},
	{
		keys = { "catppuccin", "catppuccin-macchiato", "catppuccin-frappe", "catppuccin-mocha", "catppuccin-latte" },
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
	{
		keys = {
			"solarized-osaka",
			"solarized-osaka-storm",
			"solarized-osaka-day",
			"solarized-osaka-night",
			"solarized-osaka-moon",
		},
		config = function()
			require("solarized-osaka").setup({
				transparent = true,
			})
		end,
	},
	{
		keys = { "rose-pine", "rose-pine-main", "rose-pine-moon", "rose-pine-dawn" },
		config = function()
			require("rose-pine").setup({
				styles = {
					transparency = true,
				},
			})
		end,
	},
	{
		keys = { "nightfox", "dayfox", "dawnfox", "duskfox", "nordfox", "terafox", "carbonfox" },
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})
		end,
	},
}
local colorTab = {}
for _, value in ipairs(tab) do
	local keys = value["keys"]
	local config = value["config"]
	for _, key in ipairs(keys) do
		colorTab[key] = config
	end
end

function string.split(str, delimiter)
	local result = {}
	local pattern = string.format("([^%s]+)", delimiter)
	str:gsub(pattern, function(substr)
		table.insert(result, substr)
	end)
	return result
end

function string.join(list, delimiter)
	local res = ""
	for i, v in ipairs(list) do
		if i == 1 then
			res = v
		else
			res = res .. delimiter .. v
		end
	end
	return res
end

local Menu = require("nui.menu")
-- local event = require("nui.utils.autocmd").event

local popup_options = {
	-- relative = "buf",
	position = "50%",
	size = {
		width = 80,
		height = 30,
	},
	-- position = {
	--
	-- 	row = 30,
	-- 	col = 30,
	-- },
	border = {
		style = "rounded",
		text = {
			top = "ColorScheme",
			top_align = "center",
		},
	},
	win_options = {
		winhighlight = "Normal:Normal",
	},
}
local colorscheme_file = vim.fn.stdpath("state") .. "/colorscheme"

local colorscheme
local isTransParent = "true"

local function setColorscheme()
	local file = io.open(colorscheme_file, "w+")
	if file == nil then
		return
	end
	local line = colorscheme .. "," .. isTransParent
	if colorscheme then
		colorTab[colorscheme]()
		vim.cmd.colorscheme(colorscheme)
	end
	file:write(line)
	file:close()
end

local function readColorScheme()
	local file = io.open(colorscheme_file, "r")
	if file == nil then
		return
	end

	local line = file:read()
	if line == "" then
		return
	end
	line = string.split(line, ",")
	colorscheme = line[1]
	file:close()
	if colorscheme then
		colorTab[colorscheme]()
		vim.cmd.colorscheme(colorscheme)
	end
	-- if isTransParent == "true" then
	-- 	--   TODO: isTransparent
	-- end
end
function OpenColorScheme()
	-- local before_color = vim.api.nvim_exec2("colorscheme", { output = true }).output
	-- local colors = vim.fn.getcompletion("", "color")
	local colors = vim.tbl_keys(colorTab)
	local items = {}
	for _, c in pairs(colors) do
		table.insert(items, 1, Menu.item(c))
	end
	local menu = Menu(popup_options, {
		lines = items,
		max_width = 20,
		keymap = {
			focus_next = { "j", "<Down>", "<Tab>" },
			focus_prev = { "k", "<Up>", "<S-Tab>" },
			close = { "<Esc>", "<C-c>", "q" },
			submit = { "<CR>", "<Space>" },
		},
		on_close = function()
			print("CLOSED")
		end,
		on_submit = function(item)
			colorscheme = item.text
			setColorscheme()
		end,
	})
	menu:mount()
end

-- vim.api.nvim_set_keymap("n", "<leader>cs", ":echo 123", {})
vim.keymap.set("n", "<leader>cs", function()
	OpenColorScheme()
end, {})
local ag = vim.api.nvim_create_augroup("ColorSchemeGroup", {})
vim.api.nvim_create_autocmd("VimEnter", {
	group = ag,
	callback = function()
		readColorScheme()
	end,
})
