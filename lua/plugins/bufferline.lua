return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  keys = {
    { '<leader>bp', '<cmd>BufferLineTogglePin<cr>', desc = 'Toggle [B]uffer Pin' },
    { '<leader>bP', '<cmd>BufferLineGroupClose ungrouped<cr>', desc = 'Delete Non-Pinned [B]uffers' },
    { '<leader>bo', '<cmd>BufferLineCloseOthers<cr>', desc = 'Delete Other Buffers' },
    { '<leader>br', '<cmd>BufferLineCloseRight<cr>', desc = 'Delete [B]uffers to the [R]ight' },
    { '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', desc = 'Delete [B]uffers to the [L]eft' },
    { '<S-h>', '<cmd>BufferLineCyclePrev<cr>', desc = 'Prev Buffer' },
    { '<S-l>', '<cmd>BufferLineCycleNext<cr>', desc = 'Next Buffer' },
    { '<leader>bD', '<cmd>:bd<cr>', desc = 'Delete [B]uffer and Window' },
    { '<leader>bd', '<cmd>:bp<BAR>bd#<cr>', desc = 'Delete [B]uffer' },
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
