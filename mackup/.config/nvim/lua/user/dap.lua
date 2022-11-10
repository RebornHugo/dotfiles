local dap_status_ok, dap = pcall(require, "dap")
if not dap_status_ok then
	return
end

local dap_ui_status_ok, dapui = pcall(require, "dapui")
if not dap_ui_status_ok then
	return
end

local dap_install_status_ok, dap_install = pcall(require, "dap-install")
if not dap_install_status_ok then
	return
end

dap_install.setup({})

dap_install.config("python", {})
-- add other configs here
-- TODO: setting dap
-- require('dap-python').setup("/usr/local/bin/python3")

-- Setup dap for python
local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")
pcall(function()
  -- mason installed debugpy is in a brand python venv, which doesn't have dependency we need, e.g. numpy
  -- require("dap-python").setup(mason_path .. "packages/debugpy/venv/bin/python")
  require("dap-python").setup("python")
end)

dapui.setup({
	expand_lines = true,
	icons = { expanded = "", collapsed = "", circular = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	-- layouts = {
	-- 	{
	-- 		elements = {
	-- 			{ id = "scopes", size = 0.33 },
	-- 			{ id = "breakpoints", size = 0.17 },
	-- 			{ id = "stacks", size = 0.25 },
	-- 			{ id = "watches", size = 0.25 },
	-- 		},
	-- 		size = 0.33,
	-- 		position = "right",
	-- 	},
	-- 	{
	-- 		elements = {
	-- 			{ id = "repl", size = 0.45 },
	-- 			{ id = "console", size = 0.55 },
	-- 		},
	-- 		size = 0.27,
	-- 		position = "bottom",
	-- 	},
	-- },
	floating = {
		max_height = 0.9,
		max_width = 0.5, -- Floats will be treated as percentage of your screen.
		border = vim.g.border_chars, -- Border style. Can be 'single', 'double' or 'rounded'
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
})

-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
-- vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

-- vim.highlight.create('DapBreakpoint', { ctermbg=0, guifg='#993939', guibg='#31353f' }, false)
-- vim.highlight.create('DapLogPoint', { ctermbg=0, guifg='#61afef', guibg='#31353f' }, false)
-- vim.highlight.create('DapStopped', { ctermbg=0, guifg='#98c379', guibg='#31353f' }, false)

-- vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
-- vim.fn.sign_define('DapBreakpointCondition', { text='ﳁ', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl='DapBreakpoint' })
-- vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpoint', linehl='DapBreakpoint', numhl= 'DapBreakpoint' })
-- vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='DapLogPoint', numhl= 'DapLogPoint' })
-- vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='DapStopped', numhl= 'DapStopped' })

 
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
