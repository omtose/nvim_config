return {
	'akinsho/toggleterm.nvim',
	version = "*",
	config = function()
		require("toggleterm").setup()

		local Terminal = require('toggleterm.terminal').Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		local newTerm = Terminal:new({ hidden = true, direction = "float" })

		vim.keymap.set("n", "<leader>g", function() lazygit:toggle() end, { desc = "Toggle lazygit" })
		vim.keymap.set("n", "<leader>t", function() newTerm:toggle() end, { desc = "Toggle terminal" })
	end,
}
