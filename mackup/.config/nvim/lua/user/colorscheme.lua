vim.o.termguicolors = true
-- darkplus onedarker nightfox nordfox terafox catppuccin tokyonight
local colorscheme = "catppuccin"

-- activate setup
local setting_status_ok, _ = pcall(require, "user.colorschemes." .. colorscheme)

-- activate colorscheme
-- NOTE: setup must be called before loading colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
