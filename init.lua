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

-- LSP setup (native Neovim 0.11 APIs + mason for server installation)
vim.lsp.config('*', {
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

vim.lsp.enable({ 'lua_ls', 'rust_analyzer' })


vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Go to declaration" })
		vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature help" })
		vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { buffer = ev.buf, desc = "Show diagnostic float" })
	end,
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
