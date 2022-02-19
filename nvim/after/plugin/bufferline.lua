local map = require('utils').map

require("bufferline").setup{}

map('n', '<leader>[', '<cmd>BufferLineCyclePrev<CR>', { silent = true })
map('n', '<leader>]', '<cmd>BufferLineCycleNext<CR>', { silent = true })
