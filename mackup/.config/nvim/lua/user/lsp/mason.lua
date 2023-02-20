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
	"cmake",
  "dockerls",
  "rust_analyzer",
	-- "grammarly"  -- need token
}
local linters = {
	"flake8",
	"shellcheck",
}

local formatters = {
	"black",
	"stylua",
	"shfmt", -- bash
	"rustfmt", -- rust
}

local daps = {
	"debugpy",
}
-- In Clangd + CMake project, we should run the following command in build folder
-- cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
-- Ref: https://www.youtube.com/watch?v=BCuyEdDQ5iA and https://clang.llvm.org/docs/JSONCompilationDatabase.html

local settings = {
	ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
		},
	},
	log_level = vim.log.levels.INFO,
	max_concurrent_installers = 4,
}

-- local all_servers =
-- 	require("user.functions").concat_array(require("user.functions").concat_array(servers, linters), formatters)
local all_servers = vim.tbl_extend('keep', servers, linters, formatters, daps)
require("mason").setup(settings)
require("mason-lspconfig").setup({
	ensure_installed = all_servers,
	automatic_installation = true,
})

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

	server = vim.split(server, "@")[1]

	local require_ok, conf_opts = pcall(require, "user.lsp.settings." .. server)
	if require_ok then
		opts = vim.tbl_deep_extend("force", conf_opts, opts)
	end

  if server ~= "rust_analyzer" then
    -- rust is configed directly through rust-tools
    lspconfig[server].setup(opts)
  end
end

-- -- TODO: add something to installer later
-- -- require("lspconfig").motoko.setup {}
