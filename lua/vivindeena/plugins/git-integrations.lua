return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

            local fugitive_group = vim.api.nvim_create_augroup("fugitive_group", {})

            local autocmd = vim.api.nvim_create_autocmd
            autocmd("BufWinEnter", {
                group = fugitive_group,
                pattern = "*",
                callback = function()
                    if vim.bo.ft ~= "fugitive" then
                        return
                    end

                    local bufnr = vim.api.nvim_get_current_buf()
                    local opts = { buffer = bufnr, remap = false }

                    -- rebase always
                    vim.keymap.set("n", "<leader>p", function()
                        vim.cmd.Git({ "pull" })
                    end, opts)
                end,
            })

            vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
            vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})
            vim.keymap.set("n", "<leader>gld", ":Gitsigns preview_hunk_inline<CR>", {})
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
        },
    },
}
