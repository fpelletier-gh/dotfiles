local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w<CR>", "Save" },
	["q"] = { "<cmd>q<CR>", "Quit" },
	["Q"] = { "<cmd>qa<CR>", "Quit all" },
	[";"] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Telescope buffers" },
	["<leader>"] = {
		"<cmd>lua require('telescope.builtin').find_files()<cr>",
		"Find files",
	},
	["F"] = { "<cmd>Telescope live_grep<cr>", "Find Text" },
	["z"] = { "<cmd>tab split<CR>", "Zoom open current window in new tab" },
	["/"] = { "<Cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find()<CR>", "Buffer FZF" },

	c = {
		name = "Quickfix",
		c = { ":cclose | lclose<CR>", "Close quickfix" },
		o = { ":copen<CR>", "Open quickfix" },
		l = { ":lopen<CR>", "Open location list" },
	},

	f = {
		name = "Find (telescope)",
		a = { "<cmd>lua require'telescope.builtin'.builtin{}<CR>", "All Builtin" },
		b = {
			"<Cmd>lua require'telescope.builtin'.git_branches({prompt_title = ' ', results_title='Git Branches'})<CR>",
			"Checkout branch",
		},
		c = { "<cmd>Telescope commands<cr>", "Commands" },
		C = { "<Cmd>lua require('telescope.builtin').command_history()<CR>", "Command history" },
		e = { "<Cmd>lua require'user.telescope'.find_configs()<CR>", "Find file in config dir" },
		E = { "<Cmd>lua require'user.telescope'.file_explorer()<CR>", "File explorer ~" },
		d = { "<Cmd>lua require'telescope.builtin'.diagnostics()<CR>", "Colorscheme" },
		f = {
			"<Cmd>lua require'user.telescope'.document_symbols_filtered()<CR>",
			"Filtered document symbols",
		},
		F = {
			"<Cmd>lua require'user.telescope'.workspace_symbols_filtered()<CR>",
			"Filtered Workspace symbols",
		},
		g = { "<cmd>Telescope repo list<cr>", "Git repository" },
		h = { ":Telescope harpoon marks<cr>", "Find harpoon marks" },
		H = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		i = { "<Cmd>lua require'user.telescope'.project_files()<CR>", "Find Help" },
		l = {
			"<Cmd>lua require('telescope.builtin').live_grep({grep_open_files=true})<CR>",
			"FZF :Lines (telescope)",
		},
		n = { "<Cmd>lua require'user.telescope'.find_configs()<CR>", "Nvim config" },
		N = { "<Cmd>lua require'user.telescope'.browse_notes()<CR>", "Web dev Notes" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		s = { "<Cmd>lua require'telescope.builtin'.spell_suggest()<CR>", "Spell suggest" },
		S = { "<cmd>Telescope luasnip<cr>", "Snippets" },
		R = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		r = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		w = {
			"<Cmd>lua require'user.telescope'.dynamic_workspace_symbols_filtered()<CR>",
			"Filtered dynamic Workspace symbols",
		},
	},

	g = {
		name = "Git",
		g = { "<Cmd>lua require'telescope.builtin'.git_status()<CR>", "Git Status (telescope)" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<Cmd>lua require'telescope.builtin'.git_commits()<CR>", "Log commits (telescope)" },
		B = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<Cmd>lua require'telescope.builtin'.git_status()<CR>", "Open changed file" },
		b = {
			"<Cmd>lua require'telescope.builtin'.git_branches({prompt_title = ' ', results_title='Git Branches'})<CR>",
			"Branches (telescope)",
		},
		c = {
			"<Cmd>lua require'telescope.builtin'.git_bcommits({prompt_title = '  ', results_title='Git File Commits'})<CR>",
			"Buffer commit (telescope)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
		D = {
			"<cmd>DiffviewFileHistory<cr>",
			"Diff",
		},
	},

	j = {
		name = "Test",
		s = { ":TestSuite<CR>", "TestSuite" },
		f = { ":TestFile<CR>", "TestFile" },
		n = { ":TestNearest<CR>", "TestNearest" },
		l = { ":TestLast<CR>", "TestLast" },
		v = { ":TestVisit<CR>", "Open last run test un current buffer" },
		i = { ":TestInfo<CR>", "Show info about the plugin" },
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>tabnew | TroubleToggle document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>tabnew | TroubleToggle<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	m = {
		name = "Markdown",
		p = { ":MarkdownPreview<cr>", "Preview" },
		t = { ":GenTocGFM<cr>", "Generate TOC (GFM)" },
	},

	r = {
		name = "Ripgrep",
		b = { ":Telescope builtin<CR>", "Search builtin" },
		c = { "<Cmd>lua require'user.telescope'.search_nvim_config()<CR>", "Neovim config" },
		N = { ":Telescope notify<CR>", "Search notifications" },
		o = { "<Cmd>lua require'user.telescope'.search_old_nvim_config()<CR>", "Old Neovim config" },
		r = { "<Cmd>lua require'telescope.builtin'.live_grep()<CR>", "Live grep" },
		s = { "<Cmd>lua require'telescope.builtin'.grep_string()<CR>", "Grep string under cursor" },
		z = { "<Cmd>lua require'user.telescope'.search_zsh_config()<CR>", "Zsh config" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
