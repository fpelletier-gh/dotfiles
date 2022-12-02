local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- Core plugins
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("kyazdani42/nvim-web-devicons")

	-- Utility plugins
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-tree.lua")
	use("ThePrimeagen/harpoon")
	use("lewis6991/impatient.nvim")
	use("simrat39/symbols-outline.nvim")
	use("rcarriga/nvim-notify")
	use("windwp/nvim-ts-autotag")
	use("tpope/vim-surround")
	use("junegunn/vim-easy-align")
	use("vim-test/vim-test")
	use("davidgranstrom/nvim-markdown-preview")
	vim.cmd([[
  let g:nvim_markdown_preview_theme = 'github'
  ]])
	use("mzlogin/vim-markdown-toc")
	use("mbbill/undotree")
	use("christoomey/vim-tmux-navigator")

	-- UI plugins
	use("nvim-lualine/lualine.nvim")

	-- Colorschemes
	use("lunarvim/darkplus.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-nvim-lua") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("tzachar/cmp-tabnine", { run = "./install.sh" })

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("onsails/lspkind-nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"benfowler/telescope-luasnip.nvim",
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("romgrk/nvim-treesitter-context")
	use("nvim-treesitter/playground")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")
	use("ThePrimeagen/git-worktree.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
