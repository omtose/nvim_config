return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",  desc = "Open buffers" },
	},
	opts = {
		defaults = {
			layout_strategy = 'vertical',
		},
		pickers = {
			find_files = {
				find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
			},
		},
	},
}
