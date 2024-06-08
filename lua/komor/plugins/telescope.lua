return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable "make" == 1
			end
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons"
	},
	config = function()
		local ts = require("telescope")
		ts.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown()
				}
			}
		})
		pcall(ts.load_extension, "fzf")
		pcall(ts.load_extension, "ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>pf", builtin.find_files,  { desc = "[P]roject [F]iles"        })
		vim.keymap.set("n", "<leader>pg", builtin.git_files,   { desc = "[P]roject [G]it Files"    })
		vim.keymap.set("n", "<leader>ps", builtin.live_grep,   { desc = "[P]roject [S]earch"       })
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch hovered [W]ord"  })
		vim.keymap.set("n", "<leader>vh", builtin.help_tags,   { desc = "[V]iew [H]elp"            })
		vim.keymap.set("n", "<leader>pd", builtin.diagnostics, { desc = "[P]project [D]iagnostics" })
		vim.keymap.set("n", "<leader>cs", function()
			builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
				winblend = 10,
				previewer = false,
			})
		end, { desc = "[C]urrent Document [S]earch" })
		vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]how [K]eymaps" })
	end
}
