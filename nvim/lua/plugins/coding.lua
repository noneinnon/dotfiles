return {
  -- Database tools
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod', lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      vim.g.db_ui_use_nerd_fonts = 1
    end,
    config = function()
      vim.keymap.set('n', '<leader>db', ':DBUIToggle<CR>', { desc = 'Database UI' })
    end,
  },

  -- Lisp development
  {
    'tpope/vim-sexp-mappings-for-regular-people',
    ft = { "clojure", "fennel", "lisp", "scheme" },
  },
  {
    'guns/vim-sexp',
    ft = { "clojure", "fennel", "lisp", "scheme" },
  },
  {
    'Olical/conjure',
    ft = { "clojure", "fennel", "lisp", "scheme" },
  },

  -- Web development
  {
    'mattn/emmet-vim',
    ft = { "html", "css", "javascript", "typescript", "jsx", "tsx", "vue", "svelte" },
  },

  -- Terminal/REPL integration
  {
    'jpalardy/vim-slime',
    event = "VeryLazy",
    config = function()
      -- Slime configuration
      vim.g.slime_target = "tmux"
      vim.g.slime_paste_file = vim.fn.expand("$HOME/.slime_paste")
      vim.g.slime_default_config = {socket_name = "default", target_pane = "{right-of}"}
      vim.g.slime_no_mappings = 1
      vim.g.slime_dont_ask_default = 1

      -- Slime keymaps
      vim.keymap.set('x', ',s', '<Plug>SlimeRegionSend', { desc = 'Slime send region' })
      vim.keymap.set('n', ',s', '<Plug>SlimeParagraphSend', { desc = 'Slime send paragraph' })
      vim.keymap.set('n', ',v', '<Plug>SlimeConfig', { desc = 'Slime config' })
    end,
  },

  -- Legacy plugin manager (remove if not needed)
  {
    'wbthomason/packer.nvim',
    enabled = false, -- Disable since we're using Lazy
  },
}
