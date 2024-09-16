-- https://github.com/David-Kunz/gen.nvim
vim.keymap.set({ 'n', 'v' }, '<leader>e', ':Gen<CR>')

-- https://github.com/David-Kunz/gen.nvim/blob/main/lua/gen/prompts.lua
vim.keymap.set('v', '<leader>e', ':Gen Enhance_Grammar_Spelling<CR>')

require('gen').prompts['Elaborate_Text'] = {
  prompt = "Elaborate the following text:\n$text",
  replace = true
}

require('gen').prompts['Fix_Code'] = {
  prompt = "Fix the following code. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}

require('gen').prompts['Custom_Generate'] = {
  prompt = "Generate code based on following: $input. Only ouput the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
  replace = true,
  extract = "```$filetype\n(.-)```"
}
