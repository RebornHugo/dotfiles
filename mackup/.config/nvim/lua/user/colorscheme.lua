vim.o.termguicolors = true
local colorscheme = "catppuccin" -- darkplus onedarker nightfox nordfox terafox catppuccin

-- activate setup
local setting_status_ok, _ = pcall(require, "user.colorschemes." .. colorscheme)
  
-- activate colorscheme
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
