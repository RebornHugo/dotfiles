local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
  "sumneko_lua",
  "cssls",
  "html",
  "tsserver",
  "pyright",
  "bashls",
  "jsonls",
  "yamlls",
  "clangd",
  "cmake"
}

-- In Clangd + CMake project, we should run the following command in build folder
-- cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
-- Ref: https://www.youtube.com/watch?v=BCuyEdDQ5iA and https://clang.llvm.org/docs/JSONCompilationDatabase.html

lsp_installer.setup()

LSP_SERVER_PATH = "/Users/hugoreborn/.local/share/nvim/lsp_servers"
local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

local opts = {}

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "sumneko_lua" then
    local sumneko_opts = require "user.lsp.settings.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server == "pyright" then
    local pyright_opts = require "user.lsp.settings.pyright"
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  if server == "cmake" then
    local cmake_opts = require "user.lsp.settings.cmake"
    opts = vim.tbl_deep_extend("force", cmake_opts, opts)
  end

  lspconfig[server].setup(opts)
end
