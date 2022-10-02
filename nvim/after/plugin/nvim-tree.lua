local nvim_tree = require("nvim-tree")
local map = require("utils").map

nvim_tree.setup({
  disable_netrw = false,
  hijack_netrw = true,
  open_on_setup = false,
  ignore_ft_on_setup = {},
  open_on_tab = false,
  hijack_cursor = false,
  update_cwd = false,
  sync_root_with_cwd = false,
  hijack_directories = {
    auto_open = false,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    update_root = false,
    ignore_list = {},
  },
  system_open = {
    cmd = nil,
    args = {},
  },
  filters = {
    dotfiles = false,
    custom = {},
  },
  git = {
    enable = false,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 40,
    height = 30,
    hide_root_folder = false,
    side = "right",
    mappings = {
      custom_only = false,
      list = {
        { key = "H", action = "" }
      },
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes",
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    always_show_folders = false
  }
})

map("n", "<C-f>", "<cmd>NvimTreeFindFileToggle<CR>", { silent = true })
--map("n", "<H>","<Nop>")
--map("n", "<L>", "<Nop>")
