# Adding a New Language (Revised)

This document outlines the steps required to add support for a new programming language to this Neovim configuration. Your setup is highly automated, so for linters and LSPs, you only need to declare what you want in one place, and the Mason installers will pick it up automatically.

---

## 1. Syntax Highlighting (Treesitter)

For Neovim to understand the syntax of the new language, you need to ensure its Treesitter parser is installed.

- **File to edit:** `lua/configs/treesitter.lua`
- **Action:** Add the name of the language parser to the `ensure_installed` table.

**Example for adding `typescript`:**
```lua
-- lua/configs/treesitter.lua
local options = {
    ensure_installed = {
        "bash",
        "css",
        "go",
        -- ... other languages
        "typescript", -- Add the new language parser here
        "vim",
        "yaml",
    },
    -- ...
}
```

---

## 2. LSP (Language Server Protocol)

Your configuration automatically installs any server listed in `lua/configs/lspconfig.lua`.

- **File to edit:** `lua/configs/lspconfig.lua`
- **Action:** Add the name of the LSP server (e.g., `vtsls` for TypeScript) to the `lspconfig.servers` table.

**Example for adding `vtsls`:**
```lua
-- lua/configs/lspconfig.lua
lspconfig.servers = {
    "lua_ls",
    "vtsls", -- Add the new LSP server here
    "gopls",
}
```

**How it works:** The `lua/configs/mason-lspconfig.lua` file automatically reads the `lspconfig.servers` table and tells Mason to install every server listed there. You do not need to edit `mason-lspconfig.lua` yourself.

*Note: If a server requires special setup options, you can add a separate configuration block for it, like you have for `gopls` in the same file.*

---

## 3. Code Formatting (Conform)

Formatters are defined per filetype. Mason-conform will then help you install the required tools.

- **File to edit:** `lua/configs/conform.lua`
- **Action:** Add the filetype and a list of formatters to the `formatters_by_ft` table.

**Example for adding `prettier` for `typescript` and `javascript`:**
```lua
-- lua/configs/conform.lua
local options = {
    formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettier" }, -- Add filetype and formatter
        javascript = { "prettier" }, -- Add filetype and formatter
    },
    -- ...
}
```

**How it works:** The `mason-conform.nvim` plugin detects which formatters you have configured here. You can then run `:Mason` to see and install the required formatter executables (e.g., `prettier`).

---

## 4. Linting (nvim-lint)

Similar to the LSP setup, your linting configuration automatically installs any linter you associate with a filetype.

- **File to edit:** `lua/configs/lint.lua`
- **Action:** Add the filetype and a list of linters to the `lint.linters_by_ft` table.

**Example for adding `luacheck` for `lua`:**
```lua
-- lua/configs/lint.lua
local lint = require("lint")

lint.linters_by_ft = {
    lua = { "luacheck" },
    typescript = { "eslint_d" }, -- Add filetype and linter
}
```

**How it works:** The `lua/configs/mason-lint.lua` file automatically reads the `lint.linters_by_ft` table and tells Mason to install every linter listed there. You do not need to edit `mason-lint.lua` yourself.