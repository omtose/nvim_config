return {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,
	config = function()
		-- Default to medium background
		vim.g.gruvbox_material_background = "medium"
		vim.g.gruvbox_material_better_performance = 1
	end,
}
