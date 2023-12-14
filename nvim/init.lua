-- Syntax
-- vim.opt: behaves like :set
-- vim.opt_global: behaves like :setglobal
-- vim.opt_local: behaves like :setlocal
-- vim.o: behaves like :let &{option-name}
-- vim.go: behaves like :let &g:{option-name}
-- vim.bo: behaves like :let &l:{option-name} for buffer-local options
-- vim.wo: behaves like :let &l:{option-name} for window-local options
--
vim.opt.clipboard = "unnamedplus"

-- vim.opt.spelllang = "en_us,ru_ru"
-- vim.opt.spell = true

-- relative line numbers
vim.o.relativenumber = true

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false
--
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

-- Set :nos[wapfile]
vim.cmd [[noswapfile]]
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
vim.g.guifont_size = 18
vim.g.guifont_family = "FiraCode Nerd Font"
vim.opt.guifont = { vim.g.guifont_family, string.format(":h%s", vim.g.guifont_size) }
-- does not work for some reason


vim.g.netrw_winsize = 15;
vim.g.netrw_banner = 0;
vim.g.netrw_liststyle=3
-- if has("unnamedplus")
--     set clipboard=unnamedplus
-- else
--     set clipboard=unnamed
-- endif

-- hide sign column
vim.opt.scl = 'no'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--
vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняж;abcdefghijklmnopqrstuvwxyz;"

vim.opt.linespace = 20;

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("mappings")
require("plugins")
-- require("autocmd")
