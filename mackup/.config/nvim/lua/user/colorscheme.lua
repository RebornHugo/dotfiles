local colorscheme = "catppuccin"
-- local colorscheme = "nightfox"

-- Palettes are the base color defines of a colorscheme.
-- You can override these palettes for each colorscheme defined by nightfox.
local palettes = {
  -- Everything defined under `all` will be applied to each style.
  all = {
    -- Each palette defines these colors:
    --   black, red, green, yellow, blue, magenta, cyan, white, orange, pink
    --
    -- These colors have 3 shades: base, bright, and dim
    --
    -- Defining just a color defines it's base color
    red = "#ff0000",
  },
  nightfox = {
    -- A specific style's value will be used over the `all`'s value
    red = "#c94f6d",
  },
  dayfox = {
    -- Defining multiple shades is done by passing a table
    blue = { base = "#4d688e", bright = "#4e75aa", dim = "#485e7d" },
  },
  nordfox = {
    -- A palette also defines the following:
    --   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
    --
    -- These are the different foreground and background shades used by the theme.
    -- The base bg and fg is 1, 0 is normally the dark alternative. The others are
    -- incrementally lighter versions.
    bg1 = "#2e3440",

    -- sel is different types of selection colors.
    sel0 = "#1f252e", -- Popup bg, visual selection bg
    sel1 = "#4f6074", -- Popup uel bg, search bg

    -- comment is the definition of the comment color.
    comment = "#60728a",
  },
}

-- TODO: how to set boarder between two windows be more clear?
if colorscheme == 'nightfox' or colorscheme == 'nordfox' or colorscheme == 'carbonfox' or colorscheme == 'dawnfox' then
-- if colorscheme == "nightfox" then
-- Default options
  require('nightfox').setup({
    options = {
      -- Compiled file's destination location
      compile_path = vim.fn.stdpath("cache") .. "/nightfox",
      compile_file_suffix = "_compiled", -- Compiled file suffix
      transparent = true,    -- Disable setting background
      terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
      dim_inactive = false,   -- Non focused panes set to alternative background
      styles = {              -- Style to be applied to different syntax groups
        comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
        conditionals = "NONE",
        constants = "NONE",
        functions = "NONE",
        keywords = "NONE",
        numbers = "NONE",
        operators = "NONE",
        strings = "NONE",
        types = "NONE",
        variables = "NONE",
      },
      inverse = {             -- Inverse highlight for different types
        match_paren = false,
        visual = true,
        search = false,
      },
      modules = {             -- List of various plugins and additional options
        -- -- dashboard = true,
        -- diagnostic = true,
        -- gitsigns = true,
        -- -- lsp_saga = true,
        -- native_lsp = true,
        -- -- neotree = true,
        -- telescope = true,
        -- treesitter = true,
        -- whichkey = true
      },
    },
    palettes = palettes,
    specs = {},
    groups = {},
  })
end

if colorscheme == 'catppuccin' then

  vim.g.catppuccin_flavour = "frappe" -- latte, frappe, macchiato, mocha
  -- require("catppuccin").setup()
  -- vim.api.nvim_command "colorscheme catppuccin"

  require("catppuccin").setup({
    compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
    transparent_background = true,
    term_colors = false,
    dim_inactive = {
      enabled = false,
      shade = "dark",
      percentage = 0.15,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      markdown = true,
      dap = {
        enabled = true,
        enable_ui = true, -- enable nvim-dap-ui
      },
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
      navic = {
        enabled = true,
        custom_bg = "NONE",
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
    color_overrides = {},
    custom_highlights = {},
  })
end

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
