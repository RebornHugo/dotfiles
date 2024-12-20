return {
  -- My plugins here
  { "nvim-lua/plenary.nvim" }, -- Useful lua functions used by lots of plugins
  { "windwp/nvim-autopairs" }, -- Autopairs, integrates with both cmp and treesitter
  { "kyazdani42/nvim-web-devicons", commit = "563f3635c2d8a7be7933b9e547f7c178ba0d4352" },
  { "kyazdani42/nvim-tree.lua", commit = "7282f7de8aedf861fe0162a559fc2b214383c51c" },
  { "moll/vim-bbye" },
  { "akinsho/toggleterm.nvim" },
  { "lewis6991/impatient.nvim" },
  {
    "kylechui/nvim-surround", -- extensions of "tpope/vim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  { "folke/neodev.nvim", event = "VeryLazy", opts = {} },

  -- Statusline
  { "nvim-lualine/lualine.nvim" },

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
  { "hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = { "kdheepak/cmp-latex-symbols" } }, -- The completion plugin
  { "hrsh7th/cmp-buffer" }, -- buffer completions
  { "hrsh7th/cmp-path" }, -- path completions
  { "saadparwaiz1/cmp_luasnip" }, -- snippet completions
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-nvim-lua" },

  -- LSP
  -- use { "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" } -- simple to use language server installer
  { "neovim/nvim-lspconfig" }, -- enable LSP
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "nvimtools/none-ls.nvim" }, -- for formatters and linters
  {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
  },
  { "ray-x/lsp_signature.nvim" },
  { "SmiteshP/nvim-navic" },
  { "simrat39/symbols-outline.nvim" },
  { "p00f/clangd_extensions.nvim" },
  -- { "https://git.sr.ht/~whynothugo/lsp_lines.nvim" },
  { "ErichDonGubler/lsp_lines.nvim" }, -- use github mirror since company cannot connect to the original one
  { "simrat39/rust-tools.nvim" },
  -- TODO: what's lsp-saga

  -- Marks
  { "christianchiarulli/harpoon" },
  { "MattesGroeger/vim-bookmarks" },

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
  {
    "ekickx/clipboard-image.nvim",
    ft = { "markdown", "vimwiki" },
  },

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
    event = "VeryLazy",
  },
  -- session management
  {
    "olimorris/persisted.nvim",
    config = function()
      require("persisted").setup()
    end,
  },
}
