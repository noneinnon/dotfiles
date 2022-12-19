-- empty setup using defaults
require("nvim-tree").setup()
--
-- mappings
vim.keymap.set('n', '<leader>ft', ":NvimTreeToggle<CR>", { desc = '[F]ile [T]ree' })
vim.keymap.set('n', '<leader>ff', ":NvimTreeFindFileToggle<CR>", { desc = '[F]ile [F]file' })
