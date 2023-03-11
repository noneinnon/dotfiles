vim.keymap.set('n', '<leader>gs', ':vertical G<CR>')
vim.keymap.set('n', '<leader>gb', ':G blame<CR>')

vim.keymap.set('n', '[g', ':diffget //2<CR>')
vim.keymap.set('n', ']g', ':diffget //3<CR>')
-- vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { silent = true })
--
vim.keymap.set('n', '<leader>gh', '<cmd>0Gclog<CR>')
vim.keymap.set('n', '<leader>gl', '<cmd>Gclog<CR>')
