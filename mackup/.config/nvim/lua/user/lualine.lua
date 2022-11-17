local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local navic_status_ok, navic = pcall(require, "user.navic")
if not navic_status_ok then
	return
end

local icons = require("user.icons")

local diff = {
	"diff",
	colored = true, -- Displays a colored diff status if set to true
	-- diff_color = {
	-- 	-- Same color values as the general color option can be used here.
	-- 	added = "DiffAdd", -- Changes the diff's added color
	-- 	modified = "DiffChange", -- Changes the diff's modified color
	-- 	removed = "DiffDelete", -- Changes the diff's removed color you
	-- },
	symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
	source = nil, -- A function that works as a data source for diff.
	-- It must return a table as such:
	--   { added = add_count, modified = modified_count, removed = removed_count }
	-- or nil on failure. count <= 0 won't be displayed.
}

local diagnostics = {
	"diagnostics",

	-- Table of diagnostic sources, available sources are:
	--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
	-- or a function that returns a table as such:
	--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
	sources = { "nvim_diagnostic", "coc" },

	-- Displays diagnostics for the defined severity types
	sections = { "error", "warn", "info", "hint" },

	diagnostics_color = {
		-- Same values as the general color option can be used here.
		error = "DiagnosticError", -- Changes diagnostics' error color.
		warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
		info = "DiagnosticInfo", -- Changes diagnostics' info color.
		hint = "DiagnosticHint", -- Changes diagnostics' hint color.
	},
	symbols = {
		error = icons.diagnostics.Error .. " ",
		warn = icons.diagnostics.Warning .. " ",
		info = icons.diagnostics.Information .. " ",
		hint = icons.diagnostics.Hint .. " ",
	},
	colored = true, -- Displays diagnostics status in color if set to true.
	update_in_insert = false, -- Update diagnostics in insert mode.
	always_visible = false, -- Show diagnostics even if there are none.
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		section_separators = "",
		component_separators = "", -- component_separators = { left = "", right = "" },
		-- section_separators = { left = '', right = ''},
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = { diff, { navic.get_location, cond = navic.is_available } },
		-- lualine_x = {'encoding', 'fileformat', 'filetype'},
		lualine_x = { diagnostics, "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
