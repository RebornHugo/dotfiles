return {

  -- Treesitter
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    -- commit = "8e763332b7bf7b3a426fd8707b7f5aa85823a5ac",
    build = function()
      pcall(require("nvim-treesitter.install").update({ with_sync = true }))
    end,
    config = function()
      local status_ok, configs = pcall(require, "nvim-treesitter.configs")
      if not status_ok then
        return
      end

      -- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
      -- ft_to_parser.motoko = "typescript"

      configs.setup({
        -- ensure_installed = "all", -- one of "all" or a list of languages
        ensure_installed = {
          "bash",
          "comment",
          "css",
          "html",
          "javascript",
          "jsdoc",
          "json",
          "json5",
          "julia",
          "latex",
          "bibtex",
          "jsonc",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "regex",
          "scss",
          "toml",
          "typescript",
          "yaml",
          "dockerfile",
          "python",
          "proto",
          "java",
          "beancount",
          "cuda",
          "fish",
          "c",
          "cpp",
          "gitignore",
          "go",
          "ruby",
          "rust",
          "sql",
          "vim",
        },
        sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
        ignore_install = { "" }, -- List of parsers to ignore installing
        matchup = {
          enable = true, -- mandatory, false will disable the whole extension
          disable_virtual_text = true,
          disable = { "html" }, -- optional, list of language that will be disabled
          -- include_match_words = false
        },
        highlight = {
          -- use_languagetree = true,
          enable = true, -- false will disable the whole extension
          -- disable = { "css", "html" }, -- list of language that will be disabled
          -- disable = { "css", "markdown" }, -- list of language that will be disabled
          disable = { "markdown" }, -- list of language that will be disabled
          -- additional_vim_regex_highlighting = true,
        },
        autopairs = {
          enable = true,
        },
        indent = { enable = true, disable = { "python", "css", "rust" } },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<c-backspace>",
          },
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
        autotag = {
          enable = true,
          disable = { "xml", "markdown" },
        },
        rainbow = {
          enable = true,
          extended_mode = false,
          colors = {
            -- "#68a0b0",
            -- "#946EaD",
            -- "#c7aA6D",
            "Gold",
            "Orchid",
            "DodgerBlue",
            -- "Cornsilk",
            -- "Salmon",
            -- "LawnGreen",
          },
          disable = { "html" },
        },
        playground = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,
            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["at"] = "@class.outer",
              ["it"] = "@class.inner",
              ["ac"] = "@call.outer",
              ["ic"] = "@call.inner",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",
              ["a/"] = "@comment.outer",
              ["i/"] = "@comment.inner",
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",
              ["as"] = "@statement.outer",
              ["is"] = "@scopename.inner",
              ["aA"] = "@attribute.outer",
              ["iA"] = "@attribute.inner",
              ["aF"] = "@frame.outer",
              ["iF"] = "@frame.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>."] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>,"] = "@parameter.inner",
            },
          },
        },
      })
    end,
  },

  {
    -- Additional text objects via treesitter
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter",
    event = "VeryLazy",
  },
}
