vim.cmd([[
augroup _yank_hight_light
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=150}
augroup end

]])
