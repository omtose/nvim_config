return {
	"zaldih/themery.nvim",
	lazy = false,
	config = function()
		require("themery").setup({
			themes = {
				{
					name = "Catppuccin Mocha",
					colorscheme = "catppuccin-mocha",
				},
				{
					name = "Catppuccin Macchiato",
					colorscheme = "catppuccin-macchiato",
				},
				{
					name = "Catppuccin Latte",
					colorscheme = "catppuccin-latte",
				},
				{
					name = "Gruvbox Material Dark Soft",
					colorscheme = "gruvbox-material",
					before = [[
						vim.g.gruvbox_material_background = "soft"
						vim.o.background = "dark"
					]],
				},
				{
					name = "Gruvbox Material Dark Medium",
					colorscheme = "gruvbox-material",
					before = [[
						vim.g.gruvbox_material_background = "medium"
						vim.o.background = "dark"
					]],
				},
				{
					name = "Gruvbox Material Dark Hard",
					colorscheme = "gruvbox-material",
					before = [[
						vim.g.gruvbox_material_background = "hard"
						vim.o.background = "dark"
					]],
				},
				{
					name = "Gruvbox Material Light Soft",
					colorscheme = "gruvbox-material",
					before = [[
						vim.g.gruvbox_material_background = "soft"
						vim.o.background = "light"
					]],
				},
				{
					name = "Gruvbox Material Light Medium",
					colorscheme = "gruvbox-material",
					before = [[
						vim.g.gruvbox_material_background = "medium"
						vim.o.background = "light"
					]],
				},
				{
					name = "Gruvbox Material Light Hard",
					colorscheme = "gruvbox-material",
					before = [[
						vim.g.gruvbox_material_background = "hard"
						vim.o.background = "light"
					]],
				},
				{
					name = "Kanagawa Wave",
					colorscheme = "kanagawa-wave",
				},
				{
					name = "Kanagawa Dragon",
					colorscheme = "kanagawa-dragon",
				},
				{
					name = "Kanagawa Lotus",
					colorscheme = "kanagawa-lotus",
				},
			},
			livePreview = true,
		})

		vim.keymap.set("n", "<leader>ss", ":Themery<CR>", { noremap = true, silent = true, desc = "Open theme picker" })
	end,
}
