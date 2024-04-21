return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	init = function()
		if vim.fn.argc(-1) == 1 then
			local stat = vim.uv.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end
	end,
	keys = {

		-- keymaps
		vim.keymap.set("n", "<leader>e", ":Neotree filesystem toggle=true<CR>", { desc = "Toggle neotree" }),
		vim.keymap.set("n", "<leader>be", ":Neotree buffers toggle=true<CR>", { desc = "Toggle neotree buffers" }),
		vim.keymap.set(
			"n",
			"<leader>bs",
			":Neotree document_symbols toggle=true<CR>",
			{ desc = "Toggle neotree document symbols" }
		),
		vim.keymap.set(
			"n",
			"<leader>ge",
			":Neotree git_status toggle=true<CR>",
			{ desc = "Toggle neotree git status" }
		),
	},
	-- end,
	opts = {
		sources = { "filesystem", "buffers", "git_status", "document_symbols" },
		open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
		filesystem = {
			hijack_netrw_behavior = "open_current",
			bind_to_cwd = false,
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
		default_component_configs = {
			indent = {
				with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		},
		window = {
			mappings = {
				["h"] = "close_node",
				["l"] = "open",
			},
		},
	},
}
