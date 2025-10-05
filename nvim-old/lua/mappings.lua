require("nvchad.mappings")

local map = vim.keymap.set

-- Normal mode mappings
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Scroll and center
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Search result and center
map("n", "n", "nzzzv", { desc = "Next search result and center" })
map("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- Yank line to system clipboard
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Window management
map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Substitute word under cursor
map(
    "n",
    "<leader>sr",
    [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Substitute word under cursor" }
)

-- Tab management
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Close current tab", silent = true })

-- Git worktree (Telescope)
map("n", "<leader>gw", function()
    require("telescope").extensions.git_worktree.git_worktree()
end, { desc = "Switch git worktree" })

map("n", "<leader>gwa", function()
    require("telescope").extensions.git_worktree.create_git_worktree()
end, { desc = "Create a new git worktree" })

-- Disable Q
map("n", "Q", "<nop>", { desc = "Disable Q" })

-- Dump messages
map("n", "<leader>dm", "<cmd>DumpMsgs<CR>", { desc = "Dump messages" })

-- Delete without yanking
map("n", "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Yank to system clipboard
map("n", "<leader>y", [["+y]], { desc = "Yank to system clipboard" })

-- Visual mode mappings
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })
map("v", "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("v", "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Visual block mode mappings
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting clipboard" })
