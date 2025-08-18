return {
	{
		"mistricky/codesnap.nvim",
		build = "make",
		keys = {
			{ "<leader>us", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
			{ "<leader>uS", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
		},
		opts = {
			save_path = "~/Pictures",
			mac_window_bar = false,
			title = "",
			-- code_font_family = "SFMono Nerd Font",
			-- watermark_font_family = "Pacifico",
			watermark = "",
			bg_theme = "summer",
			breadcrumbs_separator = "/",
			has_breadcrumbs = false,
			has_line_number = true,
			show_workspace = false,
			min_width = 0,
			bg_x_padding = 122,
			bg_y_padding = 82,
		},
	},
}
