return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  lazy = false,
  version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
  opts = {
    -- add any opts here
    -- for example
    provider = "gemini",
    copilot = {
      model = "claude-3.5-sonnet", -- your desired model (or use gpt-4o, etc.)
      temperature = 0,
      max_tokens = 8192,
    },
    openai = {
      model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
      --model = "o1-mini", -- your desired model (or use gpt-4o, etc.)
      temperature = 0,
      max_tokens = 8192,
    },
    gemini = {
      endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
      model = "gemini-2.5-flash-preview-04-17",
      timeout = 30000, -- Timeout in milliseconds
      temperature = 0,
      max_tokens = 8192,
    },
    behaviour = {
      auto_set_keymaps = true,
      enable_cursor_planning_mode = false, --
    },
    vendors = {
      --- ... existing vendors
      groq = { -- define groq provider
        __inherited_from = 'openai',
        api_key_name = 'GROQ_API_KEY',
        endpoint = 'https://api.groq.com/openai/v1/',
        model = 'qwen-2.5-coder-32b',
        temperature = 0.1,
        max_tokens = 8192,
      },
    },
    mappings = {
      ask = "<leader>ia",     -- ask
      edit = "<leader>ie",    -- edit
      refresh = "<leader>ir", -- refresh
      focus = "<leader>if",   -- focus
      diff = {
        ours = "<leader>co",
        theirs = "<leader>ct",
        all_theirs = "<leader>ca",
        both = "<leader>cb",
        cursor = "<leader>cc",
        next = "<leader>]",
        prev = "<leader>[",
      },
    },
    windows = {
      position = "right", -- or 'top'
    },
  },
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  build = "make",
  init = function()
    vim.keymap.set('n', '<leader>ic', ':AvanteChat<CR>', { silent = true, noremap = true, desc = "Open Avante Chat" })
    -- Custom system prompt configuration
    vim.api.nvim_create_autocmd("User", {
      pattern = "ToggleTDDPrompt",
      callback = function()
        require("avante.config").override({
          system_prompt = [[
            Act as an expert TDD (Test-Driven Development) programmer focused on small, incremental steps.

            I will follow this strict one-step-at-a-time approach:

            1. For each iteration, I will only do ONE of these steps:

               RED Step:
               - Write exactly ONE new failing test
               - Test only ONE specific behavior
               - Make it as small and focused as possible
               - Explain why this test is needed

               GREEN Step:
               - Write the minimal code to make ONLY the current failing test pass
               - No additional functionality
               - No refactoring yet
               - Verify only this test passes

               REFACTOR Step:
               - Improve ONE aspect of the code
               - Keep all tests passing
               - Explain the specific improvement made

            2. After completing ONE step, I will:
               - Stop and show the current state
               - Wait for confirmation before proceeding
               - Never combine steps in a single iteration

            3. For each step I will:
               - Explain what I'm about to do
               - Show the code changes
               - Explain why this change matters
               - Ask for permission to continue to the next step

            I will maintain this disciplined, incremental approach throughout the entire development process.]]
        })
      end,
    })

    -- Keybinding to toggle custom prompt
    vim.keymap.set("n", "<leader>im", function()
      vim.api.nvim_exec_autocmds("User", { pattern = "ToggleTDDPrompt" })
    end, { desc = "avante: toggle TDD prompt" })
  end,
  -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    --- The below dependencies are optional,
    "echasnovski/mini.pick",         -- for file_selector provider mini.pick
    "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
    "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions
    "ibhagwan/fzf-lua",              -- for file_selector provider fzf
    "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
    "zbirenbaum/copilot.lua",        -- for providers='copilot'
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
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}
