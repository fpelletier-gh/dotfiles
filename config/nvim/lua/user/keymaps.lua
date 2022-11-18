local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- line completion - use more!
keymap("i", "<c-l>", "<c-x><c-l>", { noremap = true })

-- Vim command-line completion
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

-- Useful maps
keymap("v", "J", ":m '>+1<CR>gv=gv", default_opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", default_opts)
keymap("n", "Y", "yg$", default_opts)
keymap("n", "n", "nzzzv", default_opts)
keymap("n", "N", "Nzzzv", default_opts)
keymap("n", "N", "Nzzzv", default_opts)
keymap("n", "J", "mzJ`z", default_opts)
keymap("n", "<C-d>", "<C-d>zz", default_opts)
keymap("n", "<C-u>", "<C-u>zz", default_opts)
keymap("n", "<leader>d", '"_d', default_opts)
keymap("v", "<leader>d", '"_d', default_opts)
keymap("n", "]q", "<cmd>cnext<CR>zz", default_opts)
keymap("n", "[q", "<cmd>cprev<CR>zz", default_opts)
keymap("n", "]w", "<cmd>lnext<CR>zz", default_opts)
keymap("n", "[w", "<cmd>lprev<CR>zz", default_opts)
keymap("n", "]b", "<cmd>bnext<CR>zz", default_opts)
keymap("n", "[b", "<cmd>bprev<CR>zz", default_opts)
keymap("n", "<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", default_opts)
keymap("n", "<leader>u", ":UndotreeToggle<CR>", default_opts)
keymap("n", "<leader>o", "o<Esc>", default_opts)
keymap("n", "<leader>O", "O<Esc>", default_opts)
keymap("n", "<C-j>", ":cnext<CR>zz", default_opts)
keymap("n", "<C-k>", ":cprev<CR>zz", default_opts)
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", default_opts)
keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", default_opts)

-- Harpoon
keymap("n", "<leader>aa", ":lua require('harpoon.mark').add_file()<CR>", default_opts)
keymap("n", "<leader>ah", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", default_opts)
keymap("n", "<leader>aj", ":lua require('harpoon.ui').nav_file(1)<CR>", default_opts)
keymap("n", "<leader>ak", ":lua require('harpoon.ui').nav_file(2)<CR>", default_opts)
keymap("n", "<leader>al", ":lua require('harpoon.ui').nav_file(3)<CR>", default_opts)
keymap("n", "<leader>an", ":lua require('harpoon.ui').nav_file(4)<CR>", default_opts)
keymap("n", "<leader>am", ":lua require('harpoon.ui').nav_file(5)<CR>", default_opts)
keymap("n", "<leader>a,", ":lua require('harpoon.ui').nav_file(6)<CR>", default_opts)
keymap("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", default_opts)
keymap("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", default_opts)
keymap("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", default_opts)
keymap("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", default_opts)
keymap("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", default_opts)

-- Harpoon terminal
keymap("n", "<leader>tr", ":lua require('harpoon.tmux').sendCommand(2, 'npm run dev')<CR>", default_opts)
keymap("n", "<leader>to", ":lua require('harpoon.tmux').gotoTerminal(2)<CR>", default_opts)
keymap("n", "<leader>tn", ":lua require('harpoon.tmux').gotoTerminal(3)<CR>", default_opts)

require("harpoon").setup({
	enter_on_sendcmd = false,
})

-- Symbol-outline
require("symbols-outline").setup({
	highlight_hovered_item = true,
	show_guides = true,
})
keymap("n", "<leader>so", ":SymbolsOutline<CR>", { noremap = true })

-- Terminal mapping
function _G.set_terminal_keymaps()
	local options = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], options)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], options)
	vim.keymap.set("t", "<C-o>", [[<C-\><C-n>]], options)
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
--[[ keymap("n", "<C-j>", "<C-w>j", opts) ]]
--[[ keymap("n", "<C-k>", "<C-w>k", opts) ]]
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate tabs
keymap("n", "]t", ":tabnext<CR>", opts)
keymap("n", "[t", ":tabprevious<CR>", opts)
keymap("n", "<leader>tt", ":tabnew<cr>", { noremap = true })

-- Navigate Gitsigns hunk
keymap("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
keymap("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- execute visual selection in node REPL
--[[ vim.api.nvim_buf_set_keymap(0, "v", "<leader>no", ":w !node -p<cr>", { noremap = false, silent = true }) ]]

-- wrap selection in JSON.stringify(*)
-- vim.api.nvim_buf_set_keymap(0, "v", ",js", [[cJSON.stringify(<c-r>"<esc>>]], { noremap = false })

-- wrap selection in console.log
keymap("v", "<leader>lo", 'cconsole.log(<c-r>")<esc>', { noremap = true })

-- Move text
keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
keymap("n", "<A-h>", "<<", opts)
keymap("n", "<A-l>", ">>", opts)

keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)
