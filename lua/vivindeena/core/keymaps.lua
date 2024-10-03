vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

--[[ Copied Over, dunno if usefull
      Move Cursor to the line start when using 'J'
  keymap.set("n", "J", "mzJ`z")
]]

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting clipboard" })

keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

keymap.set(
	"n",
	"<leader>sr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "Substitute word under cursor" }
)

keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { silent = true, desc = "Close current tab" })

--[[
 -- more remaps
 -- https://youtu.be/w7i4amO_zaE?t=1634
 -- https://github.com/ThePrimeagen/init.lua/blob/master/lua/theprimeagen/remap.lua
 ]]

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- Training Wheels
keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')
