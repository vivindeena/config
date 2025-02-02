local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.incsearch = true
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start"

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

--opt.colorcolumn = "80"

-- Ensure colorcolumn is changed specifically for Python files
--[[vim.api.nvim_create_autocmd({ "FileType", "BufReadPost" }, {
  pattern = { "python" },
  callback = function()
    -- Attempt to set the colorcolumn to 120
    vim.wo.colorcolumn = "120"
    print("Setting colorcolumn for Python to:", vim.wo.colorcolumn)
  end,
})]]
