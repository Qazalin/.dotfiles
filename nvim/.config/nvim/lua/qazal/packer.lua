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

	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lsp")

	-- colors
	use({
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	})
	use({ "m00qek/baleia.nvim", tag = "v1.4.0" })
  use("norcalli/nvim-colorizer.lua")

	-- lsp
	use("neovim/nvim-lspconfig")
	use("folke/neodev.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("jose-elias-alvarez/null-ls.nvim", { branch = "main" })
	use("nvim-lua/plenary.nvim")
	use("RRethy/vim-illuminate")
	use("ThePrimeagen/harpoon")
	use("lewis6991/gitsigns.nvim")
	use("folke/trouble.nvim", { cmd = "Trouble" })

	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
end)
