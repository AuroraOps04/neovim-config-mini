local status_ok, dap = pcall(require, "dap")
if not status_ok then
	vim.notify("dap not ready", vim.log.levels.ERROR)
	return
end
-- Dap UI setup start
local ui_status_ok, dapui = pcall(require, "dapui")
if not ui_status_ok then
	vim.notify("dap ui not ready", vim.log.levels.ERROR)
	return
end
dapui.setup()
-- Dap UI setup end
-- Dap For C
dap.adapters.gdb = {
	type = "executable",
	command = "/usr/bin/gdb",
	args = { "-i", "dap" },
}
dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
	},
}
-- Dap for C End
