-- LSP control keymaps (these are fine to be lazy-loaded)
vim.keymap.set('n', '<leader>le', function()
  vim.cmd[[LspStart]]
end, { desc = 'Start LSP' })

vim.keymap.set('n', '<leader>ls', function()
  vim.cmd[[LspStop]]
end, { desc = 'Stop LSP' })

vim.keymap.set('n', '<leader>li', function()
  vim.cmd[[LspInfo]]
end, { desc = 'LSP Info' })

vim.keymap.set('n', '<leader>db', ':DBUI<CR>', { desc = 'Database UI' })
vim.keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>', { desc = 'Database UI - Find buffer' })
vim.keymap.set('n', '<leader>dt', ':DBUIToggle<CR>', { desc = 'Database UI - Toggle' })
