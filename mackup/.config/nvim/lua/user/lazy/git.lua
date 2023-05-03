return {
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    dependencies = "nvim-lua/plenary.nvim",
  },
  -- keys = {
  --   { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "NeoTree" },
  --   { "<leader>dx", "<cmd>DiffviewClose<cr>", desc = "NeoTree" },
  -- },
  -- opts = {
  --   view = {
  --     -- Configure the layout and behavior of different types of views.
  --     -- Available layouts:
  --     --  'diff1_plain'
  --     --    |'diff2_horizontal'
  --     --    |'diff2_vertical'
  --     --    |'diff3_horizontal'
  --     --    |'diff3_vertical'
  --     --    |'diff3_mixed'
  --     --    |'diff4_mixed'
  --     -- For more info, see ':h diffview-config-view.x.layout'.
  --     use_icons = true,
  --     default = {
  --       -- Config for changed files, and staged files in diff views.
  --       layout = "diff2_horizontal",
  --       winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
  --     },
  --   },
  -- },
  { "tpope/vim-fugitive", event = "VeryLazy" },

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local status_ok, gitsigns = pcall(require, "gitsigns")
      if not status_ok then
        return
      end

      gitsigns.setup({
        signs = {
          add = { hl = "GitSignsAdd", text = "", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = { hl = "GitSignsChange", text = "", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          delete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = { hl = "GitSignsDelete", text = "", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          changedelete = {
            hl = "GitSignsChange",
            text = "",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          untracked = { hl = "GitSignsAdd", text = "┆", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        },
        signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
        numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true,
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
          delay = 100,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = "| <author> • <author_time:%Y-%m-%d> • <summary>",
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = "single",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        yadm = {
          enable = false,
        },
      })
    end,
    event = "VeryLazy",
  },

  -- use "f-person/git-blame.nvim"
}
