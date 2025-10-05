return {
  -- Conform for formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform" -- this runs the setup
    end,
  },

  -- Treesitter for syntax highlighting and more
  {
    "nvim-treesitter/nvim-treesitter",
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        require("configs.treesitter")
    end
  },
}
  -- -- Mason for managing LSP servers, DAP servers, linters, and formatters
  -- {
  --   "williamboman/mason.nvim",
  --   opts = {
  --     ensure_installed = {
  --       "gopls",
  --       "typescript-language-server",
  --       "eslint-lsp",
  --       "prettier",
  --       "taplo",
  --       "lua-language-server",
  --     },
  --   },
  -- },
  -- -- Debug Adapter Protocol for debugging
  -- {
  --   "mfussenegger/nvim-dap",
  --   init = function()
  --     require("core.utils").load_mappings("dap")
  --   end
  -- },
  --
  -- -- DAP extension for Go
  -- {
  --   "leoluz/nvim-dap-go",
  --   ft = "go",
  --   dependencies = "mfussenegger/nvim-dap",
  --   config = function(_, opts)
  --     require("dap-go").setup(opts)
  --     require("core.utils").load_mappings("dap_go")
  --   end
  -- },
  --
  -- -- LSP configuration
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- -- None-ls for formatters and linters
  -- {
  --   "nvimtools/none-ls.nvim",
  --   ft = { "go", "javascript", "typescript", "css", "html", "json", "yaml", "markdown", "toml" },
  --   opts = function()
  --     return require "configs.none-ls"
  --   end,
  -- },
  -- -- Go development plugin
  -- {
  --   "olexsmir/gopher.nvim",
  --   ft = "go",
  --   opts = {},
  --   config = function(_, opts)
  --     require("gopher").setup(opts)
  --     require("core.utils").load_mappings("gopher")
  --   end,
  --   build = function()
  --     vim.cmd.GoInstallDeps()
  --   end,
  -- },
  --
  -- -- Autocompletion engine
  -- {
  --   "hrsh7th/nvim-cmp",
  --   config = function(_, opts)
  --     local cmp = require "cmp"
  --
  --     local mymappings = {
  --       ["<C-k>"] = cmp.mapping.select_prev_item(),
  --       ["<C-j>"] = cmp.mapping.select_next_item(),
  --     }
  --
  --     opts.mapping = vim.tbl_deep_extend("force", opts.mapping, mymappings)
  --     cmp.setup(opts)
  --   end,
  -- },
  -- {
  --   "polarmutex/git-worktree.nvim",
  --   version = "^2",
  --   dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  --   config = function()
  --     local Hooks = require "git-worktree.hooks"
  --     local config = require "git-worktree.config"
  --     local update_on_switch = Hooks.builtins.update_current_buffer_on_switch
  --
  --     Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
  --       vim.notify("Moved from " .. prev_path .. " to " .. path)
  --       update_on_switch(path, prev_path)
  --     end)
  --
  --     Hooks.register(Hooks.type.DELETE, function()
  --       vim.cmd(config.update_on_change_command)
  --     end)
  --     require("telescope").load_extension "git_worktree"
  --   end,
  -- },
