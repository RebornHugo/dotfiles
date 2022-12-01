local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
  mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

  v = {
        name = "wiki",
        h="HTML",
        ["hh"]="HTML&Browse",
        a = {"<cmd>VimwikiAll2HTML<cr>", "HTML all"},  -- overwrite default new tab keybinding
        A = {"<cmd>VimwikiAll2HTML!<cr>", "HTML All"},  -- overwrite default new tab keybinding
        b = {"<cmd>:VimwikiBacklinks<cr>", "show backlinks"},  -- overwrite default new tab keybinding
        -- ["w<leader>w"] = "Open diary wiki-file for today of the [count]'s wiki.",
  },
}
-- ["<CR>"]="Follow/create wiki link"

local options = { noremap = true }
-- vim.keymap.set("n", "<C-Backspace>", "VimwikiGoBackLink", options)
-- vim.cmd("unmap <Plug><Backspace>")
vim.cmd("nnoremap <Leader><Backspace> <Plug>VimwikiGoBackLink")
-- vim.api.nvim_set_keymap("n", "<Leader><Backspace>", ":VimwikiGoBackLink<CR>", { noremap = true, silent = true, nowait = true })
-- vim.keymap.set("n", "<leader><Backspace>", "VimwikiGoBackLink", options)

which_key.register(mappings, opts)
