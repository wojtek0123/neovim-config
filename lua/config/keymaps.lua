vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- join lines
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

vim.keymap.set('n', '<leader>wd', '<C-W>c', { desc = '[W]indow [D]elete', remap = true })
vim.keymap.set('n', '<leader>wh', '<C-W>s', { desc = 'Split [W]indow [H]orizontal', remap = true })
vim.keymap.set('n', '<leader>wv', '<C-W>v', { desc = 'Split [W]indow [V]ertical', remap = true })

vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- Move normally between wrapped lines
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Space + Space to clean search highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', { silent = true })

-- Fixes pasting after visual selection.
vim.keymap.set('v', 'p', '"_dP')

-- Resize window using <shift> arrow keys
vim.keymap.set('n', '<S-Up>', '<cmd>resize +2<CR>', { silent = true, desc = 'Increase horizontal size by 2' })
vim.keymap.set('n', '<S-Down>', '<cmd>resize -2<CR>', { silent = true, desc = 'Decrease horizontal  size by 2' })
vim.keymap.set('n', '<S-Left>', '<cmd>vertical resize -2<CR>', { silent = true, desc = 'Increase veritacal size by 2' })
vim.keymap.set('n', '<S-Right>', '<cmd>vertical resize +2<CR>', { silent = true, desc = 'Decrease vertical size by 2' })

vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

vim.keymap.set('x', '<leader>p', [["_dP]])

vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

vim.keymap.set('i', '<C-c>', '<Esc>')
