-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Windows
--
vim.keymap.set('n', '<leader>wm', ':only<CR>', { silent = true })
vim.keymap.set('n', '<leader>ws', ':split<CR>', { silent = true })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { silent = true })
-- Buffers
--
vim.keymap.set('v', '<C-c>', '"*y', { silent = true })
vim.keymap.set('n', '<C-p>', '"*p', { silent = true })
vim.keymap.set('', '<leader><tab>', 'b#<CR>', { silent = true })
vim.keymap.set('', '<leader>ba', ':ball<CR>', { silent = true })
vim.keymap.set('', '<leader>bb', ':Telescope buffers<CR>', { silent = true })
vim.keymap.set('', '<leader>bd', ':bdelete<CR>', { silent = true })
vim.keymap.set('', '<leader>bn', ':bnext<CR>', { silent = true })
vim.keymap.set('', '<leader>bp', ':bprevious<CR>', { silent = true })
-- Other
-- ;; killring / registers
-- ;; clipboard history
-- (util.lnnoremap :ch "Telescope neoclip")
vim.keymap.set('', '<leader>ch', ':Telescope neoclip<CR>', { silent = true })

-- Git
-- (util.lnnoremap :gd "DiffviewOpen")
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', { silent = true })
-- ToggleTerm
vim.keymap.set('n', '<leader>.', ':ToggleTerm<CR>', { silent = true })

-- other
--
vim.keymap.set('n', 'ga', ':EasyAlign<CR>', { silent = true })
vim.keymap.set('x', 'ga', ':EasyAlign<CR>', { silent = true })
vim.keymap.set('n', 'gx', ':!open <c-r><c-a>', { silent = true })

-- Github
  -- (util.lnnoremap :gga "Octo actions")
  -- (util.lnnoremap :gggl "Octo gist list")
  -- (util.lnnoremap :ggib "Octo issue browser")
-- (util.lnnoremap :ggic "Octo issue create")
-- (util.lnnoremap :ggil "Octo issue list")
-- (util.lnnoremap :ggis "Octo issue search")
-- (util.lnnoremap :ggiu "Octo issue url")
--
-- (util.lnnoremap :ggpb "Octo pr browser")
-- (util.lnnoremap :ggpc "Octo pr create")
-- (util.lnnoremap :ggpl "Octo pr list")
-- (util.lnnoremap :ggps "Octo pr search")
-- (util.lnnoremap :ggpu "Octo pr url")
--
-- (util.lnnoremap :ggrb "Octo repo browse")
-- (util.lnnoremap ggrf "Octo repo fork")
-- (util.lnnoremap :ggrl "Octo repo list")
-- (util.lnnoremap :ggru "Octo repo url"
M = {}
M.HandleURL = function()
  local url = string.match(vim.fn.getline("."), "[a-z]*://[^ >,;]*")
  if url ~= "" then
    vim.cmd('exec "!open \'' .. url .. '\'"')
  else
    vim.cmd('echo "No URI found in line."')
  end
end

vim.api.nvim_set_keymap("n", "gx", [[ <Cmd>lua M.HandleURL()<CR> ]], {})

