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
  },

  -- Legacy plugin manager (remove if not needed)
  {
    'wbthomason/packer.nvim',
    enabled = false, -- Disable since we're using Lazy
  },
}
