return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('i', '<C-a>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
    })
    vim.g.copilot_no_tab_map = true
    vim.keymap.set('i', '<C-w>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<C-d>', '<Plug>(copilot-dismiss)')
  end,
}
