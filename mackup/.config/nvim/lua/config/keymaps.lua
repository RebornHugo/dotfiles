-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Shorten function name
local map = LazyVim.safe_keymap_set

map("n", "<backspace>", "<cmd>nohlsearch<CR>", { desc = "clear highligh" })
map("n", "<S-q>", function()
  Snacks.bufdelete()
end, { desc = "Delete Buffer and Window" })

-- Better paste without refill clipboard by deleted content
map("v", "p", "P", {})
map("v", "P", "p", {})

-- vim.keymap.del("n", "<leader>gs") -- doesn't work
vim.keymap.del("n", "<leader>sk") -- use <leader>fk for telescope keymaps
vim.keymap.del("n", "<leader>fT") -- disable Terminal (cwd)
vim.keymap.del("n", "<leader>ft") -- Terminal (Root Dir)
map("n", "<leader>ft", LazyVim.pick("live_grep"), { desc = "Grep (Root Dir)" })
