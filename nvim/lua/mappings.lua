require("nvchad.mappings")

local map = vim.keymap.set

-- Normal mode mappings
map("n", "<leader>nh", ":nohl<CR>", { desc = "Search Clear highlights" })

-- Scroll and center
map("n", "<C-d>", "<C-d>zz", { desc = "Navigation Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Navigation Scroll up and center" })

-- Search result and center
map("n", "n", "nzzzv", { desc = "Search Next result and center" })
map("n", "N", "Nzzzv", { desc = "Search Previous result and center" })

-- Todo-comments
map("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Search Next todo comment" })
map("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Search Previous todo comment" })

-- UndoTree
map("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Editing Toggle undotree" })

-- Yank line to system clipboard
map("n", "<leader>Y", [["+Y]], { desc = "Clipboard Yank line to system" })

-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Window Split vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Window Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Window Make splits equal" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Window Close current split" })

map("n", "<M-h>", "<C-w>h", { desc = "Window Go to left" })
map("n", "<M-j>", "<C-w>j", { desc = "Window Go to down" })
map("n", "<M-k>", "<C-w>k", { desc = "Window Go to up" })
map("n", "<M-l>", "<C-w>l", { desc = "Window Go to right" })

-- Substitute word under cursor
map(
    "n",
    "<leader>sr",
    [[:%s/\<\<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Editing Substitute word under cursor" }
)

-- Tab management
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Tab Close current", silent = true })

-- Telescope
map("n", "<leader>km", "<cmd>Telescope keymaps<CR>", { desc = "Telescope Show keymaps" })

-- Git worktree (Telescope)
map("n", "<leader>gw", function()
    require("telescope").extensions.git_worktree.git_worktree()
end, { desc = "Git Switch worktree" })

map("n", "<leader>gwa", function()
    require("telescope").extensions.git_worktree.create_git_worktree()
end, { desc = "Git Create new worktree" })

-- Disable Q
map("n", "Q", "<nop>", { desc = "System Disable Q" })

-- Dump messages
map("n", "<leader>dm", "<cmd>DumpMsgs<CR>", { desc = "System Dump messages" })

-- Delete without yanking
map("n", "<leader>d", [["_d]], { desc = "Editing Delete without yanking" })

-- Yank to system clipboard
map("n", "<leader>y", [["+y]], { desc = "Clipboard Yank to system" })

-- Go mappings
map("n", "<leader>gi", "<cmd>GoIfErr<CR>", { desc = "Go Handle if-err" })
map("n", "<leader>gsj", "<cmd>GoTagAdd json<CR>", { desc = "Go Add json struct tags" })
map("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", { desc = "Go Add yaml struct tags" })

-- Visual mode mappings
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Editing Move line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Editing Move line up" })
map("v", "<leader>y", [["+y]], { desc = "Clipboard Yank to system" })
map("v", "<leader>d", [["_d]], { desc = "Editing Delete without yanking" })

-- Visual block mode mappings
map("x", "<leader>p", [["_dP]], { desc = "Clipboard Paste without overwriting" })

-- Showkeys toggle
map("n", "<leader>sk", "<cmd>ShowkeysToggle<CR>", { desc = "Plugin Toggle Showkeys" })

-- Markview
map("n", "<leader>pv", "<cmd>Markview Toggle<CR>", { desc = "Markdown Toggle Preview" })
map("n", "<leader>ps", "<cmd>Markview splitToggle<CR>", { desc = "Markdown Toggle Split" })
map("n", "<leader>kc", function()
    require("markview.extras.checkboxes").toggle()
end, { desc = "Markdown Toggle Checkbox" })

-- Harpoon
map("n", "<leader>a", function()
    require("harpoon"):list():add()
end, { desc = "Harpoon Add file" })

map("n", "<C-e>", function()
    local harpoon = require("harpoon")
    harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Quick menu" })

map("n", "<C-h>", function()
    require("harpoon"):list():select(1)
    vim.notify("In harpoon file 1", vim.log.levels.INFO, { title = "Harpoon", timeout = 200 })
end, { desc = "Harpoon Jump to file 1" })

map("n", "<C-j>", function()
    require("harpoon"):list():select(2)
    vim.notify("In harpoon file 2", vim.log.levels.INFO, { title = "Harpoon", timeout = 200 })
end, { desc = "Harpoon Jump to file 2" })

map("n", "<C-k>", function()
    require("harpoon"):list():select(3)
    vim.notify("In harpoon file 3", vim.log.levels.INFO, { title = "Harpoon", timeout = 200 })
end, { desc = "Harpoon Jump to file 3" })

map("n", "<C-l>", function()
    require("harpoon"):list():select(4)
    vim.notify("In harpoon file 4", vim.log.levels.INFO, { title = "Harpoon", timeout = 200 })
end, { desc = "Harpoon Jump to file 4" })

map("n", "<leader><C-h>", function()
    require("harpoon"):list():replace_at(1)
end, { desc = "Harpoon Replace file 1" })

map("n", "<leader><C-j>", function()
    require("harpoon"):list():replace_at(2)
end, { desc = "Harpoon Replace file 2" })

map("n", "<leader><C-k>", function()
    require("harpoon"):list():replace_at(3)
end, { desc = "Harpoon Replace file 3" })

map("n", "<leader><C-l>", function()
    require("harpoon"):list():replace_at(4)
end, { desc = "Harpoon Replace file 4" })

-- Disable arrow keys and recommend hjkl
map("n", "<Up>", function()
    vim.notify("Use k instead", vim.log.levels.WARN, { title = "Arrow Key Disabled" })
end, { desc = "System Use k instead" })
map("n", "<Down>", function()
    vim.notify("Use j instead", vim.log.levels.WARN, { title = "Arrow Key Disabled" })
end, { desc = "System Use j instead" })
map("n", "<Left>", function()
    vim.notify("Use h instead", vim.log.levels.WARN, { title = "Arrow Key Disabled" })
end, { desc = "System Use h instead" })
map("n", "<Right>", function()
    vim.notify("Use l instead", vim.log.levels.WARN, { title = "Arrow Key Disabled" })
end, { desc = "System Use l instead" })
