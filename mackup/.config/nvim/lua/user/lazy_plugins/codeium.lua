return {
    "jcdickinson/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        require("codeium").setup({
        })
    end
}

-- -- vim.g.codeium_filetypes = {
-- --  TelescopePrompt = false,
-- -- }
-- -- vim.g.codeium_enabled = false
-- -- vim.g.codeium_manual = true
-- return {
--   "Exafunction/codeium.vim",
--   -- enabled = false,
--   -- ft = { "python", "cpp", "lua", "rust", "yaml", "toml", "sh" },
--   -- event = "VeryLazy",
--   -- event = { "InsertEnter" },
--   -- enabled = false,
--   -- event = "BufRead",
--   -- cmd = "Codeium",

--   -- disable_filetype = { "TelescopePrompt"},

--   config = function()
--     vim.keymap.set("i", "<C-f>", function()
--       return vim.fn["codeium#Accept"]()
--     end, { expr = true, nowait = true })
--     vim.keymap.set("i", "<c-n>", function()
--       return vim.fn["codeium#CycleCompletions"](1)
--     end, { expr = true })
--     vim.keymap.set("i", "<c-p>", function()
--       return vim.fn["codeium#CycleCompletions"](-1)
--     end, { expr = true })
--     vim.keymap.set("i", "<c-x>", function()
--       return vim.fn["codeium#Clear"]()
--     end, { expr = true })
--   end,

-- 		-- config = function()
-- 		-- 		-- Change '<C-g>' here to any keycode you like.
-- 		-- 		-- vim.keymap.set("i", "<M-a>", function()
-- 		-- 		-- 	return vim.fn["codeium#Accept"]()
-- 		-- 		-- end, { expr = true, desc = "Codeium: Accept Suggestion" })
-- 		-- 		vim.keymap.set("i", "<M-n>", function()
-- 		-- 			return vim.fn["codeium#CycleCompletions"](1)
-- 		-- 		end, { expr = true, desc = "Codeium: Next Suggestion" })
-- 		-- 		vim.keymap.set("i", "<M-a>", function()
-- 		-- 			return vim.fn["codeium#CycleCompletions"](-1)
-- 		-- 		end, { expr = true, desc = "Codeium: Previous Suggestion" })
-- 		-- 		-- vim.keymap.set("i", "<M-Space>", function()
-- 		-- 		vim.keymap.set("i", "<M-w>", function()
-- 		-- 			return vim.fn["codeium#Complete"]()
-- 		-- 		end, { expr = true, desc = "Codeium: Trigger Suggestions" })
-- 		-- 		vim.keymap.set("i", "<M-Bslash>", function()
-- 		-- 			return vim.fn["codeium#Clear"]()
-- 		-- 		end, { expr = true, desc = "Codeium: Clear Suggestions" })
-- 		-- 	end
-- }
