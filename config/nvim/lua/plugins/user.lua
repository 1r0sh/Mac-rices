return {
	--------- add gruvbox ----------
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			require("gruvbox").setup({
				contrast = "hard",
				transparent_mode = true,
			})
		end,
	},
	--------gruvbox-material---------------
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},

	-- Config LazyVim to load gruvbox --
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "gruvbox-material",
		},
	},

	------- Turn hidden files on -------
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
				},
			},
		},
	},

	---------- add orphans --------------
	{
		"ZWindL/orphans.nvim",
		config = function()
			require("orphans").setup({})
		end,
	},

	----------- add timerly -------------
	{
		"nvzone/timerly",
		dependencies = { "nvzone/volt" },
	},

	{
		"nvzone/typr",
		branch = "dev",
		cmd = "TyprStats",
		dependencies = { { "nvzone/volt", branch = "dev" } },
		opts = {},
	},
}
