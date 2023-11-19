vim.cmd([[
augroup _yank_hight_light
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {on_visual=false, timeout=150} 
augroup end

" augroup _format
"   autocmd!
"   autocmd BufWritePre * silent lua vim.lsp.buf.format()
" augroup end

" augroup _autosave
"   autocmd!
"   autocmd BufLeave * silent w<CR> 
" augroup end  
]])
