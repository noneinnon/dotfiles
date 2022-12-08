local map = require("utils").map

map("n", "+", "<C-a>")
map("n", "-", "<C-x>")
map("n", "<leader>O", "<cmd>lua require('notes').openNotes('vsplit', '/todo.md')<CR>")

