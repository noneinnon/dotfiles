if !exists('g:loaded_nvim_treesitter')
  echom "Not loaded treesitter"
  finish
endif

lua <<EOF
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  },
  refactor = {
    --highlight_current_scope = { enable = true },
    smart_rename = {
    enable = true,
    keymaps = {
      smart_rename = "grr",
      },
    },
  navigation = {
  enable = true,
  keymaps = {
    goto_definition = "gnd",
    list_definitions = "gnD",
    list_definitions_toc = "gO",
    goto_next_usage = "<M-*>",
    goto_previous_usage = "<M-#>",
    },
  },
},
  highlight = {
    enable = true,
    clear_on_cursor_move = true,
  },
  indent = {
    enable = false,
  },
  ensure_installed = {
    "tsx",
    "toml",
    "json",
    "yaml",
    "html",
    "scss",
    "javascript"
    },
  }



local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
EOF
