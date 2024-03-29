local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		prompt_prefix = " >",
		path_display = { "smart" },
		sorting_strategy = "ascending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
		},
		mappings = {
			i = {
				["<C-l>"] = actions.cycle_history_next,
				["<C-h>"] = actions.cycle_history_prev,
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	pickers = {
		colorscheme = {
			enable_preview = true,
		},
	},
	extensions = {
		file_browser = {
			hidden = true,
		},
	},
})

telescope.load_extension("luasnip")
telescope.load_extension("harpoon")
telescope.load_extension("file_browser")
telescope.load_extension("git_worktree")

local M = {}

function M.dynamic_workspace_symbols_filtered()
	local opts = {}
	opts.file_ignore_patterns = {
		"node_modules",
	}
	if vim.bo.filetype == "vim" then
		opts.symbols = { "function" }
	end
	require("telescope.builtin").lsp_dynamic_workspace_symbols(opts)
end

function M.workspace_symbols_filtered()
	local opts = {
		-- symbols = {
		-- 	"function",
		-- 	"constant",
		-- },
	}
	opts.file_ignore_patterns = {
		"node_modules",
	}
	if vim.bo.filetype == "vim" then
		opts.symbols = { "function" }
	end
	require("telescope.builtin").lsp_workspace_symbols(opts)
end

-- requires repo extension
function M.repo_list()
	local opts = {}
	opts.prompt_title = " Repos"
	require("telescope").extensions.repo.list(opts)
end

-- requires GitHub extension
function M.gh_issues()
	local opts = {}
	opts.prompt_title = " Issues"
	require("telescope").extensions.gh.issues(opts)
end

function M.gh_prs()
	local opts = {}
	opts.prompt_title = " Pull Requests"
	require("telescope").extensions.gh.pull_request(opts)
end
-- end github functions

-- grep_string pre-filtered from grep_prompt
local function grep_filtered(opts)
	opts = opts or {}
	require("telescope.builtin").grep_string({
		path_display = { "smart" },
		search = opts.filter_word or "",
	})
end

-- open vim.ui.input dressing prompt for initial filter
function M.grep_prompt()
	vim.ui.input({ prompt = "Rg " }, function(input)
		grep_filtered({ filter_word = input })
	end)
end

-- search projects
function M.search_projects()
	require("telescope.builtin").grep_string({
		prompt_title = "Search projects",
		path_display = { "smart" },
		search_dirs = {
			"~/projects/",
		},
	})
end

-- search notes
function M.search_notes()
	require("telescope.builtin").grep_string({
		prompt_title = "Search Notes",
		path_display = { "smart" },
		search_dirs = {
			"~/projects/web-development-notes/posts/",
		},
	})
end

-- search Neovim config
function M.search_nvim_config()
	require("telescope.builtin").grep_string({
		prompt_title = "Search Neovim config",
		path_display = { "smart" },
		search_dirs = {
			"~/.dotfiles/config/nvim/",
		},
	})
end

-- search zsh config
function M.search_zsh_config()
	require("telescope.builtin").grep_string({
		prompt_title = "Search zsh config",
		path_display = { "smart" },
		search_dirs = {
			"~/.dotfiles/zsh/",
		},
	})
end

-- search old Neovim config
function M.search_old_nvim_config()
	require("telescope.builtin").grep_string({
		prompt_title = "Search Old Neovim config",
		path_display = { "smart" },
		search_dirs = {
			"~/.dotfiles/config/oldnvim/",
		},
	})
end

-- search Neovim related todos
function M.search_todos()
	require("telescope.builtin").grep_string({
		prompt_title = " Search TODOUAs",
		prompt_prefix = " ",
		results_title = "Neovim TODOUAs",
		path_display = { "smart" },
		search = "TODOUA",
	})
end

-- grep Neovim source using cword
function M.grep_nvim_src()
	require("telescope.builtin").grep_string({
		results_title = "Neovim Source Code",
		path_display = { "smart" },
		search_dirs = {
			"~/vim-dev/sources/neovim/runtime/lua/vim/",
			"~/vim-dev/sources/neovim/src/nvim/",
		},
	})
end

M.project_files = function()
	local _, ret, stderr = require("user.utils").get_os_command_output({
		"git",
		"rev-parse",
		"--is-inside-work-tree",
	})

	local gopts = {}
	local fopts = {}

	gopts.prompt_title = " Find"
	gopts.prompt_prefix = "  "
	gopts.results_title = " Repo Files"

	fopts.hidden = true
	fopts.file_ignore_patterns = {
		".vim/",
		".local/",
		".cache/",
		"Downloads/",
		".git/",
		"Dropbox/.*",
		"Library/.*",
		".rustup/.*",
		"Movies/",
		".cargo/registry/",
	}

	if ret == 0 then
		require("telescope.builtin").git_files(gopts)
	else
		fopts.results_title = "CWD: " .. vim.fn.getcwd()
		require("telescope.builtin").find_files(fopts)
	end
end

-- @TODOUA: break up notes and configs
function M.grep_notes()
	local opts = {}
	opts.hidden = true
	opts.search_dirs = {
		"~/notes/",
	}
	opts.prompt_prefix = "   "
	opts.prompt_title = " Grep Notes"
	opts.path_display = { "smart" }
	require("telescope.builtin").live_grep(opts)
end

function M.find_notes()
	require("telescope.builtin").find_files({
		prompt_title = " Find Notes",
		path_display = { "smart" },
		cwd = "~/notes/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

function M.browse_notes()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " Browse Notes",
		prompt_prefix = " ﮷ ",
		cwd = "~/projects/web-development-notes/posts/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

function M.find_configs()
	require("telescope.builtin").find_files({
		prompt_title = " NVim & Term Config Find",
		results_title = "Config Files Results",
		path_display = { "smart" },
		search_dirs = {
			"~/.dotfiles",
		},
		-- cwd = "~/.config/nvim/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

function M.nvim_config()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " NVim Config Browse",
		cwd = "~/.config/nvim/",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

function M.file_explorer()
	require("telescope").extensions.file_browser.file_browser({
		prompt_title = " File Browser",
		path_display = { "smart" },
		cwd = "~",
		layout_strategy = "horizontal",
		layout_config = { preview_width = 0.65, width = 0.75 },
	})
end

return M
