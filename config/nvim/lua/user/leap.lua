local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

leap.setup({
	case_insensitive = true,
	-- These keys are captured directly by the plugin at runtime.
	special_keys = {
		repeat_search = "<enter>",
		next_match = "<enter>",
		prev_match = "<tab>",
		next_group = "<space>",
		prev_group = "<tab>",
		eol = "<space>",
	},
})

require("leap").set_default_keymaps()
