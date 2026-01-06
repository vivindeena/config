local format_on_save_enabled = true

local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        css = { "prettierd" },
        html = { "prettierd" },
        javascript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescript = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        json = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        scss = { "prettierd" },
        less = { "prettierd" },
        toml = { "taplo" },
        ["goimports-reviser"] = {
            prepend_args = { "-rm-unused" },
        },
        golines = {
            prepend_args = { "--max-len=80" },
        },
    },

    format_on_save = function(bufnr)
        if format_on_save_enabled then
            return {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        end
    end,
}

_G.toggle_format_on_save = function()
    format_on_save_enabled = not format_on_save_enabled
    local status = format_on_save_enabled and "enabled" or "disabled"
    vim.notify("Format on save " .. status, vim.log.levels.INFO, { title = "Conform" })
end

return options
