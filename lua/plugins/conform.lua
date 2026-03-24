return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo" },
	keys = {
		{ "<leader>f", function() require("conform").format() end, desc = "Format buffer" },
	},
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			htmlangular = { "prettier" },
		},
		format_after_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
