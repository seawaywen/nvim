return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	-- config = true,
	config = function(_, opts)
		local colorizer = require("colorizer")

		colorizer.setup(opts)

		-- execute colorizer as soon as possible
		vim.defer_fn(function()
			require("colorizer").attach_to_buffer(0)
		end, 0)
	end,
}
