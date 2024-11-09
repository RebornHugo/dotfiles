local notify_filter = vim.notify
vim.notify = function(msg, ...)
  if
    msg:match("warning: multiple different client offset_encodings detected for buffer, this is not supported yet")
  then
    return
  end

  notify_filter(msg, ...)
end

-- TODO: add cpp specific features
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
  -- TODO: add keybinding for running, unittest, debugging
  y = {
    name = "cpp",
    h = { "<cmd>ClangdSwitchSourceHeader<cr>", "ClangdSwitchSourceHeader" },
    a = { "<cmd>ClangdAST<cr>", "ClangdAST" },
    t = { "<cmd>ClangdTypeHierarchy<cr>", "ClangdTypeHierarchy" },
    s = { "<cmd>ClangdSymbolInfo<cr>", "ClangdSymbolInfo" },
    m = { "<cmd>ClangdMemoryUsage<cr>", "ClangdMemoryUsage" },
  },
}
which_key.register(mappings, opts)
