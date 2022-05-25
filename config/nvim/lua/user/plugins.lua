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
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("nvim-lualine/lualine.nvim")
	-- use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")
	use("rcarriga/nvim-notify")
	use("stevearc/dressing.nvim")
	use("karb94/neoscroll.nvim")
	use("windwp/nvim-ts-autotag")
	use("petertriho/nvim-scrollbar")
	use("p00f/nvim-ts-rainbow")
	use("rmagatti/auto-session")
	use("folke/trouble.nvim")
	use("stevearc/aerial.nvim")
	use("tpope/vim-surround")
	use("tpope/vim-repeat")
	use("tpope/vim-unimpaired")
	use("tpope/vim-eunuch")
	use("tpope/vim-abolish")
	use("junegunn/vim-easy-align")
	use("pbrisbin/vim-mkdir")
	use("andymass/vim-matchup")
	use("folke/lua-dev.nvim")
	use("luukvbaal/stabilize.nvim")
	use("kosayoda/nvim-lightbulb")
	-- use("beauwilliams/focus.nvim")
	use("sudormrfbin/cheatsheet.nvim")
	use({
		"bennypowers/nvim-regexplainer",
		requires = {
			"MunifTanjim/nui.nvim",
		},
	})
	use("lewis6991/spellsitter.nvim")
	use({
		"AckslD/nvim-neoclip.lua",
		requires = {
			{ "tami5/sqlite.lua", module = "sqlite" },
		},
	})
	use("axieax/urlview.nvim")
	use("famiu/bufdelete.nvim")
	use("ggandor/leap.nvim")
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
	use({
		"klen/nvim-test",
		config = function() end,
	})
	require("packer").use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use("dbeniamine/cheat.sh-vim")
	use("kassio/neoterm")
	vim.cmd([[
    let g:neoterm_default_mod='botright vertical'
    let g:neoterm_autoscroll=1
  ]])

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("lunarvim/darkplus.nvim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("hrsh7th/cmp-nvim-lua") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("f3fora/cmp-spell")

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use("onsails/lspkind-nvim")
	use("ray-x/lsp_signature.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("cljoly/telescope-repo.nvim")
	use("airblade/vim-rooter")
	use({
		"benfowler/telescope-luasnip.nvim",
		-- module = "telescope._extensions.luasnip", -- if you wish to lazy-load
	})
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({ "nvim-telescope/telescope-ui-select.nvim" })
	use("dhruvmanila/telescope-bookmarks.nvim")
	use("nvim-telescope/telescope-github.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("nvim-treesitter/playground")
	use("David-Kunz/treesitter-unit")
	use("mfussenegger/nvim-ts-hint-textobject")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("sindrets/diffview.nvim")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
