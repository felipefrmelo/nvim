return {
  {
    'goolord/alpha-nvim',
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local fortune = require("alpha.fortune")

      -- Set header
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }

      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
        dashboard.button("e", "   Explore", ":e %:p:h<CR>"),
        dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("p", "   Plugins", ":Lazy<CR>"),
        dashboard.button("s", "   Settings", ":e $MYVIMRC | :cd %:p:h |  Explore<CR>"),
        dashboard.button("q", "   Quit", ":qa<CR>"),
      }

      dashboard.section.footer.val = fortune()

      -- Send config to alpha
      alpha.setup(dashboard.opts)

      -- Disable folding on alpha buffer
      vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
    end
  }
};
