return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"bash",
			"gleam",
			"go",
			"javascript",
			"lua",
			"markdown",
			"markdown_inline",
			"python",
			"rust",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		},
	},
}
