return {
	"mfussenegger/nvim-dap-python",
	ft = "python",
	dependencies = {
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{
			"<leader>dpr",
			function()
				require("dap-python").test_method()
			end,
			desc = "Start debugging",
		},
	},
	config = function()
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		local dappython = require("dap-python")
		dappython.setup(path)

		-- require("core.utils").load_mappings("dap_python")
	end,
}
