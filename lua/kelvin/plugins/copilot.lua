return {
	"zbirenbaum/copilot.lua",
	config = function()
		require("copilot").setup({
			panel = { enabled = false },
			suggestion = { enabled = false },
		})
	end,
}
