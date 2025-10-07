local nvlsp = require("nvchad.configs.lspconfig")

nvlsp.defaults()
-- list of all servers configured.
nvlsp.servers = {
    "lua_ls",
    "vtsls",
    "gopls",
    "tailwindcss",
    "eslint",
}

vim.lsp.config["gopls"] = {
    on_attach = function(client, bufnr)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
        nvlsp.on_attach(client, bufnr)
    end,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl", "gowork" },
    -- root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git") or vim.fn.getcwd(),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
        },
    },
}

vim.lsp.enable(nvlsp.servers)
