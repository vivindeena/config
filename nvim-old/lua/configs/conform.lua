local options = {
  formatters_by_ft = {
        go = { "gofumpt", "goimports_reviser", "golines" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        lua = { "stylua" }, -- optional
    },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
