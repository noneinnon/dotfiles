-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','


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

vim.api.nvim_set_keymap('n', '<A-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', '<C-w>l', { noremap = true, silent = true })

-- Tabs

vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { silent = true })
vim.keymap.set('n', '<leader>tt', ':tabn<CR>', { silent = true })
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { silent = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { silent = true })

-- Buffers
--
vim.keymap.set('v', '<C-c>', '"+y', { silent = true }) -- copy to system clipboard
vim.keymap.set('n', '<C-p>', '"+p', { silent = true }) -- paste from system clipboard

vim.keymap.set('', '<leader><tab>', ':b#<CR>', { silent = true })
vim.keymap.set('', '<leader>ba', ':ball<CR>', { silent = true })
vim.keymap.set('', '<leader>bd', ':bdelete<CR>', { silent = true })
vim.keymap.set('', '<leader>Bd', ':%bd!|e#<CR>', { silent = true })
vim.keymap.set('', '<leader>bn', ':bnext<CR>', { silent = true })
vim.keymap.set('', '<leader>bp', ':bprevious<CR>', { silent = true })

vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set('', 'Q', '<Nop>', { silent = true })

-- vim.keymap.set("n", "<C-]>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-[>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>]", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>[", "<cmd>lprev<CR>zz")
--
vim.keymap.set('n', '<leader>5', ':so %<CR>', {})
vim.keymap.set('n', '<leader>6', ':so ~/dotfiles/nvim/init.lua<CR>', {})

vim.keymap.set('n', '<leader>ed', function()
    vim.cmd('cd ~/dotfiles');
    vim.cmd('e ~/dotfiles/nvim/init.lua');
end, { silent = true })

vim.keymap.set('n', '<leader>tbt', function()
    if vim.o.background == "dark" then
        vim.o.background = 'light';
    else
        vim.o.background = 'dark';
    end
end
, { silent = true, desc = "[T]heme [B]ackground [T]oggle" }
)

vim.keymap.set('n', '<leader>to', function()
    local current_buffer_path = vim.fn.expand('%:p:h')
    vim.cmd('silent !open -a "kitty" ' .. current_buffer_path)
end, { silent = true })


vim.keymap.set('n', '<leader>on', function()
    vim.cmd("e " .. os.getenv("NOTES_DIR"))
end, { silent = true, desc = "[O]pen [N]otes" })

vim.keymap.set('n', '<leader>nq', function()
    vim.cmd("e " .. os.getenv("NOTES_DIR") .. "/quick.md")
end, { silent = true, desc = "[N]ote [Q]uick" })

vim.keymap.set('n', '<leader>nt', function()
    vim.cmd("e " .. os.getenv("NOTES_DIR") .. "/todo.md")
end, { silent = true, desc = "[N]ote [T]odo" })

-- Packer
vim.keymap.set('n', '<leader>ps', ':PackerSync<CR>', { silent = true, desc = 'Packer Sync' })

-- neovide
vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
    change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
    change_scale_factor(1 / 1.25)
end)

local function adjustSize(amount)
    vim.g.guifont_size = vim.g.guifont_size + amount
    vim.opt.guifont = { vim.g.guifont_family, string.format(":h%s", vim.g.guifont_size) }
end

vim.keymap.set('n', '<D-=>', function()
    adjustSize(1)
end)

vim.keymap.set('n', '<D-->', function()
    adjustSize(-1)
end)

vim.keymap.set('n', '<C-s>', ':w<CR>')      -- Save

if vim.g.neovide then
    vim.g.neovide_input_use_logo = 1            -- enable use of the logo (cmd) key
    vim.keymap.set('n', '<D-s>', ':w<CR>')      -- Save
    vim.keymap.set('v', '<D-c>', '"+y')         -- Copy
    vim.keymap.set('n', '<D-v>', '"+P')         -- Paste normal mode
    vim.keymap.set('v', '<D-v>', '"+P')         -- Paste visual mode
    vim.keymap.set('c', '<D-v>', '<C-R>+')      -- Paste command mode
    vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })

-- Netrw
vim.keymap.set('', '<C-f>', function()
    if (vim.o.filetype == "netrw") then
        vim.cmd [[:q]]
    else
        vim.cmd [[:sil! execute 'Lex' expand('%:p:h') . '/']]
    end
end, { noremap = true, silent = true })

local open_at_buffer_loc = function(app)
    vim.cmd([[:silent !open -a ]] .. app .. " " .. vim.fn.expand('%:p:h'))
end

vim.keymap.set('', '<Leader>of', function()
    open_at_buffer_loc('Finder')
end, { noremap = true, desc = "Open finder at buffer location" })

-- Terminal
-- https://neovim.io/doc/user/nvim_terminal_emulator.html
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

vim.keymap.set('n', '<LocalLeader>b', "<cmd>:make %<CR>", { noremap = true, silent = true })

local bind = vim.keymap.set
local opts = { silent = true, noremap = true }

-- for russian layout
bind("i", "<c-х>", "<C-[>", opts)
bind("n", "л", "gk", opts)
bind("n", "о", "gj", opts)
bind("i", "<C-г>", "<C-G>u<C-U>", opts)
bind("i", "<C-ц>", "<C-G>u<C-W>", opts)
