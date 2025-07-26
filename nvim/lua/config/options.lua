-- [[ Setting options ]]
-- See `:help vim.o`

vim.opt.clipboard = "unnamedplus"

-- vim.opt.spelllang = "en_us,ru_ru"
-- vim.opt.spell = true

-- relative line numbers
vim.o.relativenumber = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

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
vim.g.sexp_enable_insert_mode_mappings = 0

vim.g.guifont_size = 18
vim.g.guifont_family = "FiraCode Nerd Font"
vim.opt.guifont = { vim.g.guifont_family, string.format(":h%s", vim.g.guifont_size) }

vim.g.netrw_winsize = 15
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

-- hide sign column
vim.opt.scl = 'no'

vim.opt.langmap = "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчняж;abcdefghijklmnopqrstuvwxyz;"

vim.opt.linespace = 20

vim.o.backupdir = "/tmp/nvim,."
vim.o.directory = "/tmp/nvim,."

-- Disable unused providers to avoid warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0 
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

-- Configure diagnostics globally
vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}
