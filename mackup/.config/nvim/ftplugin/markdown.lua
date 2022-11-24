-- vim.cmd [[setlocal conceallevel=2]]
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
  -- TODO: merge all jaq into whickey leader-d, and set markdown preview to the same keybinding using ftplugin
  y = {
        name = "Markdown",
    y = { "<cmd>MarkdownPreviewToggle<cr>", "MarkdownPreviewToggle" },
  },
}
which_key.register(mappings, opts)
