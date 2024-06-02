return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  init = function()
    vim.api.nvim_create_autocmd('VimEnter', {
      pattern = '*',
      command = 'Neotree',
    })
  end,
  keys = {
    { '<leader>E', ':Neotree reveal<CR>', { desc = 'NeoTree reveal' } },
  },
  opts = {
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function(arg)
          vim.opt.relativenumber = true
        end,
      },
      {
        event = 'file_opened',
        handler = function(file_path)
          require('neo-tree.command').execute { action = 'close' }
        end,
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      window = {
        mappings = {
          ['<leader>E'] = 'close_window',
          ['J'] = function(state)
            local tree = state.tree
            local node = tree:get_node()
            local siblings = tree:get_nodes(node:get_parent_id())
            local renderer = require 'neo-tree.ui.renderer'
            renderer.focus_node(state, siblings[#siblings]:get_id())
          end,
          ['K'] = function(state)
            local tree = state.tree
            local node = tree:get_node()
            local siblings = tree:get_nodes(node:get_parent_id())
            local renderer = require 'neo-tree.ui.renderer'
            renderer.focus_node(state, siblings[1]:get_id())
          end,
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
  },
}
