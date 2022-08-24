local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- line completion - use more!
-- inoremap <C-l> <C-x><C-l>
keymap("i", "<c-l>", "<c-x><c-l>", { noremap = true })
-- Vim command-line completion
-- inoremap <C-v> <C-x><C-v>
keymap("i", "<c-v>", "<c-x><c-v>", { noremap = true })

-- Easy align
keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = false })
keymap("v", "ga", "<Plug>(EasyAlign)", { noremap = false })

-- Telescope grep_string for visual selection
local default_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("v", "<leader>rr", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>", default_opts)

-- Inner-line around-line textobject
vim.cmd([[
    xnoremap <silent> il :<c-u>normal! g_v^<cr>
    onoremap <silent> il :<c-u>normal! g_v^<cr>
    vnoremap <silent> al :<c-u>normal! $v0<cr>
    onoremap <silent> al :<c-u>normal! $v0<cr>

]])

-- Ts-hint-textobject mappings
vim.cmd([[
  omap     <silent> m :<C-U>lua require('tsht').nodes()<CR>
  vnoremap <silent> m :lua require('tsht').nodes()<CR>
]])

-- Zoom
keymap("n", "<leader>z", "<Plug>Zoom", { noremap = false })

-- Terminal mapping
function _G.set_terminal_keymaps()
	local options = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], options)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], options)
	vim.keymap.set("t", "<C-o>", [[<C-\><C-n>]], options)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], options)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], options)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], options)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], options)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- treesitter-unit select maps
keymap("x", "iu", ':lua require"treesitter-unit".select()<CR>', { noremap = true })
keymap("x", "au", ':lua require"treesitter-unit".select(true)<CR>', { noremap = true })
keymap("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true })
keymap("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true })

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- -- Navigate tabs
keymap("n", "]t", ":tabnext<CR>", opts)
keymap("n", "[t", ":tabprevious<CR>", opts)

-- Navigate Gitsigns hunk
keymap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
keymap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- Move text
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
keymap("n", "<A-h>", "<<", opts)
keymap("n", "<A-l>", ">>", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
