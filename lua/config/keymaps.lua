vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<leader>ra', '<cmd>LspStart angularls<CR>', { desc = 'Start angular language server' })

-- join lines
vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")

-- vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

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

-- Don't copy the replaced text after pasting in visual mode
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Copy to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Cut to system clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])

-- Paste from system clipboard
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Organize Imports
vim.api.nvim_set_keymap('n', '<leader>oi', '<cmd>lua OrganizeImports()<CR>', { noremap = true, silent = true })
