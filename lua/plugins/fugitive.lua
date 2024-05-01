return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
        vim.keymap.set("n", "<leader>gc", ":Gvdiffsplit!<CR>")
        vim.keymap.set("n", "<leader>gs", ":G<CR>")
        vim.keymap.set("n", "<leader>gb", ":G blame<CR>")
        vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "<leader>gi", "<cmd>diffget //3<CR>")
    end
}
