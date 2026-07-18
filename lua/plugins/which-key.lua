return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix", -- "classic", "modern", or "helix"
		delay = 200,

		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				operators = true,
				motions = true,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},

		triggers = {
			{ "<auto>", mode = "nxso" },
		},
	},
}
