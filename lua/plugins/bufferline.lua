return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<Cmd>BufferLineTogglePin<CR>', desc = 'Toggle Pin' },
    { '<leader>bP', '<Cmd>BufferLineGroupClose ungrouped<CR>', desc = 'Delete Non-Pinned Buffers' },
    { '<leader>bo', '<Cmd>BufferLineCloseOthers<CR>', desc = 'Delete Other Buffers' },
    { '<leader>br', '<Cmd>BufferLineCloseRight<CR>', desc = 'Delete Buffers to the Right' },
    { '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', desc = 'Delete Buffers to the Left' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '[b', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { ']b', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
  },
  opts = {
    options = {
      -- stylua: ignore
      -- close_command = function(n) LazyVim.ui.bufremove(n) end,
      -- stylua: ignore
      -- right_mouse_command = function(n) LazyVim.ui.bufremove(n) end,
    diagnostics = 'nvim_lsp',
      left_mouse_command = 'buffer %d', -- can be a string | function, | false see "Mouse actions"
      buffer_close_icon = '󰅖',
      always_show_bufferline = true,
      hover = {
        enabled = true,
        delay = 200,
        reveal = { 'close' },
      },
      diagnostics_indicator = function(count, level)
        local icon = level:match 'error' and ' ' or ''
        return ' ' .. icon .. count
      end,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'Neo-tree',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
  -- config = function(_, opts)
  --   require('bufferline').setup(opts)
  -- Fix bufferline when restoring a session
  -- vim.api.nvim_create_autocmd({ 'BufAdd', 'BufDelete' }, {
  -- callback = function()
  -- vim.schedule(function()
  -- pcall(nvim_bufferline)
  --       end)
  --     end,
  --   })
  -- end,
}
