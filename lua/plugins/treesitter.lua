return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
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
			highlight = { enable = true },
		})
	end,
}
