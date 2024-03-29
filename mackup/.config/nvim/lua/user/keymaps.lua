-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)

-- Clear highlights
keymap("n", "<backspace>", "<cmd>nohlsearch<CR>", opts)  -- TODO: try backspace

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste without refill clipboard by deleted content
-- ref: https://vimhelp.org/change.txt.html#v_p
keymap("v", "p", 'P', opts)
keymap("v", "P", 'p', opts)
-- keymap("v", "p", '"_dP', opts)

-- move cursor to next/prev line in jetbrans's style (not possible, https://www.reddit.com/r/vim/comments/aaxpxi/remapping_ctrlenter_in_vim/)
-- TODO(Hugo): jump to new line without entering insert_mode(customize Enter/Ctrl+Enter)
-- keymap("n", "<CR>", "o<Esc>")
-- keymap("n", "<S-<CR>>", "O<Esc>")

-- refer to:  https://github.com/sdaschner/dotfiles/blob/master/.ideavimrc
-- TODO(Hugo): comment and move cursor to new line? (if current line is empty, dont move to new line..)

-- TODO(Hugo): move current/selected line up/down, using ctrl+shift+j/k, ref: https://www.reddit.com/r/neovim/comments/mbj8m5/how_to_setup_ctrlshiftkey_mappings_in_neovim_and/
keymap("n", "<C-S-j>", "<Esc>:m +1<CR>gi", opts)

-- TODO(Hugo): dont overwrite key <H> and <G>

-- TODO(Hugo): fzf integration

-- TODO(Hugo): last tab / buffer

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Git  (refactor in whichkey.lua)
-- keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
-- TODO(Hugo): not need to enter new line if current line is empy
-- TODO(Hugo): using ctrl to comment, even in the insert_mode it should work
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>+", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
