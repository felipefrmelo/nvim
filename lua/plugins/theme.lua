return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
         flavour = "mocha", -- latte, frappe, macchiato, mocha
          background = { -- :h background
              dark = "mocha",
          },
      })
      vim.cmd.colorscheme "catppuccin-mocha"
    end
  }
}

