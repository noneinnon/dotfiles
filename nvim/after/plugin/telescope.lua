-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
      n = {
        ['<C-q>'] = require('telescope.actions').smart_add_to_qflist,
        ['<C-;>'] = require('telescope.actions').smart_add_to_loclist,
        ['<C-w>'] = function(args)
          require('telescope.actions').send_to_qflist(args)
          require('telescope.actions').open_qflist(args)
        end,
      }
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>s/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sS', require('telescope.builtin').lsp_document_symbols,
  { desc = '[S]earch document [S]ymbols' })
vim.keymap.set('n', '<leader>ws', require('telescope.builtin').lsp_workspace_symbols,
  { desc = '[W]orkspace [S]ymbol' })
vim.keymap.set('', '<leader>st', ':Telescope colorscheme<CR>', { silent = true, desc = "[S]earch [T]heme" })

vim.keymap.set('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = os.getenv("NOTES_DIR") }
end, { desc = '[S]earch [N]notes' })

vim.keymap.set('n', '<leader>sd', function()
  require('telescope.builtin').find_files { cwd = "~/dotfiles" }
end, { desc = '[S]earch [D]otfiles' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
