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
					name = "Gruvbox Dark",
					colorscheme = "gruvbox",
					before = [[
					vim.o.background = "dark"
					]],
				},
				{
					name = "Gruvbox Light",
					colorscheme = "gruvbox",
					before = [[
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
