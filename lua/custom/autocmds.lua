-- When running ':Man' command, focus on window
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'man',
  callback = function()
    vim.cmd 'only'
  end,
})
