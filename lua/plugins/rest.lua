return {
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    init = function()
      vim.g.rest_nvim = {
        env = { enable = true },
        response = { hooks = { format = true } },
      }
    end,

    config = function()
      local telescope = require("telescope")
      telescope.load_extension("rest")

      vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<cr>", { desc = "Run HTTP request" })
      vim.keymap.set("n", "<leader>rl", "<cmd>Rest last<cr>", { desc = "Run last HTTP request" })
      vim.keymap.set("n", "<leader>re", function()
        telescope.extensions.rest.select_env()
      end, { desc = "Select REST environment" })
    end,
  }
}
