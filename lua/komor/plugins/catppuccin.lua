return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	init = function()
		require("catppuccin").setup({
			cmp = true,
			gitsigns = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
					ok = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
					ok = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
			telescope = {
				enabled = true
			},
			mini = {
				enabled = true,
				indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
			},
			treesitter = true
		})

		vim.cmd.colorscheme "catppuccin"
		vim.cmd.hi "Comment gui=none"
	end
}
