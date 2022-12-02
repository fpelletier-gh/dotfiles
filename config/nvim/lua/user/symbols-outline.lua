local status_ok, symbols_outline = pcall(require, "symbols-outline")
if not status_ok then
	return
end

symbols_outline.setup({
	highlight_hovered_item = true,
	show_guides = true,
	symbols = {
		File = { hl = "@text.uri" },
		Module = { hl = "@namespace" },
		Namespace = { hl = "@namespace" },
		Package = { hl = "@namespace" },
		Class = { hl = "@type" },
		Method = { hl = "@method" },
		Property = { hl = "@method" },
		Field = { hl = "@field" },
		Constructor = { hl = "@constructor" },
		Enum = { hl = "@type" },
		Interface = { hl = "@type" },
		Function = { hl = "@function" },
		Variable = { hl = "@constant" },
		Constant = { hl = "@constant" },
		String = { hl = "@string" },
		Number = { hl = "@number" },
		Boolean = { hl = "@boolean" },
		Array = { hl = "@constant" },
		Object = { hl = "@type" },
		Key = { hl = "@type" },
		Null = { hl = "@type" },
		EnumMember = { hl = "@field" },
		Struct = { hl = "@type" },
		Event = { hl = "@type" },
		Operator = { hl = "@operator" },
		TypeParameter = { hl = "@parameter" },
	},
})
