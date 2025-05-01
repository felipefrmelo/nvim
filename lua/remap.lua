vim.g.mapleader = " "

-- Shortcuts for opening new files

vim.api.nvim_set_keymap('c', '%%', "<C-R>=fnameescape(expand('%:h')).'/'<cr>", { noremap = true, silent = false })

vim.api.nvim_set_keymap('n', '<leader>ew', ':e %%', { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<leader>es', ':sp %%', { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<leader>ev', ':vsp %%', { noremap = false, silent = false })
vim.api.nvim_set_keymap('n', '<leader>et', ':tabe %%', { noremap = false, silent = false })

vim.api.nvim_set_keymap('n', '<c-s>', ':write<cr>', {})


vim.api.nvim_set_keymap('n', '<C-b>', ':ls<CR>:b<Space>', {})
vim.api.nvim_set_keymap('n', '<Leader>h', ':bprevious<cr>', {})
vim.api.nvim_set_keymap('n', '<Leader>l', ':bnext<cr>', {})
vim.api.nvim_set_keymap('n', '<Leader>k', ':bfirst<cr>', {})
vim.api.nvim_set_keymap('n', '<Leader>j', ':blast<cr>', {})
vim.api.nvim_set_keymap('n', '<leader>cb', ':w <bar> %bd <bar> e# <bar> bd# <CR>', { silent = true })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })


-- Quick access to edit vim settings
vim.keymap.set('n', '<leader>sv', ':e $MYVIMRC | :cd %:p:h | Explore<CR>', { noremap = true, silent = true, desc = "Edit Vim settings" })

