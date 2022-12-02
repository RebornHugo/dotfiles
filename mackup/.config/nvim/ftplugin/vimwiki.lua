local status_ok, clipboard_image = pcall(require, "clipboard-image")
if not status_ok then
    return
end

clipboard_image.setup {
  -- Default configuration for all filetype
  default = {
    img_dir = "images",
    img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
    affix = "<\n  %s\n>" -- Multi lines affix
  },
  -- You can create configuration for ceartain filetype by creating another field (markdown, in this case)
  -- If you're uncertain what to name your field to, you can run `lua print(vim.bo.filetype)`
  -- Missing options from `markdown` field will be replaced by options from `default` field
  markdown = {
    -- img_dir = {"src", "assets", "img"}, -- Use table for nested dir (New feature form PR #20)
    img_dir = {"src", "assets", "img"}, -- Use table for nested dir (New feature form PR #20)
    img_dir_txt = "/assets/img",
    img_handler = function(img) -- New feature from PR #22
      local script = string.format('./image_compressor.sh "%s"', img.path)
      os.execute(script)
    end,
  },

  vimwiki = {
    img_dir = {require("user.functions").get_current_dir(), "images"},
    img_dir_txt = "images",
    img_name = function() return os.date('%Y-%m-%d-%H-%M-%S') end, -- Example result: "2021-04-13-10-04-18"
    affix = "![](%s)"
  },
}

-- configs for whichkey
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local opts = {
  mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

  v = {
        name = "wiki",
        h="HTML",
        ["hh"]="HTML&Browse",
        a = {"<cmd>VimwikiAll2HTML<cr>", "HTML all"},  -- overwrite default new tab keybinding
        A = {"<cmd>VimwikiAll2HTML!<cr>", "HTML All"},  -- overwrite default new tab keybinding
        b = {"<cmd>VimwikiBacklinks<cr>", "show backlinks"},  -- overwrite default new tab keybinding
        c = "colorize",  -- overwrite default new tab keybinding
        p = {"<cmd>PasteImg<cr>", "paste clipboard images"}
        -- ["w<leader>w"] = "Open diary wiki-file for today of the [count]'s wiki.",
    -- TODO: pastimage
  },
}
-- ["<CR>"]="Follow/create wiki link"

local options = { noremap = true }
-- vim.keymap.set("n", "<C-Backspace>", "VimwikiGoBackLink", options)
-- vim.cmd("unmap <Plug><Backspace>")
vim.cmd("nnoremap <Leader><Backspace> <Plug>VimwikiGoBackLink")
-- vim.api.nvim_set_keymap("n", "<Leader><Backspace>", ":VimwikiGoBackLink<CR>", { noremap = true, silent = true, nowait = true })
-- vim.keymap.set("n", "<leader><Backspace>", "VimwikiGoBackLink", options)

which_key.register(mappings, opts)
