require("harpoon").setup()
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<C-q>", mark.add_file, {desc = "Harpoon Mark Add File"})
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Harpoon Toggle Quick Menu"})

vim.keymap.set("n", "1", function() ui.nav_file(1) end, {desc = "Harpoon Nav File 1"})
vim.keymap.set("n", "2", function() ui.nav_file(2) end, {desc = "Harpoon Nav File 2"})
vim.keymap.set("n", "3", function() ui.nav_file(3) end, {desc = "Harpoon Nav File 3"})
vim.keymap.set("n", "4", function() ui.nav_file(4) end, {desc = "Harpoon Nav File 4"})
