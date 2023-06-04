-- Syntax
-- vim.opt: behaves like :set
-- vim.opt_global: behaves like :setglobal
-- vim.opt_local: behaves like :setlocal
--
-- vim.o: behaves like :let &{option-name}
-- vim.go: behaves like :let &g:{option-name}
-- vim.bo: behaves like :let &l:{option-name} for buffer-local options
-- vim.wo: behaves like :let &l:{option-name} for window-local options

-- relative line numbers
vim.o.relativenumber = true

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true
--
-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.cmd [[colorscheme alabaster]]
vim.o.background = "light"

-- Set :nos[wapfile]
-- vim.cmd [[noswapfile]]
vim.opt.swapfile = false
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- Disable vim sexp insert mode mappings
vim.g.sexp_enable_insert_mode_mappings = 0;
vim.g.guifont_size = 16
vim.g.guifont_family = "FiraCode Nerd Font"
vim.opt.guifont = { vim.g.guifont_family, string.format(":h%s", vim.g.guifont_size) }
-- does not work for some reason
-- vim.opt.linespace = 10;

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "help" },
    command = [[wincmd L]]
})

vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "help", "startuptime", "qf", "lspinfo" }, command = [[nnoremap <buffer><silent> q :close<CR>]] }
)

vim.g.netrw_banner = 0;
vim.g.netrw_winsize = 30;

-- hide sign column
vim.opt.scl = 'no'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
require("mappings")
require("plugins")
