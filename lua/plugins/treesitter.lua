return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
			config = function()
				require("nvim-treesitter-textobjects").setup({
					select = { lookahead = true },
					move = { set_jumps = true },
				})

				local select = require("nvim-treesitter-textobjects.select").select_textobject
				local swap = require("nvim-treesitter-textobjects.swap")
				local move = require("nvim-treesitter-textobjects.move")

				-- Select
				vim.keymap.set({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end, { desc = "Around function" })
				vim.keymap.set({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end, { desc = "Inside function" })
				vim.keymap.set({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end, { desc = "Around class" })
				vim.keymap.set({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end, { desc = "Inside class" })
				vim.keymap.set({ "x", "o" }, "aa", function() select("@parameter.outer", "textobjects") end, { desc = "Around parameter" })
				vim.keymap.set({ "x", "o" }, "ia", function() select("@parameter.inner", "textobjects") end, { desc = "Inside parameter" })

				-- Move
				vim.keymap.set({ "n", "x", "o" }, "]m", function() move.goto_next_start("@function.outer", "textobjects") end, { desc = "Next function" })
				vim.keymap.set({ "n", "x", "o" }, "[m", function() move.goto_previous_start("@function.outer", "textobjects") end, { desc = "Previous function" })
				vim.keymap.set({ "n", "x", "o" }, "]]", function() move.goto_next_start("@class.outer", "textobjects") end, { desc = "Next class" })
				vim.keymap.set({ "n", "x", "o" }, "[[", function() move.goto_previous_start("@class.outer", "textobjects") end, { desc = "Previous class" })

				-- Swap
				vim.keymap.set("n", "<leader>sa", function() swap.swap_next("@parameter.inner") end, { desc = "Swap parameter next" })
				vim.keymap.set("n", "<leader>sA", function() swap.swap_previous("@parameter.inner") end, { desc = "Swap parameter previous" })
			end,
		},
	},
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
