-- import null-ls plugin safely
local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

-- formatting sources
local formatting = null_ls.builtins.formatting

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- completion sources
local completion = null_ls.builtins.completion

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	-- setup formatters & linters
	sources = {
		completion.spell,
		--  to disable file types use
		--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.isort,
		formatting.black,
		-- formatting.autopep8,

		diagnostics.eslint_d.with({ -- js/ts linter
			-- only enable eslint if root has .eslintrc.js
			condition = function(utils)
				return utils.root_has_file(".eslintrc.js") or utils.root_has_file(".eslintrc.json") -- change file extension if you use something else
			end,
		}),
		-- diagnostics.pylint.with({
		-- 	env = function(params)
		-- 		return { PYTHONPATH = params.root }
		-- 	end,
		-- }),
		diagnostics.flake8.with({
			extra_args = {
				"--config",
				vim.fn.expand("~/.flake8"),
			},
		}),
	},

	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						bufnr = bufnr,
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
					})
				end,
			})
		end
	end,
})
