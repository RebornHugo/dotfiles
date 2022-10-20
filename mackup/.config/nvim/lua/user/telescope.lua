local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
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
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      -- following is the new thing
      '-u',
      '-u',
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

    -- live_grep = {  -- it should work in git file...
    --   -- theme = "dropdown",
    -- },
    -- grep_string = {
    --   -- theme = "dropdown",
    -- },
    find_files = {
      -- theme = "dropdown",
      previewer = false,
    },
    git_files = {
      -- theme = "dropdown",
      previewer = false,
      show_untracked = true,
    },
    buffers = {
      -- theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
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
      initial_mode = "normal",
    },
    lsp_definitions = {
      -- theme = "dropdown",
      initial_mode = "normal",
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
  },
}
