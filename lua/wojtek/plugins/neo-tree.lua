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
			},
		},
	},
}
-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v3.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	config = function()
-- 		-- vim.keymap.set("n", "<leader>e", ":Neotree filesystem reveal left<CR>", {})
-- 		-- vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
-- 		-- vim.keymap.set("n", "<leader>e", ":Neotree filesystem left<CR>", {})
-- 		require("neo-tree").setup({
-- 			-- sources = { "filesystem", "buffers", "git_status", "document_symbols" },
-- 			-- open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
-- 			filesystem = {
-- 				bind_to_cwd = false,
-- 				follow_current_file = { enabled = true },
-- 				use_libuv_file_watcher = true,
-- 				hijack_netrw_behavior = "open_current",
-- 			},
-- 			default_component_configs = {
-- 				indent = {
-- 					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
-- 					expander_collapsed = "",
-- 					expander_expanded = "",
-- 					expander_highlight = "NeoTreeExpander",
-- 				},
-- 			},
-- 			init = function()
-- 				vim.api.nvim_create_autocmd("BufEnter", {
-- 					group = vim.api.nvim_create_autocmd("NeoTreeInit", {
-- 						clear = true,
-- 					}),
-- 				})
-- 			end,
-- 		})
-- 	end,
-- }

-- return {
-- 	"nvim-neo-tree/neo-tree.nvim",
-- 	branch = "v2.x",
-- 	dependencies = {
-- 		"nvim-lua/plenary.nvim",
-- 		"nvim-tree/nvim-web-devicons",
-- 		"MunifTanjim/nui.nvim",
-- 	},
-- 	config = function()
-- 		require("neo-tree").setup({
-- 			close_if_last_window = true,
-- 			window = {
-- 				width = 30,
-- 			},
-- 			buffers = {
-- 				follow_current_file = {
-- 					enabled = true,
-- 				},
-- 			},
-- 			filesystem = {
-- 				follow_current_file = {
-- 					enabled = true,
-- 				},
-- 				filtered_items = {
-- 					hide_dotfiles = false,
-- 					hide_gitignored = false,
-- 					hide_by_name = {
-- 						"node_modules",
-- 					},
-- 					never_show = {
-- 						".DS_Store",
-- 						"thumbs.db",
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }

-- # Neo-tree configuration has been updated. Please review the changes below.
--
-- ## The `filesystem.follow_current_file` option is replaced with a table, please move to `filesystem.follow_current_file.enabled`.
--
-- ## The `buffers.follow_current_file` option is replaced with a table, please move to `buffers.follow_current_file.enabled`.
--
-- return {
-- 	"nvim-tree/nvim-tree.lua",
-- 	dependencies = "nvim-tree/nvim-web-devicons",
-- 	config = function()
-- 		local nvimtree = require("nvim-tree")
--
-- 		-- recommended settings from nvim-tree documentation
-- 		vim.g.loaded_netrw = 1
-- 		vim.g.loaded_netrwPlugin = 1
--
-- 		nvimtree.setup({
-- 			view = {
-- 				width = 35,
-- 				relativenumber = true,
-- 			},
-- 			-- change folder arrow icons
-- 			renderer = {
-- 				indent_markers = {
-- 					enable = true,
-- 				},
-- 				icons = {
-- 					glyphs = {
-- 						folder = {
-- 							arrow_closed = "", -- arrow when folder is closed
-- 							arrow_open = "", -- arrow when folder is open
-- 						},
-- 					},
-- 				},
-- 			},
-- 			-- disable window_picker for
-- 			-- explorer to work well with
-- 			-- window splits
-- 			actions = {
-- 				open_file = {
-- 					window_picker = {
-- 						enable = false,
-- 					},
-- 				},
-- 			},
-- 			filters = {
-- 				custom = { ".DS_Store" },
-- 			},
-- 			git = {
-- 				ignore = false,
-- 			},
-- 			disable_netrw = true,
-- 			hijack_netrw = true,
-- 			hijack_cursor = true,
-- 			hijack_unnamed_buffer_when_opening = false,
-- 			sync_root_with_cwd = true,
-- 			update_focused_file = {
-- 				enable = true,
-- 				update_root = false,
-- 			},
-- 		})
--
-- 		-- set keymaps
-- 		local keymap = vim.keymap -- for conciseness
--
-- 		keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
-- 		keymap.set(
-- 			"n",
-- 			"<leader>ef",
-- 			"<cmd>NvimTreeFindFileToggle<CR>",
-- 			{ desc = "Toggle file explorer on current file" }
-- 		) -- toggle file explorer on current file
-- 		keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
-- 		keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
-- 	end,
-- }
-- options = {Vk
--  filters = {
--    dotfiles = false,
--  },
--  disable_netrw = true,
--  hijack_netrw = true,
--  hijack_cursor = true,
--  hijack_unnamed_buffer_when_opening = false,
--  sync_root_with_cwd = true,
--  update_focused_file = {
--    enable = true,
--    update_root = false,
--  },
--  view = {
--    adaptive_size = false,
--    side = "left",
--    width = 30,
--    preserve_window_proportions = true,
--  },
--  git = {
--    enable = true,
--    ignore = true,
--  },
--  filesystem_watchers = {
--    enable = true,
--  },
--  actions = {
--    open_file = {
--      resize_window = true,
--    },
--  },
--  renderer = {
--    root_folder_label = false,
--    highlight_git = true,
--    highlight_opened_files = "none",
--
--    indent_markers = {
--      enable = true,
--    },
--
--    icons = {
--      show = {
--        file = true,
--        folder = true,
--        folder_arrow = true,
--        git = true,
--      },
--
--      glyphs = {
--        default = "󰈚",
--        symlink = "",
--        folder = {
--          default = "",
--          empty = "",
--          empty_open = "",
--          open = "",
--          symlink = "",
--          symlink_open = "",
--          arrow_open = "",
--          arrow_closed = "",
--        },
--        git = {
--          unstaged = "✗",
--          staged = "✓",
--          unmerged = "",
--          renamed = "➜",
--          untracked = "★",
--          deleted = "",
--          ignored = "◌",
--        },
--      },
--    },
--  },
-- }

-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   dependencies = {
--     { "nvim-lua/plenary.nvim", lazy = true },
--     { "MunifTanjim/nui.nvim", lazy = true },
--     {
--       "AstroNvim/astrocore",
--       opts = function(_, opts)
--         local maps = opts.mappings
--         maps.n["<Leader>e"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" }
--         maps.n["<Leader>o"] = {
--           function()
--             if vim.bo.filetype == "neo-tree" then
--               vim.cmd.wincmd "p"
--             else
--               vim.cmd.Neotree "focus"
--             end
--           end,
--           desc = "Toggle Explorer Focus",
--         }
--         opts.autocmds.neotree_start = {
--           {
--             event = "BufEnter",
--             desc = "Open Neo-Tree on startup with directory",
--             callback = function()
--               if package.loaded["neo-tree"] then
--                 return true
--               else
--                 local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0)) -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
--                 if stats and stats.type == "directory" then
--                   require("lazy").load { plugins = { "neo-tree.nvim" } }
--                   return true
--                 end
--               end
--             end,
--           },
--         }
--         opts.autocmds.neotree_refresh = {
--           {
--             event = "TermClose",
--             pattern = "*lazygit*",
--             desc = "Refresh Neo-Tree sources when closing lazygit",
--             callback = function()
--               local manager_avail, manager = pcall(require, "neo-tree.sources.manager")
--               if manager_avail then
--                 for _, source in ipairs { "filesystem", "git_status", "document_symbols" } do
--                   local module = "neo-tree.sources." .. source
--                   if package.loaded[module] then manager.refresh(require(module).name) end
--                 end
--               end
--             end,
--           },
--         }
--       end,
--     },
--   },
--   cmd = "Neotree",
--   opts = function()
--     local astro = require "astrocore"
--     local get_icon = require("astroui").get_icon
--     local opts = {
--       auto_clean_after_session_restore = true,
--       close_if_last_window = true,
--       sources = { "filesystem", "buffers", "git_status" },
--       source_selector = {
--         winbar = true,
--         content_layout = "center",
--         sources = {
--           { source = "filesystem", display_name = get_icon("FolderClosed", 1, true) .. "File" },
--           { source = "buffers", display_name = get_icon("DefaultFile", 1, true) .. "Bufs" },
--           { source = "git_status", display_name = get_icon("Git", 1, true) .. "Git" },
--           { source = "diagnostics", display_name = get_icon("Diagnostic", 1, true) .. "Diagnostic" },
--         },
--       },
--       default_component_configs = {
--         indent = {
--           padding = 0,
--           expander_collapsed = get_icon "FoldClosed",
--           expander_expanded = get_icon "FoldOpened",
--         },
--         icon = {
--           folder_closed = get_icon "FolderClosed",
--           folder_open = get_icon "FolderOpen",
--           folder_empty = get_icon "FolderEmpty",
--           folder_empty_open = get_icon "FolderEmpty",
--           default = get_icon "DefaultFile",
--         },
--         modified = { symbol = get_icon "FileModified" },
--         git_status = {
--           symbols = {
--             added = get_icon "GitAdd",
--             deleted = get_icon "GitDelete",
--             modified = get_icon "GitChange",
--             renamed = get_icon "GitRenamed",
--             untracked = get_icon "GitUntracked",
--             ignored = get_icon "GitIgnored",
--             unstaged = get_icon "GitUnstaged",
--             staged = get_icon "GitStaged",
--             conflict = get_icon "GitConflict",
--           },
--         },
--       },
--       commands = {
--         system_open = function(state)
--           -- TODO: remove deprecated method check after dropping support for neovim v0.9
--           (vim.ui.open or astro.system_open)(state.tree:get_node():get_id())
--         end,
--         parent_or_close = function(state)
--           local node = state.tree:get_node()
--           if node:has_children() and node:is_expanded() then
--             state.commands.toggle_node(state)
--           else
--             require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
--           end
--         end,
--         child_or_open = function(state)
--           local node = state.tree:get_node()
--           if node:has_children() then
--             if not node:is_expanded() then -- if unexpanded, expand
--               state.commands.toggle_node(state)
--             else -- if expanded and has children, seleect the next child
--               if node.type == "file" then
--                 state.commands.open(state)
--               else
--                 require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
--               end
--             end
--           else -- if has no children
--             state.commands.open(state)
--           end
--         end,
--         copy_selector = function(state)
--           local node = state.tree:get_node()
--           local filepath = node:get_id()
--           local filename = node.name
--           local modify = vim.fn.fnamemodify
--
--           local vals = {
--             ["BASENAME"] = modify(filename, ":r"),
--             ["EXTENSION"] = modify(filename, ":e"),
--             ["FILENAME"] = filename,
--             ["PATH (CWD)"] = modify(filepath, ":."),
--             ["PATH (HOME)"] = modify(filepath, ":~"),
--             ["PATH"] = filepath,
--             ["URI"] = vim.uri_from_fname(filepath),
--           }
--
--           local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
--           if vim.tbl_isempty(options) then
--             astro.notify("No values to copy", vim.log.levels.WARN)
--             return
--           end
--           table.sort(options)
--           vim.ui.select(options, {
--             prompt = "Choose to copy to clipboard:",
--             format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
--           }, function(choice)
--             local result = vals[choice]
--             if result then
--               astro.notify(("Copied: `%s`"):format(result))
--               vim.fn.setreg("+", result)
--             end
--           end)
--         end,
--       },
--       window = {
--         width = 30,
--         mappings = {
--           ["<S-CR>"] = "system_open",
--           ["<Space>"] = false, -- disable space until we figure out which-key disabling
--           ["[b"] = "prev_source",
--           ["]b"] = "next_source",
--           O = "system_open",
--           Y = "copy_selector",
--           h = "parent_or_close",
--           l = "child_or_open",
--         },
--         fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
--           ["<C-j>"] = "move_cursor_down",
--           ["<C-k>"] = "move_cursor_up",
--         },
--       },
--       filesystem = {
--         follow_current_file = { enabled = true },
--         hijack_netrw_behavior = "open_current",
--         use_libuv_file_watcher = vim.fn.has "win32" ~= 1,
--       },
--       event_handlers = {
--         {
--           event = "neo_tree_buffer_enter",
--           handler = function(_)
--             vim.opt_local.signcolumn = "auto"
--             vim.opt_local.foldcolumn = "0"
--           end,
--         },
--       },
--     }
--
--     return opts
--   end,
-- }

