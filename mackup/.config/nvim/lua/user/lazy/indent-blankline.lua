return {
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      local status_ok, indent_blankline = pcall(require, "indent_blankline")
      if not status_ok then
        return
      end

      indent_blankline.setup({
        char = "▏",
        show_trailing_blankline_indent = false,
        show_first_indent_level = true,
        use_treesitter = true,
        show_current_context = true,
        buftype_exclude = { "terminal", "nofile" },
        filetype_exclude = {
          "help",
          "packer",
          "NvimTree",
        },
        show_end_of_line = true,
        space_char_blankline = " ",
      })
    end,
    event = "VeryLazy",
  },
}
