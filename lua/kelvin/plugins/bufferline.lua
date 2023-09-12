return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"moll/vim-bbye",
		"nvim-tree/nvim-web-devicons",
	},
	version = "*",
	opts = {
		options = {
			termguicolors = true,
			numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
			close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			right_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
			middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
			indicator_icon = nil,
			indicator = { style = "icon", icon = "▎" },
			buffer_close_icon = "",
			modified_icon = "●",
			close_icon = "",
			max_name_length = 30,
			max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
			tab_size = 21,
			diagnostics = "nvim_lsp", -- | "coc",
			diagnostics_update_in_insert = false,
			-- diagnostics_indicator = function(count, level, diagnostics_dict, context)
			--   return "("..count..")"
			-- end,
			-- NOTE: this will be called a lot so don't do any heavy processing here
			-- custom_filter = function(buf_number)
			--   -- filter out filetypes you don't want to see
			--   if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
			--     return true
			--   end
			--   -- filter out by buffer name
			--   if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
			--     return true
			--   end
			--   -- filter out based on arbitrary rules
			--   -- e.g. filter out vim wiki buffer from tabline in your work repo
			--   if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
			--     return true
			--   end
			-- end,
			offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
			-- can also be a table containing 2 custom separators
			-- [focused and unfocused]. eg: { '|', '|' }
			-- separator_style = "thin", -- | "thick" | "thin" | { 'any', 'any' },
			separator_style = "thin",
			enforce_regular_tabs = true,
			hover = {
				always_show_bufferline = true,
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
		},
	},
}
