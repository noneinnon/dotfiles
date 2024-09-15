require('lazy').setup({
    'wbthomason/packer.nvim',
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'onsails/lspkind.nvim',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-path',
            'ray-x/cmp-treesitter',
            -- 'hrsh7th/cmp-copilot'
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter'
        },
    },
    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',
    'kyazdani42/nvim-web-devicons',
    'p00f/alabaster.nvim',
    {
        'nvim-lualine/lualine.nvim', -- Fancier statusline
        options = {
            theme = "zenbones"
        }
    },
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup {
                pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
            }
        end,
        dependencies = {
            'JoosepAlviste/nvim-ts-context-commentstring', -- jsx comments
        },
        opts = {
            -- add any options here
        },
        -- lazy = false,
    },
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },
    'tpope/vim-dotenv',
    'tpope/vim-unimpaired',
    -- Fuzzy Finder (files, lsp, etc)
    { 'nvim-telescope/telescope.nvim', dependencies = { 'nvim-lua/plenary.nvim' } },
    {
        "ThePrimeagen/harpoon",
        requires = {
            "nvim-lua/plenary.nvim",
        }
    },
    -- lisp related stuff
    -- https://github.com/tpope/vim-sexp-mappings-for-regular-people
    'tpope/vim-sexp-mappings-for-regular-people',
    'tpope/vim-repeat',
    'guns/vim-sexp',
    'Olical/conjure',
    'PaterJason/cmp-conjure',
    -- other
    'mattn/emmet-vim',
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'mg979/vim-visual-multi',
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    {
        'folke/todo-comments.nvim',
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    },
    "mbbill/undotree",
    -- https://github.com/windwp/nvim-autopairs
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    'windwp/nvim-spectre',
    'windwp/nvim-ts-autotag',
    -- 'folke/zen-mode.nvim',
    'jpalardy/vim-slime',
    'stevearc/oil.nvim',
    {
        "chrishrb/gx.nvim",
        -- you can specify also another config if you want
        keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
        cmd = { "Browse" },
        init = function()
            vim.g.netrw_nogx = 1 -- disable netrw gx
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
        config = true,                 -- default settings
        submodules = false,            -- not needed, submodules are required only for tests
        opts = {
            open_browser_app = "open", -- specify your browser app; default for macOS is "open", Linux "xdg-open" and Windows "powershell.exe"
            open_browser_args = {
                -- "--background" -- i prefer to pop browser open when i press gx
            },                       -- specify any arguments, such as --background for macOS' "open".
            handlers = {
                plugin = true,       -- open plugin links in lua (e.g. packer, lazy, ..)
                github = true,       -- open github issues
                brewfile = true,     -- open Homebrew formulaes and casks
                package_json = true, -- open dependencies from package.json
                search = true,       -- search the web/selection on the web if nothing else is found
            },
            handler_options = {
                search_engine = "google", -- you can select between google, bing, duckduckgo, and ecosia
                -- search_engine = "https://search.brave.com/search?q=", -- or you can pass in a custom search engine
            },
        },
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    'christoomey/vim-tmux-navigator',
    {
        "zenbones-theme/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        dependencies = "rktjmp/lush.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
        end
    },
    {
        "David-Kunz/gen.nvim",
        opts = {
            model = "mistral",  -- The default model to use.
            quit_map = "q",     -- set keymap for close the response window
            retry_map = "<c-r>", -- set keymap to re-send the current prompt
            accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
            host = "localhost", -- The host running the Ollama service.
            port = "11434",     -- The port on which the Ollama service is listening.
            display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
            show_prompt = false, -- Shows the prompt submitted to Ollama.
            show_model = false, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = false, -- Never closes the window automatically.
            hidden = false,     -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
            init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
            -- Function to initialize Ollama
            command = function(options)
                local body = { model = options.model, stream = true }
                return "curl --silent --no-buffer -X POST http://" ..
                options.host .. ":" .. options.port .. "/api/chat -d $body"
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            debug = false -- Prints errors and the command which is run.
        }
    },
})
