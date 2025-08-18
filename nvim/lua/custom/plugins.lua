local plugins = {
  -- Mason for managing LSP servers, DAP servers, linters, and formatters
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",
        "typescript-language-server",
        "eslint-lsp",
        "prettier"
      },
    },
  },

  -- Treesitter for syntax highlighting and more
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "go"
      }
    }
  },

  -- Debug Adapter Protocol for debugging
  {
    "mfussenegger/nvim-dap",
    init = function()
      require("core.utils").load_mappings("dap")
    end
  },

  -- DAP extension for Go
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("dap_go")
    end
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("lspconfig").setup({
        deprecation_warnings = false,
      })
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- Null-ls for formatters and linters
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  -- Go development plugin
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function(_, opts)
      require("gopher").setup(opts)
      require("core.utils").load_mappings("gopher")
    end,
    build = function()
      vim.cmd.GoInstallDeps()
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
  }
}
return plugins