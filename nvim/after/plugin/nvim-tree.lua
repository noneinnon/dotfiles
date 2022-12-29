require("nvim-tree").setup({
  disable_netrw = false
  -- hijack_netrw = false
})
--
-- mappings
vim.keymap.set('n', '<leader>ft', ":NvimTreeToggle<CR>", { desc = '[F]ile [T]ree' })
vim.keymap.set('n', '<C-f>', ":NvimTreeFindFileToggle<CR>", { desc = '[F]ile [F]file' })
