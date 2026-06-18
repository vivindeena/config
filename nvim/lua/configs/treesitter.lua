local options = {
    ensure_installed = {
        "bash",
        "css",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "html",
        "javascript",
        "json",
        -- "latex",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "printf",
        "toml",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "yaml",
    },

    highlight = {
        enable = true,
        use_languagetree = true,
    },

    indent = { enable = true },
}

vim.treesitter.query.set(
    "markdown",
    "injections",
    [[
(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
]]
)

require("nvim-treesitter.configs").setup(options)
