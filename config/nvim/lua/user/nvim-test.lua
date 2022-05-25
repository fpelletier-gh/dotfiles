local status_ok, nvimtest = pcall(require, "nvim-test")
if not status_ok then
	return
end

nvimtest.setup({
	commands_create = true, -- create commands (TestFile, TestLast, ...)
	silent = false, -- less notifications
	run = true, -- run test commands
	term = "terminal", -- a terminal to run (terminal|toggleterm)
	termOpts = {
		direction = "vertical", -- terminal's direction (horizontal|vertical|float)
		width = 86, -- terminal's width (for vertical|float)
		height = 24, -- terminal's height (for horizontal|float)
		go_back = false, -- return focus to original window after executing
		stopinsert = false, -- exit from insert mode
	},
	runners = {
		javascript = "nvim-test.runners.jest",
		lua = "nvim-test.runners.busted",
	},
})
