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
            requires = {
                'hrsh7th/cmp-nvim-lsp',
                'L3MON4D3/LuaSnip',
                'onsails/lspkind.nvim',
                'saadparwaiz1/cmp_luasnip',
                'hrsh7th/cmp-buffer',
                'hrsh7th/cmp-cmdline',
                'rafamadriz/friendly-snippets',
                'hrsh7th/cmp-path',
                'ray-x/cmp-treesitter',
                -- 'hrsh7th/cmp-copilot',
                -- 'github/copilot.vim',
            },
        }

        -- use({
        --     "jackMort/ChatGPT.nvim",
        --     config = function()
        --         require("chatgpt").setup()
        --     end,
        --     requires = {
        --         "MunifTanjim/nui.nvim",
        --         "nvim-lua/plenary.nvim",
        --         "nvim-telescope/telescope.nvim"
        --     }
        -- })

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

        use 'p00f/alabaster.nvim'
        use 'nvim-lualine/lualine.nvim' -- Fancier statusline
        use({
            'numToStr/Comment.nvim',    -- "gc" to comment visual regions/lines
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

        use { "ThePrimeagen/harpoon",
            requires = {
                "nvim-lua/plenary.nvim",
            }
        }

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

        use "mbbill/undotree"
        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup {} end
        }

        use 'windwp/nvim-spectre'
        use 'windwp/nvim-ts-autotag'
        use 'folke/zen-mode.nvim'
        use 'jpalardy/vim-slime'
        use 'stevearc/oil.nvim'

        use  {
            "chrishrb/gx.nvim",
            -- you can specify also another config if you want
            config = function() require("gx").setup {
                open_browser_app = "open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
                open_browser_args = { "--background" }, -- specify any arguments, such as --background for macOS' "open".
                handlers = {
                    plugin = true, -- open plugin links in lua (e.g. packer, lazy, ..)
                    github = true, -- open github issues
                    brewfile = true, -- open Homebrew formulaes and casks
                    package_json = true, -- open dependencies from package.json
                    search = true, -- search the web/selection on the web if nothing else is found
                },
                handler_options = {
                    search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
                    -- search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
                },
            } end,
        }

    end
    -- Add custom plugins tlasto packer from ~/.config/nvim/lua/custom/plugins.lua
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
