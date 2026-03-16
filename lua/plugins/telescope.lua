return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-telescope/telescope-ui-select.nvim',
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Live Grep" },
		{ "<leader>fb", "<cmd>Telescope buffers<cr>",  desc = "Open buffers" },
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				layout_strategy = 'vertical',
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
				},
			},
		})
		telescope.load_extension("ui-select")
	end,
}
