vim.opt.hidden = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = ""
vim.opt.inccommand = "split"
vim.opt.smartindent = true
vim.opt.updatetime = 250
vim.opt.hlsearch = false
vim.opt.history = 500
vim.opt.clipboard:append("unnamedplus")

vim.opt.termguicolors = true
vim.g.netrw_browse_split = 3
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 3
vim.g.cursorhold_updatetime = 200
vim.opt.laststatus = 3
vim.cmd('filetype plugin indent on')
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Select visual mode
vim.cmd([[ vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>]])

-- Scrolling
vim.opt.scrolloff = 8 -- Start scrolling when we're 8 lines away from margins
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 1

vim.o.exrc = true

vim.o.completeopt = "menu,menuone,noinsert,noselect,popup"

