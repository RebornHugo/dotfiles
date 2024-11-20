return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[
        ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
        ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z
        ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z
        ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z
        ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝
 ]],
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "t", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          -- { icon = " ", key = "o", desc = "Changed Files", action = ":Telescope git_status" },
        },
      },
      -- sections = {
      --   { section = "header" },
      --   {
      --     pane = 2,
      --     section = "terminal",
      --     cmd = "colorscript -e square",
      --     height = 5,
      --     padding = 1,
      --   },
      --   { section = "keys", gap = 1, padding = 1 },
      --   { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
      --   { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
      --   {
      --     pane = 2,
      --     icon = " ",
      --     title = "Git Status",
      --     section = "terminal",
      --     enabled = vim.fn.isdirectory(".git") == 1,
      --     cmd = "hub status --short --branch --renames",
      --     height = 5,
      --     padding = 1,
      --     ttl = 5 * 60,
      --     indent = 3,
      --   },
      --   { section = "startup" },
      -- },
    },
  },
}
