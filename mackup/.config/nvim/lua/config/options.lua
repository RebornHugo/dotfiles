-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.signcolumn = "auto:1-3"

if vim.env.VSCODE then
  vim.g.vscode = true
end
