return {
	"elgiano/nvim-treesitter-angular",
	-- "nvim-treesitter/nvim-treesitter-angular",
	event = { "BufReadPost", "BufNewFile" },
	branch = "topic/jsx-fix",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	build = ":TSUpdate",
	cmd = { "TSUpdateSync" },
}
