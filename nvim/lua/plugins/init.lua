return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.treesitter")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lspconfig")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lspconfig" },
        config = function()
            require("configs.mason-lspconfig")
        end,
    },
    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require("configs.lint")
        end,
    },
    {
        "rshkarin/mason-nvim-lint",
        event = "VeryLazy",
        dependencies = { "nvim-lint" },
        config = function()
            require("configs.mason-lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        event = "BufWritePre",
        opts = require("configs.conform"),
    },
    {
        "zapling/mason-conform.nvim",
        event = "VeryLazy",
        dependencies = { "conform.nvim" },
        config = function()
            require("configs.mason-conform")
        end,
    },
    -- Autocompletion engine
    {
        "hrsh7th/nvim-cmp",
        config = function(_, opts)
            local cmp = require("cmp")

            local mymappings = {
                ["<C-k>"] = cmp.mapping.select_prev_item(),
                ["<C-j>"] = cmp.mapping.select_next_item(),
            }

            opts.mapping = vim.tbl_deep_extend("force", opts.mapping, mymappings)
            cmp.setup(opts)
        end,
    },
    {
        "polarmutex/git-worktree.nvim",
        version = "^2",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
        config = function()
            local Hooks = require("git-worktree.hooks")
            local config = require("git-worktree.config")
            local update_on_switch = Hooks.builtins.update_current_buffer_on_switch

            Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
                vim.notify("Moved from " .. prev_path .. " to " .. path)
                update_on_switch(path, prev_path)
            end)

            Hooks.register(Hooks.type.DELETE, function()
                vim.cmd(config.update_on_change_command)
            end)
            require("telescope").load_extension("git_worktree")
        end,
    },
    {
        "olexsmir/gopher.nvim",
        ft = "go",
        dependencies = { "ray-x/go.nvim", "nvim-lua/plenary.nvim" },

        build = function()
            vim.cmd.GoInstallDeps()
        end,
        ---@module "gopher"
        opts = {},
    },
    {
        "m4xshen/smartcolumn.nvim",
        opts = {
            colorcolumn = "80",
            disabled_filetypes = {
                "help",
                "text",
                "markdown",
                "html",
                "htmldjango",
                "xml",
                "json",
                "javascriptreact",
                "typescriptreact",
                "jsx",
                "tsx",
                "yaml",
                "toml",
                "csv",
            },
            custom_colorcolumn = {},
            scope = "file",
            editorconfig = true,
        },
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        event = "VeryLazy",
    },
    {
        "cappyzawa/trim.nvim",
        event = "VeryLazy",
        opts = {
            ft_blocklist = { "markdown" },
        },
    },
    {
        "mbbill/undotree",
        event = "VeryLazy",
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("todo-comments").setup()
        end,
    },
    {
        "nvzone/showkeys",
        event = "VeryLazy",
        opts = {
            position = "bottom-right",
            keyformat = {
                ["<BS>"] = "󰁮 ",
                ["<CR>"] = "󰘌",
                ["<Space>"] = "󱁐",
                ["<Up>"] = "󰁝",
                ["<Down>"] = "󰁅",
                ["<Left>"] = "󰁍",
                ["<Right>"] = "󰁔",
                ["<PageUp>"] = "Page 󰁝",
                ["<PageDown>"] = "Page 󰁅",
                ["<M>"] = "Alt",
                ["<C>"] = "Ctrl",
            },
        },
        config = function(_, opts)
            local showkeys = require("showkeys")
            showkeys.setup(opts)
            showkeys.toggle()
        end,
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = { "NvChad/NvChad" },
    },
    {
        "rcarriga/nvim-notify",
        event = "VeryLazy",
        opts = {
            baczkground_colour = "NotifyBackground",
            fps = 120,
            icons = {
                DEBUG = "",
                ERROR = "",
                INFO = "",
                TRACE = "✎",
                WARN = "",
            },
            level = 2,
            minimum_width = 50,
            render = "compact",
            stages = "fade",
            time_formats = {
                notification = "%T",
                notification_history = "%FT%T",
            },
            timeout = 300,
            top_down = true,
        },
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            { "rcarriga/nvim-notify" },
        },
        opts = {},
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
}
