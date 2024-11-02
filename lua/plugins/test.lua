return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-plenary",
      "marilari88/neotest-vitest",
      "nvim-neotest/neotest-jest",
      "rcasia/neotest-java",
    },
    lazy = false,
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-vitest")({
            vitestCommand = "npx vitest",
          }),
          require('neotest-jest')({
            jestCommand = "npm test --",
            env = { CI = true },
          }),
          require('rustaceanvim.neotest'),
          require("neotest-java")
        },
        summary = {
          animated = false,
          open = "botright vsplit | vertical resize 50"
        },
      })

      local neotest = require("neotest")
      vim.keymap.set("n", "t<C-n>", function() neotest.run.run() end, { noremap = true, silent = true })
      vim.keymap.set("n", "t<C-f>", function() neotest.run.run(vim.fn.expand("%")) end,
        { noremap = true, silent = true })
      vim.keymap.set("n", "tt", neotest.summary.toggle, { noremap = true, silent = true })
      vim.keymap.set("n", "t<C-l>", neotest.run.run_last, { noremap = true, silent = true })
      vim.keymap.set("n", "t<C-o>", neotest.output_panel.toggle, { noremap = true, silent = true })
      vim.keymap.set("n", "t<C-a>", neotest.run.attach, { noremap = true, silent = true })
      vim.keymap.set("n", "t<C-s>", function() neotest.run.run(vim.fn.getcwd()) end, { noremap = true, silent = true })
    end,
  }
}
