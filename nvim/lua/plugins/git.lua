return {
  {
    'tpope/vim-fugitive',
    cmd = { "Git", "Gdiff", "Gclog", "Gblame" },
  },
  {
    'tpope/vim-rhubarb',
    dependencies = { 'tpope/vim-fugitive' },
    cmd = { "GBrowse" },
  },
}
