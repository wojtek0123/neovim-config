return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "auto",
				globalstatus = true,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					{
						"diff",
						colored = true, -- Displays a colored diff status if set to true
						diff_color = {
							-- Same color values as the general color option can be used here.
							added = "LuaLineDiffAdd", -- Changes the diff's added color
							modified = "LuaLineDiffChange", -- Changes the diff's modified color
							removed = "LuaLineDiffDelete", -- Changes the diff's removed color you
						},
						symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
						source = nil, -- A function that works as a data source for diff.
						-- It must return a table as such:
						--   { added = add_count, modified = modified_count, removed = removed_count }
						-- or nil on failure. count <= 0 won't be displayed.
					},
					{
						"diagnostics",

						-- Table of diagnostic sources, available sources are:
						--   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
						-- or a function that returns a table as such:
						--   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
						sources = { "nvim_diagnostic", "coc" },

						-- Displays diagnostics for the defined severity types
						sections = { "error", "warn", "info", "hint" },

						diagnostics_color = {
							-- Same values as the general color option can be used here.
							error = "DiagnosticError", -- Changes diagnostics' error color.
							warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
							info = "DiagnosticInfo", -- Changes diagnostics' info color.
							hint = "DiagnosticHint", -- Changes diagnostics' hint color.
						},
						symbols = { error = "E", warn = "W", info = "I", hint = "H" },
						colored = true, -- Displays diagnostics status in color if set to true.
						update_in_insert = false, -- Update diagnostics in insert mode.
						always_visible = false, -- Show diagnostics even if there are none.
					},
				},
				lualine_c = { "filename" },
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress", "location" },
				lualine_z = { { "datetime", style = "%H:%M" } },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "neo-tree", "lazy" },
		})
	end,
}
