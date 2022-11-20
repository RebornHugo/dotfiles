vim.g.catppuccin_flavour = "mocha"

local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  vim.notify("catppuccin is not found")
	return
end

catppuccin.setup({
	background = { -- :h background
		light = "latte",
		dark = "mocha",
	},
	compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
	transparent_background = true,
	term_colors = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.15,
	},
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = { "italic" },
		functions = {},
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	color_overrides = {},
	custom_highlights = {},
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
		-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
		dap = {
			enabled = true,
			enable_ui = true,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
			},
			underlines = {
				errors = { "undercurl" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
			},
		},
		navic = {
			enabled = true,
			custom_bg = "NONE",
		},
	},
	highlight_overrides = {
		mocha = function(mocha)
			return {
				-- Comment = { fg = mocha.flamingo },
				CursorLine = { bg = mocha.mantle }, -- otherwise, we can't even see the cursorline in the transparent mode
			}
		end,
	},
})
