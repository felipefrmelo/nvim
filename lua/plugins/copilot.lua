
return {
    {
        'zbirenbaum/copilot.lua',
        event = "InsertEnter",
        lazy = true,
        config = function()
            require("copilot").setup({
              suggestion = {
                enabled = true,
                auto_trigger = false,
                debounce = 75,
                keymap = {
                  accept = false,
                  accept_word = false,
                  accept_line = false,
                  next = "<M-]>",
                  prev = "<M-[>",
                  dismiss = "<C-]>",
                },
              },
            })

          local suggestion = require("copilot.suggestion")
          vim.keymap.set('n', '<leader>ce', suggestion.toggle_auto_trigger, {})
          vim.keymap.set('n', '<leader>ce', suggestion.toggle_auto_trigger, {})
          vim.keymap.set("i", '<Tab>', function()
            if require("copilot.suggestion").is_visible() then
              require("copilot.suggestion").accept()
            else
              vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
            end
          end, {
            silent = true,
          })
        end
    }
}
