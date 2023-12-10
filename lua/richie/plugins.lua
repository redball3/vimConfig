return {
	{
		"nvim-telescope/telescope.nvim", tag= "0.1.5",
		dependencies = { {"nvim-lua/plenary.nvim"} }
	},
	{ 
		"catppuccin/nvim", name = "catppuccin", priority = 1000
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate"
	},
	{
		"ThePrimeagen/harpoon",
		dependencies = { {"nvim-lua/plenary.nvim"} }
	},
	{"mbbill/undotree"}, 
	{"tpope/vim-fugitive"},
	{
		'VonHeikemen/lsp-zero.nvim', branch = 'v3.x',
		dependencies = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/nvim-cmp'},
			{'L3MON4D3/LuaSnip'},
		}
	}
}

