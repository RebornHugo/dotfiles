return {
  "Exafunction/codeium.vim",

  enabled = true,
  event = "BufRead",
  cmd = "Codeium",
  -- disable_filetype = { "TelescopePrompt"},

  config = function()
    vim.keymap.set("i", "<C-f>", function()
      return vim.fn["codeium#Accept"]()
    end, { expr = true, nowait = true })
    vim.keymap.set("i", "<c-n>", function()
      return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    vim.keymap.set("i", "<c-p>", function()
      return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    vim.keymap.set("i", "<c-x>", function()
      return vim.fn["codeium#Clear"]()
    end, { expr = true })
  end,
}
