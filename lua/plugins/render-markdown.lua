return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>m", "<cmd>RenderMarkdown buf_toggle<cr>", desc = "Toggle markdown preview" },
		{ "<leader>mp", "<cmd>RenderMarkdown preview<cr>", desc = "Markdown split preview" },
	},
	opts = {
		render_modes = { "n", "c" },
		anti_conceal = {
			enabled = true,
		},
	},
}
