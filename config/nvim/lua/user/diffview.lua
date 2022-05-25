local status_ok, diffview = pcall(require, "diffview")
if not status_ok then
	return
end

local cb = require("diffview.config").diffview_callback

diffview.setup()
