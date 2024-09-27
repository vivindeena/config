vim.g.mapleader = " "

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"

-- Ensure colorcolumn is changed specifically for Python files
--[[vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
  pattern = { "python" },
  callback = function()
    -- Attempt to set the colorcolumn to 120
    vim.wo.colorcolumn = "120"
    print("Setting colorcolumn for Python to:", vim.wo.colorcolumn)
  end,
})]]

