-- By default rest.nvim does not have any key mappings so you will not have conflicts with any of your existing ones.
--
-- To run rest.nvim you should map the following commands:
--
-- <Plug>RestNvim, run the request under the cursor
-- <Plug>RestNvimPreview, preview the request cURL command
-- <Plug>RestNvimLast, re-run the last request

require("rest-nvim").setup({
  -- Open request results in a horizontal split
  result_split_horizontal = false,
  -- Keep the http file buffer above|left when split horizontal|vertical
  result_split_in_place = false,
  -- Skip SSL verification, useful for unknown certificates
  skip_ssl_verification = false,
  -- Encode URL before making request
  encode_url = true,
  -- Highlight request on run
  highlight = {
    enabled = true,
    timeout = 150,
  },
  result = {
    -- toggle showing URL, HTTP info, headers at top the of result window
    show_url = true,
    show_http_info = true,
    show_headers = true,
    -- executables or functions for formatting response body [optional]
    -- set them to nil if you want to disable them
    formatters = {
      json = "jq",
      html = function(body)
        return vim.fn.system({"tidy", "-i", "-q", "-"}, body)
      end
    },
  },
  -- Jump to request line on run
  jump_to_request = false,
  env_file = '.env',
  custom_dynamic_variables = {},
  yank_dry_run = true,
})


-- vim.keymap.set('n', '<leader><leader>r', require('rest-nvim').run_request, { desc = 'Make [r]equest' })
vim.keymap.set('n', '<leader><leader>r', "<Plug>RestNvim", { desc = 'Make [r]equest' })
-- vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
-- vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
-- vim.keymap.set('n', '<leader>ss', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
