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

    { '<leader>X', '<cmd>:bd<cr>', desc = 'Close [B]uffer and Window' },
    { '<leader>x', '<cmd>:bp<BAR>bd#<cr>', desc = 'Close [B]uffer' },
    { '<leader>1', "<cmd>lua require('bufferline').go_to_buffer(1)<CR>", desc = 'Go to Buffer' },
    { '<leader>2', "<cmd>lua require('bufferline').go_to_buffer(2)<CR>", desc = 'Go to Buffer' },
    { '<leader>3', "<cmd>lua require('bufferline').go_to_buffer(3)<CR>", desc = 'Go to Buffer' },
    { '<leader>4', "<cmd>lua require('bufferline').go_to_buffer(4)<CR>", desc = 'Go to Buffer' },
    { '<leader>5', "<cmd>lua require('bufferline').go_to_buffer(5)<CR>", desc = 'Go to Buffer' },
    { '<leader>6', "<cmd>lua require('bufferline').go_to_buffer(6)<CR>", desc = 'Go to Buffer' },
    { '<leader>7', "<cmd>lua require('bufferline').go_to_buffer(7)<CR>", desc = 'Go to Buffer' },
    { '<leader>8', "<cmd>lua require('bufferline').go_to_buffer(8)<CR>", desc = 'Go to Buffer' },
    { '<leader>9', "<cmd>lua require('bufferline').go_to_buffer(9)<CR>", desc = 'Go to Buffer' },
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
