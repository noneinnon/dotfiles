return {
  {
    'tpope/vim-sleuth',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-sensible',
    event = "VeryLazy",
  },
  {
    'tpope/vim-surround',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-repeat',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-unimpaired',
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    'tpope/vim-dotenv',
    ft = { "sh", "bash", "zsh", "fish" },
  },
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
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
              ['<C-q>'] = require('telescope.actions').smart_send_to_qflist,
              ['<C-i>'] = require('telescope.actions').smart_send_to_loclist,
              ['<C-w>'] = function(args)
                require('telescope.actions').send_to_qflist(args)
                require('telescope.actions').open_qflist(args)
              end,
            }
          },
        },
        pickers = {
          find_files = {},
          grep_string = {},
          live_grep = {}
        },
      }

      -- Enable telescope extensions if available
      pcall(require('telescope').load_extension, 'rg')

      -- Telescope keymaps
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>s/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer]' })

      vim.keymap.set('n', '<leader>sf', function()
        builtin.find_files({ hidden = true })
      end, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sr', builtin.registers, { desc = '[S]earch [R]egisters' })
      vim.keymap.set('n', '<leader>sm', builtin.resume, { desc = '[S]earch Resu[m]e' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('', '<leader>st', ':Telescope colorscheme<CR>', { silent = true, desc = "[S]earch [T]heme" })
      vim.keymap.set('n', '<leader>lds', builtin.lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })
      vim.keymap.set('n', '<leader>lws', builtin.lsp_dynamic_workspace_symbols, { desc = '[W]orkspace [S]ymbols' })
      vim.keymap.set('n', '<leader>gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })

      -- Notes keymaps
      vim.keymap.set('n', '<leader>ns', function()
        builtin.find_files { cwd = os.getenv("NOTES_DIR") }
      end, { desc = '[N]otes [S]earch' })

      vim.keymap.set('n', '<leader>ng', function()
        builtin.live_grep { cwd = os.getenv("NOTES_DIR") }
      end, { desc = '[N]otes [G]rep' })

      vim.keymap.set('n', '<leader>nw', function()
        builtin.grep_string { cwd = os.getenv("NOTES_DIR") }
      end, { desc = '[N]otes [W]ord' })

      vim.keymap.set('n', '<leader>sd', function()
        builtin.find_files { cwd = "~/dotfiles" }
      end, { desc = '[S]earch [D]otfiles' })
    end,
  },
  {
    'numToStr/Comment.nvim',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    opts = function()
      return {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    config = function()
      vim.keymap.set('n', '<leader>u', ":UndotreeToggle<CR>", { desc = '[U]ndo tree' })
    end,
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        columns = {
          "icon",
        },
        buf_options = {
          buflisted = false,
          bufhidden = "hide",
        },
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = false,
        skip_confirm_for_simple_edits = false,
        prompt_save_on_select_new_entry = true,
        cleanup_delay_ms = 2000,
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
        },
        use_default_keymaps = false,
        view_options = {
          show_hidden = true,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
          is_always_hidden = function(name, bufnr)
            return false
          end,
          sort = {
            { "type", "asc" },
            { "name", "asc" },
          },
        },
        float = {
          padding = 10,
          max_width = 0,
          max_height = 0,
          border = "rounded",
          win_options = {
            winblend = 1,
          },
          override = function(conf)
            return conf
          end,
        },
        preview = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = 0.9,
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          win_options = {
            winblend = 0,
          },
        },
        progress = {
          max_width = 0.9,
          min_width = { 40, 0.4 },
          width = nil,
          max_height = { 10, 0.9 },
          min_height = { 5, 0.1 },
          height = nil,
          border = "rounded",
          minimized_border = "none",
          win_options = {
            winblend = 0,
          },
        },
      })

      -- Oil keymaps
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Oil - Open parent directory" })
      vim.keymap.set("n", "_", function()
        local current_dir = vim.fn.expand('%:h')
        require("oil").open_float(current_dir)
      end, { desc = "Oil - Open current directory in float" })
    end,
  },
  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      open_browser_app = "open",
      open_browser_args = {},
      handlers = {
        plugin = true,
        github = true,
        brewfile = true,
        package_json = true,
        search = true,
      },
      handler_options = {
        search_engine = "google",
      },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    event = "VeryLazy",
  },
}
