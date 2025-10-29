require("nvchad.autocmds")

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
    group = highlight_group,
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

-- Quit Neovim if the last window is nvim-tree
-- local nvimtree_group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
--     group = nvimtree_group,
--     pattern = "*",
--     callback = function()
--         if vim.fn.winnr("$") == 1 and vim.bo.filetype == "nvimtree" then
--             vim.cmd("q")
--         end
--     end,
-- })
--
-- vim.api.nvim_create_autocmd("BufDelete", {
--     callback = function()
--         local bufs = vim.t.bufs
--         if #bufs == 1 and vim.api.nvim_buf_get_name(bufs[1]) == "" then
--             vim.cmd("Nvdash")
--         end
--     end,
-- })

-- Enable line wrapping for markdown files
local markdown_wrap_group = vim.api.nvim_create_augroup("MarkdownWrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = markdown_wrap_group,
    pattern = "markdown",
    callback = function()
        vim.opt.wrap = true
    end,
})

-- Enable line wrapping for quickfix and loclist
local list_wrap_group = vim.api.nvim_create_augroup("ListWrap", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = list_wrap_group,
	pattern = { "qf", "loclist" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})
