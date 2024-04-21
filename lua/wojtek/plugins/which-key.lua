return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		mode = { "n", "v" },
		["<leader>b"] = { name = "+buffer" },
		["<leader>c"] = { name = "+code" },
		["<leader>g"] = { name = "+git" },
		["<leader>w"] = { name = "+windows" },
		["<leader>x"] = { name = "+trouble" },
		["<leader><tab>"] = { name = "+tabs" },
		["]"] = { name = "+next" },
		["["] = { name = "+prev" },
		["z"] = { name = "+fold" },
		["g"] = { name = "+goto" },
	},
}
