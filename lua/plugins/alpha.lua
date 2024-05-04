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

      -- get Mru files
      local function get_mru_files()
        local mru_files = vim.fn.reverse(vim.fn.getqflist({}).items)
        local files = {}
        for _, file in ipairs(mru_files) do
          table.insert(files, file.filename)
        end
        return files
      end

      -- Set section
      -- Set menu
      dashboard.section.buttons.val = {
        dashboard.button("f", "   Find file", ":Telescope find_files<CR>"),
        dashboard.button("e", "   Explore", ":e %:p:h<CR>"),
        dashboard.button("r", "   Recent", ":Telescope oldfiles<CR>"),
        dashboard.button("p", "   Plugins", ":Lazy<CR>"),
        dashboard.button("s", "   Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
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
