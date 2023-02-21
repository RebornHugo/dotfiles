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
  y = {
    name = "Rust",
  -- NOTE: use only lsp inlayhints??
  h = { "<cmd>RustToggleInlayHints<Cr>", "InlayHints" },
  y = { "<cmd>RustRunnables<Cr>", "Runnables" },
  c = { "<cmd>RustOpenCargo<Cr>", "Cargo" },
  A = { "<cmd>RustHoverActions<Cr>", "HoverActions" },
  R = { "<cmd>RustHoverActions<Cr>", "HoverRange" },
  -- j = { "<cmd>RustMoveItemDown<Cr>", "Down" },
  -- k = { "<cmd>RustMoveItemUp<Cr>", "Up" },
-- keymap("n", "<leader>rh", "<cmd>RustSetInlayHints<Cr>", key_opts)
-- keymap("n", "<leader>rhd", "<cmd>RustDisableInlayHints<Cr>", key_opts)
-- keymap("n", "<leader>th", "<cmd>RustToggleInlayHints<Cr>", key_opts)
-- keymap("n", "<leader>rem", "<cmd>RustExpandMacro<Cr>", key_opts)
-- keymap("n", "<leader>roc", "<cmd>RustOpenCargo<Cr>", key_opts)
-- keymap("n", "<leader>rpm", "<cmd>RustParentModule<Cr>", key_opts)
-- keymap("n", "<leader>rjl", "<cmd>RustJoinLines<Cr>", key_opts)
-- keymap("n", "<leader>rha", "<cmd>RustHoverActions<Cr>", key_opts)
-- keymap("n", "<leader>rhr", "<cmd>RustHoverRange<Cr>", key_opts)
-- keymap("n", "<leader>rmd", "<cmd>RustMoveItemDown<Cr>", key_opts)
-- keymap("n", "<leader>rmu", "<cmd>RustMoveItemUp<Cr>", key_opts)
-- keymap("n", "<leader>rsb", "<cmd>RustStartStandaloneServerForBuffer<Cr>", key_opts)
-- keymap("n", "<leader>rd", "<cmd>RustDebuggables<Cr>", key_opts)
-- keymap("n", "<leader>rv", "<cmd>RustViewCrateGraph<Cr>", key_opts)
-- keymap("n", "<leader>rw", "<cmd>RustReloadWorkspace<Cr>", key_opts)
-- keymap("n", "<leader>rss", "<cmd>RustSSR<Cr>", key_opts)
-- keymap("n", "<leader>rxd", "<cmd>RustOpenExternalDocs<Cr>", key_opts)

    ----------------
    -- y = { ":silent only | Jaq<cr>", "Run Code" },
  },
}
which_key.register(mappings, opts)
