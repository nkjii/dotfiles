vim.g.mapleader = " "

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map('i', 'kj', '<ESC>', opts)

-- Move to previous/next
map('n', '<leader>h', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>l', '<Cmd>BufferNext<CR>', opts)
map('n', '<leader>a1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>a2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>a3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>a4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>a5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>a6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>a7', '<Cmd>BufferGoto 7<CR>', opts)

-- バッファ
map('n', '<leader>q', ':BufferClose<CR>', opts)

-- ウインドウ分割
map('n', '<leader>wv', ':vs<CR>', opts)
map('n', '<leader>wh', '<C-w>h', opts)
map('n', '<leader>wj', '<C-w>j', opts)
map('n', '<leader>wk', '<C-w>k', opts)
map('n', '<leader>wl', '<C-w>l', opts)
map('n', '<C-w>1', '1<C-w>w', opts)
map('n', '<C-w>2', '2<C-w>w', opts)
map('n', '<C-w>3', '3<C-w>w', opts)
map('n', '<C-w>4', '4<C-w>w', opts)
map('n', '<C-w>5', '5<C-w>w', opts)

map('n', '<leader>wd', ':bd<CR>', opts)
map('n', '<leader>wc', ':close<CR>', opts)

-- ウインドウリサイズ
map('n' , '<leader>+', '<cmd>vertical resize +5<CR>', opts)
-- 指定したウインドウ番号の幅を30に設定する関数
local function resize_window(win_num, width)
  vim.api.nvim_win_set_width(vim.fn.win_getid(win_num), width)
end

-- キーマッピングを設定
vim.api.nvim_set_keymap('n', '<leader>r', ':call nvim_win_set_width(0, 30)<CR>', { noremap = true, silent = true })

-- ターミナルモード
map('n', '<leader>bo', '<Cmd>bo te<CR>', opts)
map('n', '<leader>i', ':terminal<CR>', opts)
map('t', '<C-]>', [[<C-\><C-n>]], opts)

-- obisidan
map('n', '<leader>ol', '<Cmd>ObsidianLinks<CR>', opts)

-- toggleterm
map('n', '<leader>tt', '<Cmd>ToggleTerm direction=horizontal<CR>', opts)
map('n', '<leader>tf', '<Cmd>ToggleTerm direction=float<CR>', opts)
map('n', '<leader>ta', '<Cmd>ToggleTermToggleAll<CR>', opts)

-- nvim-tree
map('n', '<leader>bb', '<Cmd>NvimTreeToggle<CR>', opts)
map('n', '<leader>bf', '<Cmd>NvimTreeFindFile<CR> :call nvim_win_set_width(0, 30)<CR>', opts)

map('n', '<leader>o', '<Cmd>Oil<CR>', opts)

-- trouble
map('n', 'gl', '<Cmd>Trouble diagnostics toggle<CR>', opts)

-- copilot
map('n', '<C-c>o', '<Cmd>CopilotChatToggle<CR>', opts)
map('i', '<C-c>o', '<Cmd>CopilotChatToggle<CR>', opts)
