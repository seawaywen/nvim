return {
	"junegunn/goyo.vim",
	dependencies = {
		"junegunn/limelight.vim",
		"preservim/vim-pencil",
	},
	config = function()
		-- import comment plugin safely
		-- local goyo = require("goyo")
		vim.g["goyo_width"] = 100

		-- Color name (:help cterm-colors) or ANSI code
		vim.g["limelight_conceal_ctermfg"] = "gray"
		vim.g["limelight_conceal_ctermfg"] = 240

		-- Color name (:help gui-colors) or RGB color
		vim.g["limelight_conceal_guifg"] = "DarkGray"
		vim.g["limelight_conceal_guifg"] = "#777777"

		--  Default: 0.5
		vim.g["limelight_default_coefficient"] = 0.7

		-- Number of preceding/following paragraphs to include (default: 0)
		vim.g["limelight_paragraph_span"] = 1

		--  Beginning/end of paragraph
		--    When there's no empty line between the paragraphs
		--    and each paragraph starts with indentation
		vim.g["limelight_bop"] = "^s"
		vim.g["limelight_eop"] = "\ze\n^s"

		-- Highlighting priority (default: 10)
		--   Set it to -1 not to overrule hlsearch
		vim.g["limelight_priority"] = -1

		vim.api.nvim_command([[
      function! s:goyo_enter()
         if executable("tmux") && strlen($TMUX)
          silent !tmux set status off
           silent !tmux list-panes -F "\#F" | grep -q Z || tmux resize-pane -Z
         endif

        set noshowmode
        set noshowcmd
        set scrolloff=999

        lua require("lualine").hide()

        Limelight

        "set number
        "set relativenumber
        "set numberwidth=4

        " ...
      endfunction
    ]])

		vim.api.nvim_command([[
      function! s:goyo_leave()
         if executable("tmux") && strlen($TMUX)
          silent !tmux set status on
           silent !tmux list-panes -F "\#F" | grep -q Z && tmux resize-pane -Z
         endif
        " set showmode
        " highlight LineNr guifg=#d8d0cc
        set showcmd
        set scrolloff=15
        lua require("lualine").hide({unhide=true})

        Limelight!

        "set nonumber

      endfunction
    ]])

		vim.api.nvim_command([[
      autocmd! User GoyoEnter nested call <SID>goyo_enter()
      autocmd! User GoyoLeave nested call <SID>goyo_leave() 
    ]])
	end,
}
