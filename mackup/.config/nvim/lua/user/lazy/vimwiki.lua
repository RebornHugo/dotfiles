-- credit goes here: https://github.com/dgiacomo/Neovim-from-scratch/blob/master/lua/user/vimwiki.lua
vim.g.vimwiki_list = {
  {
    path = "~/Workspace/Writing/VimWiki/",
    path_html = "~/Workspace/Writing/VimWikiHTML/",
    -- css_name = "github-markdown-light.css",
    -- some beatifule css: https://www.npmjs.com/package/markdown-styles
    css_name = "WiTex.css",
    syntax = "markdown",
    ext = ".md",
    -- custom_wiki2html = 'vimwiki_markdown',
    -- custom_wiki2html = "$HOME/.local/share/nvim/site/pack/packer/start/vimwiki/autoload/vimwiki/customwiki2html.sh",
    custom_wiki2html = "~/.config/nvim/misc/vimwiki/wiki2html.sh",
    template_default = "markdown",
    template_ext = ".html",
    template_path = "~/.config/nvim/misc/vimwiki/template/",

    -- ext = '/index.md',
    -- auto_toc = 1,
    -- html_filename_parameterization=1,
    links_space_char = "_",
    nested_syntaxes = { python = "python", ["c++"] = "cpp" },
    -- template_ext='.tpl',
  },
}
vim.g.vimwiki_ext2syntax = {
  [".md"] = "markdown",
  [".markdown"] = "markdown",
  [".mdown"] = "markdown",
}
vim.g.vimwiki_global_ext = 0 -- don't treat all md files as vimwiki (0)
vim.g.vimwiki_folding = "list"
-- vim.g.vimwiki_list = {{listsyms = '✗○◐●✓'}}
-- vim.g.vimwiki_folding = "custom"
vim.g.vimwiki_hl_headers = 1 -- use alternating colours for different heading levels
vim.g.vimwiki_markdown_link_ext = 1 -- add markdown file extension when generating links
vim.g.taskwiki_markdown_syntax = "markdown"
vim.g.indentLine_conceallevel = 2 -- indentline controlls concel
vim.g.vimwiki_map_prefix = "<Leader>v"
--vim.set.o.conceallevel = 1 -- so that I can see `` and full urls in markdown files

-- vim.api.nvim_set_keymap("n", "<F3>", ":VimwikiDiaryPrevDay<CR>", { noremap = true, silent = true, nowait = true })
-- vim.api.nvim_set_keymap("n", "<F4>", ":VimwikiDiaryNextDay<CR>", { noremap = true, silent = true, nowait = true })

-- vim.cmd([[
--  autocmd BufNewFile */diary/????-??-??.md call New_vimwiki_diary_template()

-- function New_vimwiki_diary_template()
-- "" If it's Friday, open a end of week lookback template
--    if system('date +%u') == 5
--         read ~/vimwiki/Diary\ TemplateEndOfWeek.md | execute "normal ggdd"
--     else
--         read  ~/vimwiki/Diary\ Template.md | execute "normal ggdd"
--     end
--  endfunction
-- ]])

-- Function to create taskwiki
function vimwikiSubtask(text)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  -- Lua string concat is done via .. instead of + : "text" .. var is equiv to "text" + var in most languages
  local txt = "##" .. text .. " || project:" .. text
  local nline = line:sub(0, pos) .. txt .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

_NEW_WIKI = function()
  local title = vim.fn.input("Title: ")
  vim.cmd("redraw") -- Required to stop prints from appending text after input().
  if title == "" then
    return
  end
  local name = title:gsub(" ", "_") .. ".md"
  name = name:lower()
  local path = vim.fn.expand(vim.g.vimwiki_list[1].path) .. "/" .. name

  -- Check if file already exists.
  local file = io.open(path, "r")
  if file ~= nil then
    file:close()
    print("File " .. path .. " exists.")
    return
  end

  -- Create a new buffer, set the name to the file path, and set it to the current buffer.
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_buf_set_name(buf, path)
  vim.api.nvim_set_current_buf(buf)

  -- Add the content to the buffer (don't write to file).
  local content = {
    "---",
    "title: " .. title,
    "tags: []",
    "date: " .. os.date("%Y-%m-%d"),
    "---",
    "",
    "# " .. title,
  }
  vim.api.nvim_buf_set_lines(buf, 0, 0, true, content)
end

-- This was pretty hard to find - how to pass an argument to a vim function : https://stackoverflow.com/questions/3213657/vim-how-to-pass-arguments-to-functions-from-user-commands
-- Also need to use a syntax like command! <commandName> lua <lua function>() as the generic way to map a lua function to a vim cmd
vim.cmd([[command! -nargs=1 VimWikiSubTask lua vimwikiSubtask(<f-args>)]])

return {
  -- vimwiki --
  {
    "vimwiki/vimwiki",
    branch = "dev",
    event = "VeryLazy",
  },
}
