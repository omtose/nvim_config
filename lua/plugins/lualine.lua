return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
			icons_enabled = true,
			theme = "auto",
			disabled_filetypes = {
			 statusline = { "NvimTree" },
		 },
		 component_separators = "|",
		 section_separators = "",
		},
	},
}
