local vim = vim
local api = vim.api

local format_group = api.nvim_create_augroup("FormatGroup", { clear = true })

api.nvim_create_autocmd(
	{ "BufReadPost", "FileReadPost" },
	{ pattern = "*", command = "normal zR", group = format_group }
)

-- api.nvim_create_autocmd(
-- 	{ "BufRead", "BufNewFile" },
-- 	{ pattern = "*.md", command = "setlocal textwidth=120", group = format_group }
-- )

-- api.nvim_create_autocmd("BufWritePost", { pattern = "*", command = "FormatWrite", group = format_group })
