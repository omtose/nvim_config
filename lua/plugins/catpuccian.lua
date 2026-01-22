return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
		flavour = "auto",
		default_integrations = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			telescope = true,
			treesitter = true,
			alpha = true,
			mason = true,
			lsp_trouble = true,
		}
    },
}
