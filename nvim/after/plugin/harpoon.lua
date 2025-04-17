-- require("harpoon").setup()
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
-- vim.keymap.set("n", "<C-q>", mark.add_file, {desc = "Harpoon Mark Add File"})
-- vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, {desc = "Harpoon Toggle Quick Menu"})
--
-- vim.keymap.set("n", "1", function() ui.nav_file(1) end, {desc = "Harpoon Nav File 1"})
-- vim.keymap.set("n", "2", function() ui.nav_file(2) end, {desc = "Harpoon Nav File 2"})
-- vim.keymap.set("n", "3", function() ui.nav_file(3) end, {desc = "Harpoon Nav File 3"})
-- vim.keymap.set("n", "4", function() ui.nav_file(4) end, {desc = "Harpoon Nav File 4"})
local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "4", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
