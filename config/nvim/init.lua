local status_ok = pcall(require, "impatient")
if not status_ok then
	return
end

require("user.options")
require("user.plugins")
require("user.colorscheme")
require("user.cmp")
require("user.lsp")
require("user.telescope")
require("user.symbols-outline")
require("user.treesitter")
require("user.autopairs")
require("user.comment")
require("user.gitsigns")
require("user.nvim-tree")
require("user.nvim-ts-autotag")
require("user.diffview")
require("user.lualine")
require("user.autocommands")
require("user.luasnip")
