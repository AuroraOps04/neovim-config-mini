local status_ok, go = pcall(require, "go")

if not status_ok then
	vim.notify("Missing go.nvim dependency", vim.log.levels.ERROR)
	return
end

go.setup({})
