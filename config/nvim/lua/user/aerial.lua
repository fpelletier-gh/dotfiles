local status_ok, aerial = pcall(require, "aerial")
if not status_ok then
	return
end

aerial.setup({ width = 50, filter_kind = { "Function", "Constant", "Variable" } })
