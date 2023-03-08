-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    vim.cmd [[ packadd packer.nvim ]]
end

require('packer').startup(function(use)
    -- Package manager
    if vim.g.vscode then
    else
        use 'wbthomason/packer.nvim'

        use { -- LSP Configuration & Plugins
            'neovim/nvim-lspconfig',
            requires = {
                -- Automatically install LSPs to stdpath for neovim
                'williamboman/mason.nvim',
                'williamboman/mason-lspconfig.nvim',
            },
        }

        use { -- Autocompletion
            'hrsh7th/nvim-cmp',
            requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip',
                -- 'hrsh7th/cmp-copilot',
                -- 'github/copilot.vim'
            },
        }

        use { -- Highlight, edit, and navigate code
            'nvim-treesitter/nvim-treesitter',
            run = function()
                pcall(require('nvim-treesitter.install').update { with_sync = true })
            end,
        }

        use { -- Additional text objects via treesitter
            'nvim-treesitter/nvim-treesitter-textobjects',
            after = 'nvim-treesitter',
        }

        -- Git related plugins
        use 'tpope/vim-fugitive'
        use 'tpope/vim-rhubarb'
        use 'kyazdani42/nvim-web-devicons'

        use({
            "neanias/everforest-nvim",
            -- Optional; default configuration will be used if setup isn't called.
            config = function()
                require("everforest").setup()
            end,
        })

        use 'p00f/alabaster.nvim'
        use 'nvim-lualine/lualine.nvim' -- Fancier statusline
        use({
            'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
            config = function()
                require('Comment').setup()
            end,
        })
        use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
        use 'tpope/vim-dadbod' -- DB client
        use 'kristijanhusak/vim-dadbod-ui'
        use 'tpope/vim-dotenv'
        use 'tpope/vim-unimpaired'


        -- Fuzzy Finder (files, lsp, etc)
        use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
        use {
            -- "nvim-telescope/telescope-file-browser.nvim",
            requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
        }

        -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
        use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

        -- lisp related stuff
        -- https://github.com/tpope/vim-sexp-mappings-for-regular-people
        use 'tpope/vim-sexp-mappings-for-regular-people'
        use 'tpope/vim-repeat'
        use 'guns/vim-sexp'
        use 'Olical/conjure'
        use 'PaterJason/cmp-conjure'

        -- other
        use 'mattn/emmet-vim'
        use 'tpope/vim-sensible'
        use 'tpope/vim-surround'
        use 'mg979/vim-visual-multi'
        use 'junegunn/vim-easy-align'
        use {
            'folke/which-key.nvim',
            config = function()
                require("which-key").setup {}
            end
        }
        use {
            'folke/todo-comments.nvim',
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }

        use {
            'phaazon/hop.nvim',
            branch = 'v2', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
            end,
        }

        use "mbbill/undotree"

        -- https://github.com/edkolev/tmuxline.vim
        use 'edkolev/tmuxline.vim'
        use 'windwp/nvim-spectre'
        use 'windwp/nvim-ts-autotag'

        -- Zen
        -- https://github.com/folke/zen-mode.nvim
        use {
            "folke/zen-mode.nvim",
            config = function()
                require("zen-mode").setup {
                    window = {
                        options = {
                            signcolumn = "no",
                            number = false,
                            relativenumber = false,
                            cursorline = true,
                            -- cursorcolumn = false, -- disable cursor column
                            -- foldcolumn = "0", -- disable fold column
                            -- list = false, -- disable whitespace characters
                        }
                    }
                }
            end
        }
    end
    -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
    local has_plugins, plugins = pcall(require, 'custom.plugins')
    if has_plugins then
        plugins(use)
    end

    if is_bootstrap then
        require('packer').sync()
    end
end)


-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    command = 'source <afile> | PackerCompile',
    group = packer_group,
    pattern = vim.fn.expand '$MYVIMRC',
})
