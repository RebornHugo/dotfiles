return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = false, -- set this if you want to always pull the latest change
  opts = {
    -- add any opts here
    -- provider = "openai",
    -- openai = {
    --   model = "gpt-4o-mini",
    -- },
    --
    cursor_applying_provider = "deepseek_chat", -- In this example, use Groq for applying, but you can also use any provider you want.
    behaviour = {
      --- ... existing behaviours
      enable_cursor_planning_mode = true, -- enable cursor planning mode!
    },
    provider = "deepseek_chat",
    providers = {
      qianwen = {
        __inherited_from = "openai",
        api_key_name = "DASHSCOPE_API_KEY",
        endpoint = "https://dashscope.aliyuncs.com/compatible-mode/v1",
        -- model = "qwen-coder-plus-latest",
        model = "qwen2.5-coder-32b-instruct",
      },
      siliconflow = {
        __inherited_from = "openai",
        api_key_name = "SILICONFLOW_API_KEY",
        endpoint = "https://api.siliconflow.cn/v1",
        model = "Qwen/Qwen2.5-Coder-32B-Instruct",
      },
      deepseek_chat = {
        __inherited_from = "openai",
        api_key_name = "HUGO_DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
      },
      deepseek_reasoner = {
        __inherited_from = "openai",
        api_key_name = "HUGO_DEEPSEEK_API_KEY",
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-reasoner",
      },
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua", -- for providers='copilot'
    {
      -- support for image pasting
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        -- recommended settings
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          -- required for Windows users
          use_absolute_path = true,
        },
      },
    },
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
