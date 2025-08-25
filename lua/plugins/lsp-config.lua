return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      
      -- Setup mason-lspconfig
      -- Enhanced LSP keybindings with descriptions
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Show hover information" })
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "LSP: Show references" })
      vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "LSP: Go to implementation" })
      vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "LSP: Go to type definition" })
      vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "LSP: Go to declaration" })
      vim.keymap.set({ "x", "n" }, "<leader>ga", vim.lsp.buf.code_action, { desc = "LSP: Code actions" })
      vim.keymap.set({ "x", "n" }, "<leader>gf", vim.lsp.buf.format, { desc = "LSP: Format document" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: Rename symbol" })
      -- function signature help
      vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Show signature help" })

      -- Diagnostic navigation
      vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, { desc = "Diagnostic: Next" })
      vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, { desc = "Diagnostic: Previous" })
      vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Diagnostic: Show line diagnostics" })
      vim.keymap.set("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Diagnostic: Set location list" })
      
      -- Setup LSP servers (install via Mason :MasonInstall <server>)
      -- For JDTLS: :MasonInstall jdtls
      
      -- Enable LSP servers using the new Neovim 0.11+ API
      vim.lsp.enable("jdtls")
      vim.lsp.enable('pyright')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('gopls')
    end,
  }
}
