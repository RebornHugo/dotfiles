-- Reference:
-- https://github.com/neovim/nvim-lspconfig/blob/a035031fd6f6bcb5b433fe0f32d755ba7485406d/lua/lspconfig/server_configurations/clangd.lua#L42
-- https://github.com/fitrh/init.nvim/blob/main/lua/config/lsp/server/clangd.lua
local bin = "clangd"
return {
  -- cmd = {
  --   bin, -- SEE: clangd --help-hidden for possible options
  --   -- by default, clang-tidy use -checks=clang-diagnostic-*,clang-analyzer-*
  --   -- to add more `checks`, create  a `.clang-tidy` file in the root directory
  --   -- SEE: https://clang.llvm.org/extra/clang-tidy
  --   "--clang-tidy",
  --   "--completion-style=bundled",
  --   "--cross-file-rename",
  --   "--header-insertion=iwyu",
  -- },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}
