-- create
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.keymap.set("i", "<M-l>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
-- vim.cmd([[highlight CopilotSuggestion guifg=#333 ctermfg=8]])
