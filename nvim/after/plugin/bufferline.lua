local map = require('utils').map

require("bufferline").setup{}

map('n', '[b', '<cmd>BufferLineCyclePrev<CR>', { silent = true })
map('n', ']b', '<cmd>BufferLineCycleNext<CR>', { silent = true })
