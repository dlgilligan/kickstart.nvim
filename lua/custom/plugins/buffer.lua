vim.keymap.set('n', '<Tab>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>b', function()
  require('mini.bufremove').delete(0, false)
end, { desc = 'Delete buffer without focus loss' })

return {
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {
        options = {
          node = 'buffers',
          diagnostics = 'nvim_lsp',
          show_buffer_close_icons = true,
          show_close_icon = true,
          seperator_style = 'slant',
          offsets = {
            {
              filetype = 'neo-tree',
              text = 'File Explorer',
              highlight = 'Directory',
              text_align = 'center',
            },
          },
          close_command = function(n)
            require('mini.bufremove').delete(n, false)
          end,
          right_mouse_command = function(n)
            require('mini.bufremove').delete(n, false)
          end,
        },
      }
      vim.opt.termguicolors = true
      vim.opt.showtabline = 2
    end,
  },
  {
    'echasnovski/mini.bufremove',
    version = '*',
    config = function()
      require('mini.bufremove').setup()
    end,
  },
}
