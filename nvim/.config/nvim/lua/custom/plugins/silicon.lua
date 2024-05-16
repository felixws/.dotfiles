return {
	"narutoxy/silicon.lua",
	dependencies = { "nvim-lua/plenary.nvim" },
	keys = { "<leader>s", "<leader>bs" },
	config = function()
		local colors = require("tokyonight.colors").setup()
		require("silicon").setup({
			theme = "Visual Studio Dark+",
			windowControls = false,
			padHoriz = 0,
			padVert = 0,
			linePad = 1,
			bgColor = colors.bg,
			shadowBlurRadius = 0,
		})

		local wk = require("which-key")
		local clip_buffer = function()
			require("silicon").visualise_api({ to_clip = true, visible = true })
		end
		local clip_buffer_with_highlight = function()
			require("silicon").visualise_api({ to_clip = true, show_buf = true })
		end
		local clip_selection = function()
			require("silicon").visualise_api({ to_clip = true })
		end

		wk.register({
			name = "silicon",
			s = { clip_buffer, "clip buffer" },
		}, { prefix = "<leader>" })

		wk.register({
			name = "silicon",
			s = { clip_selection, "clip highlight" },
			bs = { clip_buffer_with_highlight, "clip buffer with highlight" },
		}, { mode = "v", prefix = "<leader>" })
	end,
}

-- available themes in silicon.lua
--  local default_themes = {
-- "1337",
-- "Coldark-Cold",
-- "Coldark-Dark",
-- "DarkNeon",
-- "Dracula",
-- "GitHub",
-- "Monokai Extended",
-- "Monokai Extended Bright",
-- "Monokai Extended Light",
-- "Monokai Extended Origin",
-- "Nord",
-- "OneHalfDark",
-- "OneHalfLight",
-- "Solarized (dark)",
-- "Solarized (light)",
-- "Sublime Snazzy",
-- "TwoDark",
-- "Visual Studio Dark+",
-- "ansi",
-- "base16",
-- "base16-256"}
--
