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

-- Substitute word under cursor
map(
	"n",
	"<leader>sr",
	[[:%s/\<\<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Editing Substitute word under cursor" }
)

-- Tab management
map("n", "<leader>tc", "<cmd>tabclose<CR>", { desc = "Tab Close current", silent = true })

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
map("n", "<leader>kc", "<cmd>Checkbox toggle<CR>", { desc = "Markdown Toggle Checkbox" })