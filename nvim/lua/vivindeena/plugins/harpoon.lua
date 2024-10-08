return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()

		-- Add current file to Harpoon list with <leader>a
		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "Add file to Harpoon" })

		-- Toggle Harpoon quick menu with <C-e>
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon quick menu" })

		-- Navigate to specific Harpoon files with <C-h>, <C-j>, <C-k>, <C-l>
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, { desc = "Jump to first Harpoon file" })

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end, { desc = "Jump to second Harpoon file" })

		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end, { desc = "Jump to third Harpoon file" })

		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end, { desc = "Jump to fourth Harpoon file" })

		-- Replace files in specific Harpoon slots with <leader><C-h>, <leader><C-j>, etc.
		vim.keymap.set("n", "<leader><C-h>", function()
			harpoon:list():replace_at(1)
		end, { desc = "Replace first Harpoon file" })

		vim.keymap.set("n", "<leader><C-j>", function()
			harpoon:list():replace_at(2)
		end, { desc = "Replace second Harpoon file" })

		vim.keymap.set("n", "<leader><C-k>", function()
			harpoon:list():replace_at(3)
		end, { desc = "Replace third Harpoon file" })

		vim.keymap.set("n", "<leader><C-l>", function()
			harpoon:list():replace_at(4)
		end, { desc = "Replace fourth Harpoon file" })
	end,
}
