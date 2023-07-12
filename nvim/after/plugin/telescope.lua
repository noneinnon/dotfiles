-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    initial_mode = "normal",
    file_ignore_patterns = { "^.git/", "^.png" },
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
  }, }

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

vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files({ hidden = true })
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>ss', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
vim.keymap.set('n', '<leader>sk', require('telescope.builtin').keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('', '<leader>st', ':Telescope colorscheme<CR>', { silent = true, desc = "[S]earch [T]heme" })
vim.keymap.set('n', '<leader>lds', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
vim.keymap.set('n', '<leader>lws', require('telescope.builtin').lsp_dynamic_workspace_symbols,
  { desc = '[W]orkspace [S]ymbols' })
vim.keymap.set('n', '<leader>gr', require('telescope.builtin').lsp_references, { desc = '[G]oto [R]eferences' })

vim.keymap.set('n', '<leader>sn', function()
  require('telescope.builtin').find_files { cwd = os.getenv("NOTES_DIR") }
end, { desc = '[S]earch [N]otes' })

vim.keymap.set('n', '<leader>sg', function()
  require('telescope.builtin').live_grep { cwd = os.getenv("NOTES_DIR") }
end, { desc = '[S]earch [G]rep notes' })

vim.keymap.set('n', '<leader>sw', function()
  require('telescope.builtin').grep_string { cwd = os.getenv("NOTES_DIR") }
end, { desc = '[S]earch [W]ord notes' })

vim.keymap.set('n', '<leader>sd', function()
  require('telescope.builtin').find_files { cwd = "~/dotfiles" }
end, { desc = '[S]earch [D]otfiles' })
