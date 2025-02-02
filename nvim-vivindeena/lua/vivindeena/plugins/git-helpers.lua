return {
	{
        "tpope/vim-fugitive",
        config = function()
            local keymap = vim.keymap

            -- Open Git status with <leader>gs
            keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Git status" })

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
                    opts["desc"] = "Git pull"
                    -- Pull from Git with <leader>p
                    keymap.set("n", "<leader>p", function()
                        vim.cmd.Git({ "pull" })
                    end, opts)

                    -- Get left side of diff (ours) with "gu"
                    opts["desc"] = "Get left side of diff (ours)"
                    keymap.set("n", "gu", "<cmd>diffget //2<CR>", opts)

                    -- Get right side of diff (theirs) with "gh"
                    opts["desc"] = "Get right side of diff (theirs)"
                    keymap.set("n", "gh", "<cmd>diffget //3<CR>", opts)
                end,
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({})

            -- Preview hunk inline with <leader>gld
            vim.keymap.set("n", "<leader>gld", ":Gitsigns preview_hunk_inline<CR>", { desc = "Preview Git hunk inline" })
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
