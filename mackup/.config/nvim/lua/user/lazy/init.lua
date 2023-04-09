return {
  -- My plugins here
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  { "windwp/nvim-autopairs", commit = "4fc96c8f3df89b6d23e5092d31c866c53a346347" }, -- Autopairs, integrates with both cmp and treesitter
  { "JoosepAlviste/nvim-ts-context-commentstring", commit = "4d3a68c41a53add8804f471fcc49bb398fe8de08" },
  { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" },
  { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" },
  { "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" },
  { "akinsho/toggleterm.nvim" },
  { "lewis6991/impatient.nvim" },
  { "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" },

  -- Statusline
  { "nvim-lualine/lualine.nvim", commit = "a52f078026b27694d2290e34efa61a6e4a690621" },

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
  { "hrsh7th/nvim-cmp" }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  { "neovim/nvim-lspconfig" }, -- enable LSP
  { "williamboman/mason.nvim", commit = "c2002d7a6b5a72ba02388548cfaf420b864fbc12" },
  { "williamboman/mason-lspconfig.nvim", commit = "0051870dd728f4988110a1b2d47f4a4510213e31" },
  { "jose-elias-alvarez/null-ls.nvim", commit = "c0c19f32b614b3921e17886c541c13a72748d450" }, -- for formatters and linters
  {
    "RRethy/vim-illuminate",
    commit = "a2e8476af3f3e993bb0d6477438aad3096512e42",
    event = "VeryLazy",
  },
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

  -- Treesitter
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    -- commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
  },

  {
    -- Additional text objects via treesitter
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
    event = "VeryLazy",
    dependencies = { "nvim-telescope/telescope.nvim" },
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
  { "folke/todo-comments.nvim" },

  -- Project
  { "ahmedkhalf/project.nvim", commit = "628de7e433dd503e782831fe150bb750e56e55d6" },
  { "RebornHugo/nvim-spectre" },

  -- Editing Support
  { "karb94/neoscroll.nvim" },

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
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup()
    end,
  },
}
