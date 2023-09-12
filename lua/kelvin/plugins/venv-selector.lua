return {
	"linux-cultist/venv-selector.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim",
		"mfussenegger/nvim-dap-python",
	},
	cmd = "VenvSelect",
	opts = {
		name = {
			"venv",
			".venv",
			"env",
			".env",
		},
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>cv",
			"<cmd>:VenvSelect<cr>",
			desc = "Select VirtualEnv",
		},
	},
}
