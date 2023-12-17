local opt = vim.opt
opt.relativenumber = true
opt.number = true
opt.clipboard = "unnamedplus"
opt.fileencoding = "utf-8"
opt.hlsearch = true
opt.showtabline = 2
opt.smartcase = true
opt.smartindent = true
opt.swapfile = false
opt.termguicolors = true
-- 等待一个键映射的时间 单位 ms
opt.timeoutlen = 1000
opt.undofile = true
-- 更快的完成速度
opt.updatetime = 300
opt.writebackup = false
opt.wrap = false
-- enable tab => space
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.cursorline = true
opt.numberwidth = 4
-- 显示左侧符号栏
opt.signcolumn = "yes"
opt.scrolloff = 5
opt.sidescrolloff = 5

vim.cmd("highlight Normal guibg=NONE ctermbg=None")
