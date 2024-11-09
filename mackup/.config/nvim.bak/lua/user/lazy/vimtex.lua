return {
  "lervag/vimtex",
  ft = "tex",
  config = function()
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_compiler_engine = "xelatex"
    vim.g.maplocalleader = ","
  end,
}
