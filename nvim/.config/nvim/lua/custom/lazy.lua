local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "custom/plugins" },
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = require("custom.ide.treesitter").config,
			event = { "BufReadPost", "BufNewFile" },
			lazy = false,
		},
		{
			"lewis6991/gitsigns.nvim",
			event = "InsertEnter",
		},
		{
			"norcalli/nvim-colorizer.lua",
			event = { "BufReadPre", "BufNewFile" },
		},

		-- collection of small plugins (highlight current word)
		{
			"echasnovski/mini.nvim",
			config = function()
				require("mini.comment").setup()
			end,
			lazy = false,
		},
		{
			"goolord/alpha-nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
			lazy = false,
		},
		{
			"folke/trouble.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				config = function()
					require("trouble").setup()
				end,
				ft = { "qf" },
			},
		},
		{
			"folke/zen-mode.nvim",
			config = function()
				require("zen-mode").setup({
					window = {
						height = 1.0,
						options = {
							number = true,
						},
					},
					plugins = {
						twilight = { enabled = false },
						tmux = { enabled = true },
						kitty = {
							enabled = true,
							font = "+4",
						},
					},
				})
			end,
			cmd = "ZenMode",
		},
		{
			"folke/twilight.nvim",
			config = function()
				require("twilight").setup()
			end,
		},
		{
			"sindrets/diffview.nvim",
			dependencies = "nvim-lua/plenary.nvim",
			lazy = false,
		},
		{
			"jackMort/ChatGPT.nvim",
			event = "VeryLazy",
			config = function()
				if os.getenv("OPENAI_API_KEY") ~= nil then
					require("chatgpt").setup({
						openai_params = { max_tokens = 1000 },
						chat = {
							keymaps = {
								close = { "<C-c>" },
								yank_last = "<C-y>",
								yank_last_code = "<C-k>",
								scroll_up = "<C-u>",
								scroll_down = "<C-d>",
								toggle_settings = "<C-o>",
								new_session = "<C-n>",
								cycle_windows = "<Tab>",
								select_session = "<Enter>",
								rename_session = "r",
								delete_session = "d",
							},
						},
						popup_input = {
							submit = "<C-s>",
						},
					})
				end
			end,
			dependencies = {
				"MunifTanjim/nui.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope.nvim",
			},
		},
		{
			"linux-cultist/venv-selector.nvim",
			dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
			opts = {
				name = { "venv", ".venv" },
			},
			event = "VeryLazy",
			keys = {
				{
					"<leader>vs",
					"<cmd>:VenvSelect<cr>",
				},
				{
					"<leader>vc",
					"<cmd>:VenvSelectCached<cr>",
				},
			},
		},
		{
			"nvimdev/lspsaga.nvim",
			opts = { lightbulb = { enable = false } },
			event = "LspAttach",
			dependencies = {
				"nvim-treesitter/nvim-treesitter",
				"nvim-tree/nvim-web-devicons",
			},
		},
	},
}, {
	defaults = {
		lazy = true,
	},
	ui = {
		border = "rounded",
	},
})
