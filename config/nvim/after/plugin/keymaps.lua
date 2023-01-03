local Remap = require("user.keymap")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local onoremap = Remap.onoremap

-- Find
nnoremap("<leader>;", "<cmd>lua require('telescope.builtin').buffers()<cr>")
nnoremap("<leader><leader>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>F", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>/", "<Cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>")
nnoremap("<leader>fa", "<cmd>lua require'telescope.builtin'.builtin{}<CR>") --All Builtin
nnoremap("<leader>fb", "<Cmd>lua require('telescope.builtin').colorscheme()<CR>") --Command history
nnoremap("<leader>fc", "<cmd>Telescope commands<cr>") --Commands
nnoremap("<leader>fC", "<Cmd>lua require('telescope.builtin').command_history()<CR>") --Command history
nnoremap("<leader>fe", "<Cmd>lua require'user.telescope'.find_configs()<CR>") --Find file in config dir
nnoremap("<leader>fE", "<Cmd>lua require'user.telescope'.file_explorer()<CR>") --File explorer ~
nnoremap("<leader>fd", "<Cmd>lua require'telescope.builtin'.diagnostics()<CR>") --Diagnostics
nnoremap("<leader>ff", "<Cmd>lua require'user.telescope'.document_symbols_filtered()<CR>") --Filtered document symbols
nnoremap("<leader>fF", "<Cmd>lua require'user.telescope'.workspace_symbols_filtered()<CR>") --Filtered Workspace symbols
nnoremap("<leader>fg", "<cmd>Telescope repo list<cr>") --Git repository
nnoremap("<leader>fh", ":Telescope harpoon marks<cr>") --Find harpoon marks
nnoremap("<leader>fH", "<cmd>Telescope help_tags<cr>") --Find Help
nnoremap("<leader>fi", "<Cmd>lua require'user.telescope'.project_files()<CR>") --Find Help
nnoremap("<leader>fk", "<cmd>Telescope keymaps<cr>") --Keymaps
nnoremap("<leader>fl", "<Cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>") --FZF :Lines (telescope)
nnoremap("<leader>fM", "<cmd>Telescope man_pages<cr>") --Man Pages
nnoremap("<leader>fn", "<Cmd>lua require'user.telescope'.find_configs()<CR>") --Nvim config
nnoremap("<leader>fN", "<Cmd>lua require'user.telescope'.browse_notes()<CR>") --Web dev Notes
nnoremap("<leader>fo", "<cmd>Telescope oldfiles<cr>") --Open Recent File
nnoremap("<leader>fr", "<Cmd>lua require'telescope.builtin'.lsp_references()<CR>") --Git Status (telescope)
nnoremap("<leader>fR", "<cmd>Telescope registers<cr>") --Registers
nnoremap("<leader>fs", "<Cmd>lua require'telescope.builtin'.spell_suggest()<CR>") --Spell suggest
nnoremap("<leader>fS", "<cmd>Telescope luasnip<cr>") --Snippets
nnoremap("<leader>fw", "<Cmd>lua require'user.telescope'.dynamic_workspace_symbols_filtered()<CR>") --Filtered dynamic Workspace symbols

-- Git
nnoremap("<leader>gg", "<Cmd>lua require'telescope.builtin'.git_status()<CR>") --Git Status (telescope)
nnoremap("<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>") --Next Hunk
nnoremap("<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>") --Prev Hunk
nnoremap("<leader>gl", "<Cmd>lua require'telescope.builtin'.git_commits()<CR>") --Log commits (telescope)
nnoremap("<leader>gB", "<cmd>lua require 'gitsigns'.blame_line()<cr>") --Blame
nnoremap("<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>") --Preview Hunk
nnoremap("<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>") --Reset Hunk
nnoremap("<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>") --Reset Buffer
nnoremap("<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>") --Stage Hunk
nnoremap("<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>") --Undo Stage Hunk
nnoremap("<leader>go", "<Cmd>lua require'telescope.builtin'.git_status()<CR>") --Open changed file
nnoremap(
	"<leader>gb",
	"<Cmd>lua require'telescope.builtin'.git_branches({prompt_title = ' ', results_title='Git Branches'})<CR>"
) --Branches (telescope)
nnoremap(
	"<leader>gc",
	"<Cmd>lua require'telescope.builtin'.git_bcommits({prompt_title = '  ', results_title='Git File Commits'})<CR>"
) --Buffer commit (telescope)
nnoremap("<leader>gd", "<cmd>DiffviewFileHistory %<cr>") --Diff history of current file
nnoremap("<leader>gD", "<cmd>DiffviewFileHistory<cr>") --Diff history

-- Test
nnoremap("<leader>js", ":TestSuite<CR>") --TestSuite
nnoremap("<leader>jf", ":TestFile<CR>") --TestFile
nnoremap("<leader>jn", ":TestNearest<CR>") --TestNearest
nnoremap("<leader>jl", ":TestLast<CR>") --TestLast
nnoremap("<leader>jv", ":TestVisit<CR>") --Open last run test un current buffer
nnoremap("<leader>ji", ":TestInfo<CR>") --Show info about the plugin

-- LSP
nnoremap("<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>") --Code Action
nnoremap("<leader>ld", "<cmd>tabnew | TroubleToggle document_diagnostics<cr>") --Document Diagnostics
nnoremap("<leader>lw", "<cmd>tabnew | TroubleToggle<cr>") --Workspace Diagnostics
nnoremap("<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>") --Format
nnoremap("<leader>li", "<cmd>LspInfo<cr>") --Info
nnoremap("<leader>lI", "<cmd>LspInstallInfo<cr>") --Installer Info
nnoremap("<leader>lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>") --Next Diagnostic
nnoremap("<leader>lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>") --Prev Diagnostic
nnoremap("<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>") --CodeLens Action
nnoremap("<leader>lq", "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>") --Quickfix
nnoremap("<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>") --Rename
nnoremap("<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>") --Document Symbols
nnoremap("<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>") --Workspace Symbols

-- Markdown
nnoremap("<leader>mp", ":MarkdownPreview<cr>") --Preview
nnoremap("<leader>mt", ":GenTocGFM<cr>") --Generate TOC (GFM)

-- Ripgrep
nnoremap("<leader>rb", ":Telescope builtin<CR>") --Search builtin
nnoremap("<leader>rc", "<Cmd>lua require'user.telescope'.search_nvim_config()<CR>") --Neovim config
nnoremap("<leader>rN", ":Telescope notify<CR>") --Search notifications
nnoremap("<leader>ro", "<Cmd>lua require'user.telescope'.search_old_nvim_config()<CR>") --Old Neovim config
nnoremap("<leader>rr", "<Cmd>lua require'telescope.builtin'.live_grep()<CR>") --Live grep
nnoremap("<leader>rs", "<Cmd>lua require'telescope.builtin'.grep_string()<CR>") --Grep string under cursor
nnoremap("<leader>rz", "<Cmd>lua require'user.telescope'.search_zsh_config()<CR>") --Zsh config

-- Nvim tree
nnoremap("<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Quickfix
nnoremap("<leader>cc", ":cclose | lclose<CR>")
nnoremap("<leader>co", ":copen<CR>")
nnoremap("<leader>cl", ":lopen<CR>")

-- line completion - use more!
inoremap("<c-l>", "<c-x><c-l>")

-- Vim command-line completion
inoremap("<c-v>", "<c-x><c-v>")

-- Easy align
nnoremap("ga", "<Plug>(EasyAlign)")
vnoremap("ga", "<Plug>(EasyAlign)")

-- Telescope grep_string for visual selection
vnoremap("<leader>rr", "y<ESC>:Telescope live_grep default_text=<c-r>0<CR>")

-- Inner-line around-line textobject
xnoremap("il", ":<c-u>normal! g_v^<cr>")
onoremap("il", ":<c-u>normal! g_v^<cr>")
vnoremap("al", ":<c-u>normal! $v0<cr>")
onoremap("al", ":<c-u>normal! $v0<cr>")

-- Useful maps
inoremap("<M-l>", "<esc><right>a")
inoremap("<M-h>", "<esc>i")
nnoremap("<M-l>", "zL")
nnoremap("<M-h>", "zH")
nnoremap("<zl>", "20zl")
nnoremap("<zh>", "20zh")
inoremap("<M-j>", "<esc><down>a")
inoremap("<M-k>", "<esc><up>a")
nnoremap("<leader>w", "<cmd>w<CR>")
nnoremap("<leader>q", "<cmd>q<CR>")
nnoremap("<leader>Q", "<cmd>qa<CR>")
nnoremap("<leader>z", "<cmd>tab split<CR>")
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")
nnoremap("Y", "yg$")
nnoremap("n", "nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("N", "Nzzzv")
nnoremap("J", "mzJ`z")
nnoremap("<C-d>", "<C-d>zz")
nnoremap("<C-u>", "<C-u>zz")
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')
nnoremap("]q", "<cmd>cnext<CR>zz")
nnoremap("[q", "<cmd>cprev<CR>zz")
nnoremap("]w", "<cmd>lnext<CR>zz")
nnoremap("[w", "<cmd>lprev<CR>zz")
nnoremap("]b", "<cmd>bnext<CR>zz")
nnoremap("[b", "<cmd>bprev<CR>zz")
nnoremap("<leader>ss", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
nnoremap("<leader>u", ":UndotreeToggle<CR>")
nnoremap("<leader>o", "o<Esc>")
nnoremap("<leader>O", "O<Esc>")
nnoremap("<leader>x", "<cmd>!chmod +x %<CR>")
nnoremap("<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
inoremap("<C-o>", "<esc>bgUiwea") -- Make last word uppercase insert mode

-- Harpoon
nnoremap("<leader>a", ":lua require('harpoon.mark').add_file()<CR>")
nnoremap("<leader>h", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
nnoremap("<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>")
nnoremap("<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>")
nnoremap("<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>")
nnoremap("<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>")
nnoremap("<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>")

local status_ok, harpoon = pcall(require, "harpoon")
if status_ok then
	harpoon.setup({
		enter_on_sendcmd = false,
	})
end

-- Symbol-outline
nnoremap("<leader>so", ":SymbolsOutline<CR>")

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
xnoremap("iu", ':lua require"treesitter-unit".select()<CR>')
xnoremap("au", ':lua require"treesitter-unit".select(true)<CR>')
onoremap("iu", ':<c-u>lua require"treesitter-unit".select()<CR>')
onoremap("au", ':<c-u>lua require"treesitter-unit".select(true)<CR>')

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate tabs
nnoremap("]t", ":tabnext<CR>")
nnoremap("[t", ":tabprevious<CR>")
nnoremap("<leader>tt", ":tabnew<cr>")

-- Navigate Gitsigns hunk
nnoremap("]g", "<cmd>Gitsigns next_hunk<CR>")
nnoremap("[g", "<cmd>Gitsigns prev_hunk<CR>")

-- execute visual selection in node REPL
--[[ vim.api.nvim_buf_set_keymap(0, "v", "<leader>no", ":w !node -p<cr>", { noremap = false, silent = true }) ]]

-- wrap selection in JSON.stringify(*)
-- vim.api.nvim_buf_set_keymap(0, "v", ",js", [[cJSON.stringify(<c-r>"<esc>>]], { noremap = false })

-- wrap selection in console.log
vnoremap("<leader>lo", 'cconsole.log(<c-r>")<esc>')

-- Move text
nnoremap("<A-j>", "<Esc>:m .+1<CR>")
nnoremap("<A-k>", "<Esc>:m .-2<CR>")
--[[ nnoremap("<A-h>", "<<") ]]
--[[ nnoremap("<A-l>", ">>") ]]

nnoremap("j", "gj")
nnoremap("k", "gk")

inoremap("jk", "<ESC>")

-- Visual --
-- Stay in indent mode
vnoremap("<", "<gv")
vnoremap(">", ">gv")
vnoremap("p", '"_dP')
