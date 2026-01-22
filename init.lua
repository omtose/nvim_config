-- ===================== --
-- == Editor Settings == --
-- ===================== --

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " " -- set leader to space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.g.rust_recommended_style = false

-- ===================== --
-- ==     Plugins     == --
-- ===================== --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	print("Installing lazy...");
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.termguicolors = true
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins");

-- ===================== --
-- ==  Plugin Config  == --
-- ===================== --

-- toggleTerm
local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
local newTerm = Terminal:new({ hidden = true, direction = "float" })

function _lazygit_toggle()
  lazygit:toggle()
end

function _new_term_toggle() 
    newTerm:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>lua _new_term_toggle()<CR>", {noremap = true, silent = true})

-- mason lsp stuff
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
		"lua_ls",
	},
})

local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
	"force",
	lsp_defaults.capabilities,
	require("cmp_nvim_lsp").default_capabilities()
)

require("mason-lspconfig").setup({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = lsp_defaults.capabilities,
		})
	end,
})


vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function()
		local bufmap = function(mode, lhs, rhs)
			local opts = { buffer = true}
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	end
})

-- load snippets
require("luasnip.loaders.from_vscode").lazy_load()


-- Autocomplete
vim.opt.completeopt = { "menu", "menuone", "noselect" }

local cmp = require("cmp")
local luasnip = require("luasnip")

local select_opts = { behaviour = cmp.SelectBehavior.Select }
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end
	},
	sources = {
		{ name = "path" },
		{ name = "nvim_lsp", keyword_length = 1 },
		{ name = "buffer", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	},
	window = {
		documentation = cmp.config.window.bordered()
	},
	formatting = {
		fields = { "menu", "abbr", "kind", },
		format = function(entry, item)
    local menu_icon = {
      nvim_lsp = 'λ',
      luasnip = '⋗',
      buffer = 'Ω',
      path = '🖫',
    }
			item.menu = menu_icon[entry.source.name]
			return item
		end,
	},
	mapping = {
		['<Up>'] = cmp.mapping.select_prev_item(select_opts),
		['<Down>'] = cmp.mapping.select_next_item(select_opts),

		['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
		['<C-n>'] = cmp.mapping.select_next_item(select_opts),

		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),

		['<C-e>'] = cmp.mapping.abort(),

		['<C-y>'] = cmp.mapping.confirm({select = true}),
		['<CR>'] = cmp.mapping.confirm({select = false}),

		['<C-f>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, {'i', 's'}),

		['<C-b>'] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {'i', 's'}),

		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1
			if cmp.visible() then
				cmp.select_next_item(select_opts)
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, {'i', 's'}),

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item(select_opts)
			else
				fallback()
			end
		end, {'i', 's'}),

	},
})
