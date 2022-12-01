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

  w = {
        name = "wiki",
        -- h="HTML",
        ["hh"]="HTML&Browse",
        -- TODO: fix c
        -- ["w<leader>w"] = "Open diary wiki-file for today of the [count]'s wiki.",
  },
}
-- ["<CR>"]="Follow/create wiki link"

which_key.register(mappings, opts)
