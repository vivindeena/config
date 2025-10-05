local options = {
    ensure_installed = {
        "bash",
        "css",
        "go",
        "html",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "printf",
        "toml",
        "typescript",
        "vim",
        "vimdoc",
        "yaml"
    }

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

require("treesitter.configs").setup(options)
