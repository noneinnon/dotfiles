-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = {{ 'filename', path = 1}},
    lualine_x = { 'filetype' },
    lualine_y = {},
    lualine_z = {}
  },
}
