local harpoon = require('harpoon')
local map = require("utils").map

harpoon.setup{}

map("n", "<leader>1", "<cmd>lua require('harpoon.mark').add_file()<CR>", { silent = true })
map("n", "<leader>2", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", { silent = true })

