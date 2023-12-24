vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("nvim-lua/popup.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	use("mbbill/undotree")
	use("norcalli/nvim-colorizer.lua")

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("nvim-tree/nvim-web-devicons")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")

	-- colors
	use({
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	})

	-- lsp
	use("neovim/nvim-lspconfig")
	use("folke/neodev.nvim")
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

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
end)
