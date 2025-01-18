--dsaj plugins/telescope.lua:
return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    config = function()
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = "close"
            }
          }
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
     })

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pg', builtin.git_files, {})
      vim.keymap.set('n', '<leader>pd', builtin.diagnostics, {})
      vim.keymap.set('n', '<leader>pws', function()
          local word = vim.fn.expand("<cword>")
          builtin.grep_string({ search = word })
      end)
      vim.keymap.set('n', '<leader>pWs', function()
          local word = vim.fn.expand("<cWORD>")
          builtin.grep_string({ search = word })
      end)
      vim.keymap.set('n', '<leader>ps', function()
          builtin.grep_string({ search = vim.fn.input("Grep > ") })
      end)
      vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
      vim.keymap.set('n', '<C-b>',  function() builtin.buffers { sort_lastused = true } end, {})

      require("telescope").load_extension("ui-select")
  end
  }
}
