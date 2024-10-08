return {
	"mbbill/undotree",
	config = function()
		-- Toggle the UndoTree with <leader>u
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
	end,
}
