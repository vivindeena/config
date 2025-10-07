# My NvChad Configuration

This is a personalized NvChad setup with additional plugins and customizations.

---

## Plugins & Language Support

### Installed Plugins

- **`gopher.nvim`**: For enhanced Go development workflows.
- **`hiphish/rainbow-delimiters.nvim`**: Provides rainbow-colored parentheses, brackets, and braces.
- **`m4xshen/smartcolumn.nvim`**: Adds a dynamic color column that respects filetypes and editorconfig.
- **`folke/todo-comments.nvim`**: To highlight and manage TODO comments.
- **`mbbill/undotree`**: To visualize the undo history.
- **`nvzone/showkeys`**: To display keypresses.
- **`OXY2DEV/markview.nvim`**: For Markdown preview.

### Adding a New Language

This document outlines the steps required to add support for a new programming language to this Neovim configuration. Your setup is highly automated, so for linters and LSPs, you only need to declare what you want in one place, and the Mason installers will pick it up automatically.

#### 1. Syntax Highlighting (Treesitter)

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

#### 2. LSP (Language Server Protocol)

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

_Note: If a server requires special setup options, you can add a separate configuration block for it, like you have for `gopls` in the same file._

#### 3. Code Formatting (Conform)

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

#### 4. Linting (nvim-lint)

Similar to the LSP setup, your linting configuration automatically installs any linter you associate with a filetype.

- **File to edit:** `lua/configs/lint.lua`
- **Action:** Add the filetype and a list of linters to the `linters_by_ft` table.

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

---

## Customizations

This configuration includes several enhancements over the base NvChad setup:

### Keymap Grouping (NvChad v2.5)

In NvChad v2.5, keymap grouping for the cheatsheet (`<leader>ch`) is implicit and controlled by the `desc` field of each mapping.

**How it Works:**

- **Group Name**: The first word of the `desc` string determines the group name.
- **Description**: The rest of the string becomes the description for the keymap.
- **Capitalization**: Group names are automatically capitalized in the cheatsheet.
- **Mode-Specific Groups**: Mappings set for modes other than normal mode (e.g., visual, insert) will have the mode appended to the group name, like `MyGroup (v)`.

**Correct Usage:**

To ensure your custom mappings are organized correctly, always start the `desc` string with a group name followed by a space.

**Example:**

```lua
-- These mappings will be grouped under "LSP"
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to definition" })
vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP Find references" })

-- This will be grouped under "Clipboard (v)"
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Clipboard Yank" })
```

This will appear in the cheatsheet as:

**LSP**

- `Go to definition` `gd`
- `Find references` `gr`

**Clipboard (v)**

- `Yank` `<leader>y`

**Note:** Certain group names can be excluded from the cheatsheet via the `nvconfig` file.

### Custom Autocommands

- An autocommand in `lua/autocmds.lua` automatically opens the NvChad dashboard when the last buffer is closed.

---

## TODO

- [ ] Fix gopher.nvim
