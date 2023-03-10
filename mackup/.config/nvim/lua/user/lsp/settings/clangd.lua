-- Reference:
-- https://github.com/neovim/nvim-lspconfig/blob/a035031fd6f6bcb5b433fe0f32d755ba7485406d/lua/lspconfig/server_configurations/clangd.lua#L42
-- https://github.com/Johan-Palacios/nvim/blob/master/lua/lsp/settings/clangd.lua
-- https://github.com/fitrh/init.nvim/blob/main/lua/config/lsp/server/clangd.lua
-- https://github.com/LunarVim/starter.lvim/blob/c-ide/config.lua
local clangd_flags = {
  "--all-scopes-completion",
  "--background-index",
  "--suggest-missing-includes",
  -- "--pch-storage=disk",
  "--log=info",
  "--enable-config",
  "--clang-tidy",
  "--completion-style=detailed",
  "--offset-encoding=utf-16", --temporary fix for null-ls
  -- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
}

require("clangd_extensions.config").setup({})
require("clangd_extensions.ast").init()
vim.cmd([[
  command ClangdToggleInlayHints lua require('clangd_extensions.inlay_hints').toggle_inlay_hints()
  command -range ClangdAST lua require('clangd_extensions.ast').display_ast(<line1>, <line2>)
  command ClangdTypeHierarchy lua require('clangd_extensions.type_hierarchy').show_hierarchy()
  command ClangdSymbolInfo lua require('clangd_extensions.symbol_info').show_symbol_info()
  command -nargs=? -complete=customlist,s:memuse_compl ClangdMemoryUsage lua require('clangd_extensions.memory_usage').show_memory_usage('<args>' == 'expand_preamble')
  ]])
local status_ok, project_config = pcall(require, "rhel.clangd_wrl")
if status_ok then
  clangd_flags = vim.tbl_deep_extend("keep", project_config, clangd_flags)
end

return {
  cmd = { "clangd", unpack(clangd_flags) },
  filetype = { "c", "cxx", "cpp", "objc", "objcpp", "cuda" },
  init_options = {
    clangdFileStatus = true,
    semanticHighlighting = true,
  },
  clangdInlayHintsProvider = true,
  single_file_support = false,
}
