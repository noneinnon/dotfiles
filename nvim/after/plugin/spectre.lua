-- nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
--
-- "search current word
-- nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
-- vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
-- "  search in current file
-- nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>


vim.keymap.set('n', '<leader>S', require('spectre').open, { desc = '[S]pectre' })
vim.keymap.set('n', '<leader>Sw', function() 
  require('spectre').open_visual({select_word=true})
end, { desc = '[S]pectre [W]ord' })
