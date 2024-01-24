local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

nvim_tree.setup({
view = {
		width = 40,
		relativenumber = true,
	},
	update_focused_file = {
		enable = true,
	},
	filters = {
		git_ignored = false,
		dotfiles = false,
		git_clean = false,
		no_buffer = false,
		no_bookmark = false,
		custom = {},
		exclude = {},
	},
	actions = {
		use_system_clipboard = true,
		open_file = {
			quit_on_open = true,
			resize_window = false,
		},
	},
})
