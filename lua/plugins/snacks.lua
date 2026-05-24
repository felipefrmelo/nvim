return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = { },
  },
  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)
    vim.api.nvim_create_user_command('SnacksNotifications', function()
      snacks.notifier.show_history()
    end, { desc = 'Show snacks.nvim notification history' })
  end

}