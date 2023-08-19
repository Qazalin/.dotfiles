-- This file can be loaded by calling `lua require("plugins")` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.0",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})
	use("github/copilot.vim")
	use("mbbill/undotree")
	use("norcalli/nvim-colorizer.lua")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- colors
	use("catppuccin/nvim")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("folke/neodev.nvim")
	use("nanotee/sqls.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim", {
		branch = "main",
	})
	use("nvim-lua/plenary.nvim")
	use("RRethy/vim-illuminate")
	use("ThePrimeagen/harpoon")
	use("lewis6991/gitsigns.nvim")
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	})

	use("kyazdani42/nvim-web-devicons")
	use("zbirenbaum/copilot.lua")

	use("gbprod/yanky.nvim")
	require("yanky").setup({})

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})

	use("~/stackmap.nvim")
	use("~/ai.nvim") -- i'll ship this someday
end)
