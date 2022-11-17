local status_ok, nightfox = pcall(require, "nightfox")
if not status_ok then
  vim.notify("nightfox is not found")
	return
end

nightfox.setup({
	options = {
		-- Compiled file's destination location
		compile_path = vim.fn.stdpath("cache") .. "/nightfox",
		compile_file_suffix = "_compiled", -- Compiled file suffix
		transparent = true, -- Disable setting background
		terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
		dim_inactive = false, -- Non focused panes set to alternative background
		styles = { -- Style to be applied to different syntax groups
			comments = "italic", -- Value is any valid attr-list value `:help attr-list`
			conditionals = "italic",
			constants = "NONE",
			functions = "NONE",
			keywords = "italic",
			numbers = "NONE",
			operators = "NONE",
			strings = "NONE",
			types = "NONE",
			variables = "NONE",
		},
		inverse = { -- Inverse highlight for different types
			match_paren = false,
			visual = true,
			search = false,
		},
		modules = { -- List of various plugins and additional options
			-- -- dashboard = true,
			-- diagnostic = true,
			-- gitsigns = true,
			-- -- lsp_saga = true,
			-- native_lsp = true,
			-- -- neotree = true,
			-- telescope = true,
			-- treesitter = true,
			-- whichkey = true
		},
	},
	palettes = {},
	specs = {},
	groups = {},
})
