return {
	"williamboman/mason.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {
			"rust-analyzer",
			"lua-language-server",
			"gopls",
			"typescript-language-server",
			"eslint-lsp",
			"postgres-language-server",
			"prettier",
			"angular-language-server",
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)

		-- Add mason bin to PATH so Neovim can find installed servers
		vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

		-- Auto-install listed servers if missing
		local mr = require("mason-registry")
		for _, tool in ipairs(opts.ensure_installed or {}) do
			local p = mr.get_package(tool)
			if not p:is_installed() then
				p:install()
			end
		end

		-- Global LSP capabilities (nvim-lspconfig provides server defaults)
		vim.lsp.config('*', {
			capabilities = require('cmp_nvim_lsp').default_capabilities(),
		})

		vim.lsp.enable({
			'lua_ls',
			'rust_analyzer',
			'gopls',
			'ts_ls',
			'eslint',
			'gleam',
			'angularls',
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP actions",
			callback = function(ev)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
				vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
				vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = ev.buf, desc = "Show diagnostic float" })
			vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
			end,
		})
	end,
}
