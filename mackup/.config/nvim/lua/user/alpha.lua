local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
  b.opts.hl_shortcut = "Macro"
  return b
end

local icons = require "user.icons"

dashboard.section.header.val = {
  [[                               __                ]],
  [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
  [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
  [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
  [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
  [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
  button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
  button("f", " " .. " Find file", ":Telescope find_files <CR>"),
  button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
  button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
  button("g", " " .. " Git Files", ":Telescope git_files <CR>"),
  button("o", " " .. " Changed Files", ":Telescope git_status <CR>"),
  button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
  button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
  -- button("s", icons.ui.SignIn .. "  Find Session", ":SearchSession<CR>"),
  button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
  button("q", " " .. " Quit", ":qa<CR>"),
}
local function footer()
  return "Hugo's NVim"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
