local status_ok, sub = pcall(require, 'substitute')
if not status_ok then
  return
end

sub.setup {

}
local opt = { noremap = true }
vim.keymap.set("n", "gr", "<cmd>lua require('substitute').operator()<cr>", opt)
vim.keymap.set("n", "grr", "<cmd>lua require('substitute').line()<cr>", opt)
