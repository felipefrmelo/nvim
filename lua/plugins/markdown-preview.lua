return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
  ft = { "markdown" },
  build = "cd app && npm install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_preview_options = {
      maid = {
        flowchart = {
          useMaxWidth = false,
          nodeSpacing = 80,
          rankSpacing = 80,
        },
        sequence = {
          useMaxWidth = false,
          diagramMarginX = 80,
          diagramMarginY = 40,
          boxMargin = 16,
          boxTextMargin = 8,
          messageMargin = 48,
        },
      },
    }
  end,
}
