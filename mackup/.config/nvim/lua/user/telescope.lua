local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local status_ok, z_utils = pcall(require, "telescope._extensions.zoxide.utils")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup({
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    layout_config = {
      preview_width = 0.6,
      prompt_position = "top",
    },
    prompt_position = "top",
    sorting_strategy = "ascending",
    file_ignore_patterns = {
      ".git/",
      "target/",
      "docs/",
      "vendor/*",
      "%.lock",
      "__pycache__/*",
      "%.sqlite3",
      "%.ipynb",
      "node_modules/*",
      -- "%.jpg",
      -- "%.jpeg",
      -- "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
      "%.webp",
      ".dart_tool/",
      ".github/",
      ".gradle/",
      ".idea/",
      -- ".settings/",
      ".vscode/",
      "__pycache__/",
      "build/",
      "cmake-build-debug/",
      "env/",
      "gradle/",
      "node_modules/",
      "%.pdb",
      "%.dll",
      "%.class",
      "%.exe",
      "%.cache",
      "%.ico",
      "%.pdf",
      "%.dylib",
      "%.jar",
      "%.docx",
      "%.met",
      "smalljre_*/*",
      ".vale/",
      "%.burp",
      "%.mp4",
      "%.mkv",
      "%.rar",
      "%.zip",
      "%.7z",
      "%.tar",
      "%.bz2",
      "%.epub",
      "%.flac",
      "%.tar.gz",
      "%.npz",
      -- tusimple internal
      "ttgen_%/",
    },
    -- customize live_grep to support hidden filese,
    -- see: https://github.com/nvim-telescope/telescope.nvim/issues/470
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      -- following is the new thing
      -- '-u',
      -- '-u',
    },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        -- ["<C-b>"] = actions.results_scrolling_up,
        -- ["<C-f>"] = actions.results_scrolling_down,
      },
    },
  },

  pickers = {

    live_grep = { -- it should work in git file...
      -- theme = "dropdown",
      additional_args = function(opts)
        return { "--hidden" }
      end,
    },
    -- grep_string = {
    --   -- theme = "dropdown",
    -- },
    find_files = {
      -- theme = "dropdown",
      previewer = true,
    },
    git_files = {
      -- theme = "dropdown",
      previewer = true,
      show_untracked = true,
    },
    buffers = {
      -- theme = "dropdown",
      previewer = false,
      initial_mode = "insert",
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    colorscheme = {
      -- enable_preview = true,
    },
    lsp_references = {
      -- theme = "dropdown",
      initial_mode = "insert",
    },
    lsp_definitions = {
      -- theme = "dropdown",
      initial_mode = "insert",
    },
    lsp_declarations = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      -- theme = "dropdown",
      initial_mode = "normal",
    },

    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
    zoxide = {
      prompt_title = "[ Zoxide List ]",

      -- Zoxide list command with score
      list_command = "zoxide query -ls",
      mappings = {
        default = {
          action = function(selection)
            vim.cmd("cd " .. selection.path)
          end,
          after_action = function(selection)
            print("Directory changed to " .. selection.path)
          end,
        },
        ["<C-s>"] = { action = z_utils.create_basic_command("split") },
        ["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
        ["<C-e>"] = { action = z_utils.create_basic_command("edit") },
        ["<C-b>"] = {
          keepinsert = true,
          action = function(selection)
            builtin.file_browser({ cwd = selection.path })
          end,
        },
        ["<C-f>"] = {
          keepinsert = true,
          action = function(selection)
            builtin.find_files({ cwd = selection.path })
          end,
        },
      },
    },
  },
})

-- Telescope Extensions
telescope.load_extension("zoxide")
