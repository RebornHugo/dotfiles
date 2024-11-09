return {
  -- Graveyard by Christian
  {
    "folke/trouble.nvim",
    -- dependencies = "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  },
}
