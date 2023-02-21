-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.cmd [[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]]

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
return lazy.setup({
	-- My plugins here
	{ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }, -- Useful lua functions used by lots of plugins
	{ "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }, -- Autopairs, integrates with both cmp and treesitter
	{ "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" },
	{ "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" },
	{ "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" },
	{ "akinsho/bufferline.nvim", commit = "83bf4dc7bff642e145c8b4547aa596803a8b4dc4" },
	{ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
	{ "akinsho/toggleterm.nvim" },
	{ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" },
	{ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" },

	-- Statusline
	{ "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" },

	-- Startup
	{ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" },

	-- Colorschemes
	{ "folke/tokyonight.nvim" },
	{ "lunarvim/darkplus.nvim" },
	{ "navarasu/onedark.nvim" },
	{ "EdenEast/nightfox.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		-- config = function()
		--   vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
		--   require("catppuccin").setup()
		--   vim.api.nvim_command "colorscheme catppuccin"
		-- end
	},

	-- color
	{ "NvChad/nvim-colorizer.lua" },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", commit = "b0dff0ec4f2748626aae13f011d1a47071fe9abc" }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }, -- buffer completions
	{ "hrsh7th/cmp-path", commit = "447c87cdd6e6d6a1d2488b1d43108bfa217f56e1" }, -- path completions
	{ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" },
	{ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" },

	-- snippets
	{ "L3MON4D3/LuaSnip", commit = "8f8d493e7836f2697df878ef9c128337cbf2bb84" }, --snippet engine
	{ "rafamadriz/friendly-snippets", commit = "2be79d8a9b03d4175ba6b3d14b082680de1b31b1" }, -- a bunch of snippets to use

	-- LSP
	-- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
	{ "neovim/nvim-lspconfig", commit = "f11fdff7e8b5b415e5ef1837bdcdd37ea6764dda" }, -- enable LSP
	{ "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" },
	{ "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" },
	{ "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }, -- for formatters and linters
	{ "RRethy/vim-illuminate", commit = "a2e8476af3f3e993bb0d6477438aad3096512e42" },
	{ "ray-x/lsp_signature.nvim" },
	{ "SmiteshP/nvim-navic" },
	{ "lvimuser/lsp-inlayhints.nvim" },
	{ "simrat39/symbols-outline.nvim" },
	{ "p00f/clangd_extensions.nvim" },
	{ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
	{ "simrat39/rust-tools.nvim" },
	-- TODO: what's lsp-saga

	-- Marks
	{ "christianchiarulli/harpoon" },
	{ "MattesGroeger/vim-bookmarks" },

	-- Telescope
	{ "nvim-telescope/telescope.nvim" },
	{ "jvgrootveld/telescope-zoxide" },
	-- use "tom-anders/telescope-vim-bookmarks.nvim"

	-- Treesitter
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		-- commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},

	{ -- Additional text objects via treesitter
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter",
	},

	-- Git
	{ "lewis6991/gitsigns.nvim" },
	-- use "f-person/git-blame.nvim"

	-- DAP
	{ "mfussenegger/nvim-dap" },
	{ "rcarriga/nvim-dap-ui" },
	{ "ravenxrz/DAPInstall.nvim" },
	{ "mfussenegger/nvim-dap-python" },
	{ "theHamsta/nvim-dap-virtual-text" },

	-- Code Runner
	{ "is0n/jaq-nvim" },
	{
		"0x100101/lab.nvim",
		build = "cd js && npm ci",
	},

	-- whic-key
	{ "folke/which-key.nvim" },

	-- Writing
	-- Markdown --
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = "markdown",
	},
	{ "ekickx/clipboard-image.nvim" },
	-- vimwiki --
	{ "vimwiki/vimwiki", branch = "dev" },

	-- CSV
	{
		"chrisbra/csv.vim",
		ft = { "csv" },
		config = function()
			vim.b.csv_arrange_align = "l*"
			-- vim.g.csv_autocmd_arrange = 1
			-- vim.g.csv_autocmd_arrange_size = 1024*1024
			-- vim.g.csv_strict_columns  = 1
		end,
	},
	-- Utility
	{
		"lalitmee/browse.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	-- Comment
	{ "numToStr/Comment.nvim", commit = "97a188a98b5a3a6f9b1b850799ac078faa17ab67" },
	{ "folke/todo-comments.nvim" },

	-- Project
	{ "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
	{ "RebornHugo/nvim-spectre" },

	-- Editing Support
	{ "karb94/neoscroll.nvim" },

	-- Graveyard by Christian
	{
		"folke/trouble.nvim",
		-- dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	-- better vim and tmux navigator, <C-HJKL>
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({
				disable_when_zoomed = true, -- defaults to false
				keybindings = {
					left = "<C-h>",
					down = "<C-j>",
					up = "<C-k>",
					right = "<C-l>",
					-- last_active = "<C-\\>",
					-- next = "<C-Space>",
				},
			})
		end,
	},
	-- session management
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = { "buffers", "curdir", "tabpages", "winsize", "help", "globals" } },
    -- stylua: ignore
    keys = {
      -- { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      -- { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      -- { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
	},
})
