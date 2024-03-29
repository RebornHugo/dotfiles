-- template from: https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/whichkey.lua
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    ["<leader>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = false, -- show help message on the command line when the popup is visible
  -- triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local m_opts = {
  mode = "n", -- NORMAL mode
  prefix = "m",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local m_mappings = {
  m = { '<cmd>lua require("harpoon.mark").add_file()<cr>', "Harpoon" },
  ["."] = { '<cmd>lua require("harpoon.ui").nav_next()<cr>', "Harpoon Next" },
  [","] = { '<cmd>lua require("harpoon.ui").nav_prev()<cr>', "Harpoon Prev" },
  s = { "<cmd>Telescope harpoon marks<cr>", "Harpoon Search" },

  a = { "<cmd>silent BookmarkAnnotate<cr>", "Annotate" },
  c = { "<cmd>silent BookmarkClear<cr>", "Clear" },
  b = { "<cmd>silent BookmarkToggle<cr>", "Toggle" },
  -- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },
  j = { "<cmd>silent BookmarkNext<cr>", "Next" },
  k = { "<cmd>silent BookmarkPrev<cr>", "Prev" },
  S = { "<cmd>silent BookmarkShowAll<cr>", "Show" },
  -- s = {
  --   "<cmd>lua require('telescope').extensions.vim_bookmarks.all({ hide_filename=false, prompt_title=\"bookmarks\", shorten_path=false })<cr>",
  --   "Show",
  -- },
  x = { "<cmd>BookmarkClearAll<cr>", "Clear All" },
  [";"] = { '<cmd>lua require("harpoon.ui").toggle_quick_menu()<cr>', "Harpoon UI" },
}

local mappings = {
  ["1"] = "which_key_ignore",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Action" },
  b = { "<cmd>Telescope buffers<cr>", "Buffers" },
  e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  -- v = { "<cmd>vsplit<cr>", "vsplit" },
  -- h = { "<cmd>split<cr>", "split" },
  w = { "<cmd>w<CR>", "Write" },
--   -- h = { "<cmd>nohlsearch<CR>", "No HL" },
--   q = { '<cmd>lua require("user.functions").smart_quit()<CR>', "Quit" },
-- ["/"] = { '<cmd>lua require("Comment.api").toggle_current_linewise()<CR>+', "Comment" },
--   -- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
--   c = { "<cmd>Bdelete!<CR>", "Close Buffer" },
-- 
--   -- :lua require'lir.float'.toggle()
--   -- ["f"] = {
--   --   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   --   "Find files",
--   -- },
--   -- ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
--   -- P = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
--   -- ["R"] = { '<cmd>lua require("renamer").rename()<cr>', "Rename" },
--   -- ["z"] = { "<cmd>ZenMode<cr>", "Zen" },
  -- ["gy"] = "Link",

  B = {
    name = "Browse",
    c = { [[ <Esc><Cmd>lua require('user.utils.cht').cht_input()<CR>]], "cht.sh" },
    s = { [[ <Esc><Cmd>lua require('user.utils.cht').so_input()<CR>]], "Stack Overflow" },
    i = { "<cmd>BrowseInputSearch<cr>", "Input Search" },
    b = { "<cmd>Browse<cr>", "Browse" },
    d = { "<cmd>BrowseDevdocsSearch<cr>", "Devdocs" },
    f = { "<cmd>BrowseDevdocsFiletypeSearch<cr>", "Devdocs Filetype" },
    -- m = { "<cmd>BrowseMdnSearch<cr>", "Mdn" },
  },

  -- package management
  p = {
    name = "Lazy",
		S = { "<cmd>Lazy sync<cr>", "Sync" },
		u = { "<cmd>Lazy update<cr>", "Update" },
		i = { "<cmd>Lazy install<cr>", "Install" },
		l = { "<cmd>Lazy log<cr>", "Log" },
		p = { "<cmd>Lazy profile<cr>", "Profile" },
		d = { "<cmd>Lazy debug<cr>", "Debug" },
		c = { "<cmd>Lazy clean<cr>", "Clean" },
		s = { "<cmd>Lazy<cr>", "state" },
  },

  o = {
    name = "Options",
    c = { '<cmd>lua vim.g.cmp_active=false<cr>', "Completion off" },
    C = { '<cmd>lua vim.g.cmp_active=true<cr>', "Completion on" },
    w = { '<cmd>lua require("user.functions").toggle_option("wrap")<cr>', "Wrap" },
    r = { '<cmd>lua require("user.functions").toggle_option("relativenumber")<cr>', "Relative" },
    l = { '<cmd>lua require("user.functions").toggle_option("cursorline")<cr>', "Cursorline" },
    L = { '<cmd>lua require("user.functions").toggle_option("list")<cr>', "List" },
    s = { '<cmd>lua require("user.functions").toggle_option("spell")<cr>', "Spell" },
    t = { '<cmd>lua require("user.functions").toggle_tabline()<cr>', "Tabline" },

  },
-- 
--   -- s = {
--   --   name = "Split",
--   --   s = { "<cmd>split<cr>", "HSplit" },
--   --   v = { "<cmd>vsplit<cr>", "VSplit" },
--   -- },
-- 
--   s = {
--     name = "Session",
--     s = { "<cmd>SaveSession<cr>", "Save" },
--     r = { "<cmd>RestoreSession<cr>", "Restore" },
--     x = { "<cmd>DeleteSession<cr>", "Delete" },
--     f = { "<cmd>Autosession search<cr>", "Find" },
--     d = { "<cmd>Autosession delete<cr>", "Find Delete" },
--     -- a = { ":SaveSession<cr>", "test" },
--     -- a = { ":RestoreSession<cr>", "test" },
--     -- a = { ":RestoreSessionFromFile<cr>", "test" },
--     -- a = { ":DeleteSession<cr>", "test" },
--   },

  r = {
    name = "Replace",
    R = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
    w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
    f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace in File" },
    -- https://github.com/nvim-pack/nvim-spectre/issues/93
    r = { "<cmd>lua require('spectre').open_visual({select_word=true, current_file=true})<cr>", "Replace Word in File" },
  },

  d = {
    name = "Debug",
    b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Breakpoint" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "Into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "Over" },
    O = { "<cmd>lua require'dap'.step_out()<cr>", "Out" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Repl" },
    l = { "<cmd>lua require'dap'.run_last()<cr>", "Last" },
    u = { "<cmd>lua require'dapui'.toggle()<cr>", "UI" },
    v = { "<cmd>DapVirtualTextToggle<cr>", "VirtualText" },
    w = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Widget" },
    -- w = { "<cmd>lua local widgets = require 'dap.ui.widgets'; widgets.centered_float(widgets.scopes)<cr>", "Widget" },
    j = { "<cmd>lua require'dap'.down()<cr>", "down" },
    k = { "<cmd>lua require'dap'.up()<cr>", "up" },
    n = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "RunToCursor" },
    x = { "<cmd>lua require'dap'.terminate()<cr>", "Exit" },
  },
-- 
--   -- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
--   -- nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
--   -- require("dapui").open()
--   -- require("dapui").close()
--   -- require("dapui").toggle()
-- 
  f = {
    name = "Find",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    f = { "<cmd>Telescope find_files hidden=true<cr>", "Find files" },
    g = { "<cmd>Telescope git_files<cr>", "Find git files" },
    t = { "<cmd>Telescope live_grep hidden=true<cr>", "Find Text" },  -- hidden is configed in telescope.lua: '-u' 
    p = { "<cmd>Telescope projects<cr>", "Find Projects" },
    s = { "<cmd>Telescope grep_string<cr>", "Find String" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    H = { "<cmd>Telescope highlights<cr>", "Highlights" },
    i = { "<cmd>lua require('telescope').extensions.media_files.media_files()<cr>", "Media" },
    l = { "<cmd>Telescope resume<cr>", "Last Search" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    T = { "<cmd>TodoTelescope<cr>", "TODO Telescope" },
    z = { "<cmd>lua require('telescope').extensions.zoxide.list()<cr>", "zoxide" },
  },

  g = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame" },
    -- l = { "<cmd>lua require 'gitsigns'.blame_line{full=true} <CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    -- d = {
    --   "<cmd>Gitsigns diffthis HEAD<cr>",
    --   "Diff",
    -- },
    d = {
      name = "Diff",
      d = { "<cmd>DiffviewOpen<cr>", "DiffviewOpen" },
      c = { "<cmd>DiffviewClose<cr>", "DiffviewClose" },
      h = { "<cmd>DiffviewFileHistory<cr>", "DiffviewFileHistory" },
    },
    G = {
      name = "Gist",
      a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
      d = { "<cmd>Gist -d<cr>", "Delete" },
      f = { "<cmd>Gist -f<cr>", "Fork" },
      g = { "<cmd>Gist -b<cr>", "Create" },
      l = { "<cmd>Gist -l<cr>", "List" },
      p = { "<cmd>Gist -b -p<cr>", "Create Private" },
    },
  },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    c = { "<cmd>lua require('user.lsp').server_capabilities()<cr>", "Get Capabilities" },
    d = { "<cmd>TroubleToggle<cr>", "Diagnostics" },
    w = {
      "<cmd>Telescope lsp_workspace_diagnostics<cr>",
      "Workspace Diagnostics",
    },
    -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
    f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
    F = { "<cmd>LspToggleAutoFormat<cr>", "Toggle Autoformat" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    h = { "<cmd>lua require('lsp-inlayhints').toggle()<cr>", "Toggle Hints" },
    H = { "<cmd>IlluminationToggle<cr>", "Toggle Doc HL" },
    I = { "<cmd>Mason<cr>", "Installer Info" },
    j = {
      "<cmd>lua vim.diagnostic.goto_next({buffer=0})<CR>",
      "Next Diagnostic",
    },
    k = {
      "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
      "Prev Diagnostic",
    },
    v = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Virtual Text" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    o = { "<cmd>SymbolsOutline<cr>", "Outline" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    R = { "<cmd>TroubleToggle lsp_references<cr>", "References" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = {
      "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
      "Workspace Symbols",
    },
    t = { '<cmd>lua require("user.functions").toggle_diagnostics()<cr>', "Toggle Diagnostics" },
    u = { "<cmd>LuaSnipUnlinkCurrent<cr>", "Unlink Snippet" },
  },
-- 
--   -- s = {
--   --   name = "Surround",
--   --   ["."] = { "<cmd>lua require('surround').repeat_last()<cr>", "Repeat" },
--   --   a = { "<cmd>lua require('surround').surround_add(true)<cr>", "Add" },
--   --   d = { "<cmd>lua require('surround').surround_delete()<cr>", "Delete" },
--   --   r = { "<cmd>lua require('surround').surround_replace()<cr>", "Replace" },
--   --   q = { "<cmd>lua require('surround').toggle_quotes()<cr>", "Quotes" },
--   --   b = { "<cmd>lua require('surround').toggle_brackets()<cr>", "Brackets" },
--   -- },
-- 
--   S = {
--     -- name = "Session",
--     -- s = { "<cmd>SaveSession<cr>", "Save" },
--     -- l = { "<cmd>LoadLastSession!<cr>", "Load Last" },
--     -- d = { "<cmd>LoadCurrentDirSession!<cr>", "Load Last Dir" },
--     -- f = { "<cmd>Telescope sessions save_current=false<cr>", "Find Session" },
--     name = "SnipRun",
--     c = { "<cmd>SnipClose<cr>", "Close" },
--     f = { "<cmd>%SnipRun<cr>", "Run File" },
--     i = { "<cmd>SnipInfo<cr>", "Info" },
--     m = { "<cmd>SnipReplMemoryClean<cr>", "Mem Clean" },
--     r = { "<cmd>SnipReset<cr>", "Reset" },
--     t = { "<cmd>SnipRunToggle<cr>", "Toggle" },
--     x = { "<cmd>SnipTerminate<cr>", "Terminate" },
--   },
-- 
  t = {
    name = "Terminal",
    ["1"] = { ":1ToggleTerm<cr>", "1" },
    ["2"] = { ":2ToggleTerm<cr>", "2" },
    ["3"] = { ":3ToggleTerm<cr>", "3" },
    ["4"] = { ":4ToggleTerm<cr>", "4" },
    -- n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    -- u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    -- p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    p = { "<cmd>TermExec cmd='ipython3' <cr>", "Python" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
    h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
    v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
  },
-- 
--   T = {
--     name = "Treesitter",
--     h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
--     p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
--     r = { "<cmd>TSToggle rainbow<cr>", "Rainbow" },
--   },
-- 
--   -- z = {
--   --   name = "Zen",
--   --   z = { "<cmd>TZAtaraxis<cr>", "Zen" },
--   --   m = { "<cmd>TZMinimalist<cr>", "Minimal" },
--   --   n = { "<cmd>TZNarrow<cr>", "Narrow" },
--   --   f = { "<cmd>TZFocus<cr>", "Focus" },
--   -- },
  -- y = {
  --   name = "MISC",
  --   r = { ":silent only | Jaq<cr>", "Run Code" },
  --   m = { ":MarkdownPreviewToggle<cr>", "Markdown" },
  -- }

  v = {
        name = "wiki",
        w = "Open default wiki index file",
        -- t = "Open default wiki index file in new tab",
        t = {"<cmd>VimwikiTable<cr>", "Table"},  -- overwrite default new tab keybinding
        s = "List available wiki index files",
        i = "Open default diary index file",
        C = { "<cmd>lua _NEW_WIKI()<CR>", "Create new wiki file" },

        ["<leader>"] = {
          name="diary",
          w = "Open diary wiki today",
          t = "Open diary wiki today in new tab",
          y = "Open diary wiki yesterday",
          m = "Open diary wiki tomorrow",
    }
  },
}

local vopts = {
  mode = "v", -- VISUAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}
local vmappings = {
--  -- ["/"] = { '<ESC><CMD>lua require("Comment.api").toggle.toggle_linewise_op(vim.fn.visualmode())<CR>', "Comment" },
  s = { "<esc><cmd>'<,'>SnipRun<cr>", "Run range" },
  -- z = { "<cmd>TZNarrow<cr>", "Narrow" },
}

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(vmappings, vopts)
which_key.register(m_mappings, m_opts)
