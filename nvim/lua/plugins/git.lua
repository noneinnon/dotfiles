return {
  {
    'tpope/vim-fugitive',
    cmd = { "Git", "Gdiff", "Gclog", "Gblame" },
    config = function()
      -- Git keymaps
      vim.keymap.set('n', '<leader>gs', ':vertical G<CR>', { desc = 'Git status' })
      vim.keymap.set('n', '<leader>gb', ':G blame<CR>', { desc = 'Git blame' })
      vim.keymap.set('n', '[g', ':diffget //2<CR>', { desc = 'Git diff get left' })
      vim.keymap.set('n', ']g', ':diffget //3<CR>', { desc = 'Git diff get right' })
      vim.keymap.set('n', '<leader>gh', '<cmd>0Gclog<CR>', { desc = 'Git history (file)' })
      vim.keymap.set('n', '<leader>gl', '<cmd>Gclog<CR>', { desc = 'Git log' })
    end,
  },
  {
    'tpope/vim-rhubarb',
    dependencies = { 'tpope/vim-fugitive' },
    cmd = { "GBrowse" },
    config = function()
      -- GitHub browse keymaps
      vim.keymap.set('n', '<leader>\\', '<cmd>GBrowse<CR>', { desc = 'GitHub browse' })
      vim.keymap.set('v', '<leader>\\', '<cmd>GBrowse<CR>', { desc = 'GitHub browse' })
    end,
  },
}
