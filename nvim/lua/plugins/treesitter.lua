return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup {
        sync_install = false,
        ignore_install = {},
        modules = {},
        auto_install = false,
        autotag = {
          enable = true
        },
        ensure_installed = {
          'html', 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'bash', 'sql', 'json', 'clojure', 'javascript',
          'vim', 'yaml'
        },
        highlight = {
          enable = true,
          disable = function(_, buf)
            local max_filesize = 100 * 1024   -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        indent = { enable = true, disable = { 'python' } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['aa'] = '@parameter.outer',
              ['ia'] = '@parameter.inner',
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = '@parameter.inner',
            },
            swap_previous = {
              ['<leader>A'] = '@parameter.inner',
            },
          },
        },
      }
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {},
  },
}
