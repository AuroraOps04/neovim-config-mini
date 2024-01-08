vim.g.translator_proxy_url = "socks5://localhost:7891"
vim.g.translator_history_enable = true
local opts = {
	desc = "Translate",
	silent = true,
	nowait = true,
	noremap = true,
}
vim.keymap.set("n", "<leader>tr", "<cmd>Translate<cr>", opts)
vim.keymap.set("v", "<leader>tr", "<cmd>Translate<cr>", opts)
-- vim.keymap.set("n", "<leader>tr", "<cmd>TranslateR<cr>", opts)
-- vim.keymap.set("v", "<leader>tr", "<cmd>TranslateR<cr>", opts)
