vim.g.mapleader = " "

-- Move to previous/next
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<leader>ah', ':BufferPrevious<CR>', opts)
map('n', '<leader>al', ':BufferNext<CR>', opts)
map('n', '<leader>a1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>a2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>a3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>a4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>a5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>a6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>a7', '<Cmd>BufferGoto 7<CR>', opts)

-- ウインドウ分割
map('n', '<leader>wv', ':vs<CR>', opts)
map('n', '<leader>wh', '<C-w>h', opts)
map('n', '<leader>wj', '<C-w>j', opts)
map('n', '<leader>wk', '<C-w>k', opts)
map('n', '<leader>wl', '<C-w>l', opts)

map('n', '<leader>wd', ':bd<CR>', opts)
map('n', '<leader>wc', ':close<CR>', opts)

-- ターミナルモード
map('n', '<leader>bo', '<Cmd>bo te<CR>', opts)
map('n', '<leader>i', ':terminal<CR>', opts)
map('t', '<leader>t', '<C-\\><C-n>', opts)
map('t', '<C-]>', [[<C-\><C-n>]], opts)

-- obisidan
map('n', '<leader>ol', '<Cmd>ObsidianLinks<CR>', opts)

-- toggleterm
map('n', '<leader>tt', '<Cmd>ToggleTerm direction=horizontal<CR>', opts)
map('n', '<leader>tf', '<Cmd>ToggleTerm direction=float<CR>', opts)
map('n', '<leader>ta', '<Cmd>ToggleTermToggleAll<CR>', opts)
