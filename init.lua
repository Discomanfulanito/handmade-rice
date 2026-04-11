vim.g.mapleader = " "

--[[
vim.diagnostic.config({
  virtual_text = {
    prefix = "!",
    format = function(diagnostic)
      if diagnostic.code then
        return diagnostic.code
      end
      return string.sub(diagnostic.message, 1, 30)
    end,
  },
})
--]]

require("config.lazy") -- same as lua/config/lazy.lua
require('keymaps')
require('options')
require('commands')
-- require('lsp')

require("nvim-treesitter").setup {}
require("mason").setup({})
require("mason-lspconfig").setup({})
require("mason-tool-installer").setup({
	ensure_installed = { "lua_ls", "ts_ls", "basedpyright", "ruff", "eslint_d" }
})

require("image").setup({
	backend = "kitty",     -- or "ueberzug" or "sixel"
	processor = "magick_cli", -- or "magick_rock"
	integrations = {
		markdown = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup", -- or "inline"
			floating_windows = false,          -- if true, images will be rendered in floating markdown windows
			filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
		},
		asciidoc = {
			enabled = true,
			clear_in_insert_mode = false,
			download_remote_images = true,
			only_render_image_at_cursor = false,
			only_render_image_at_cursor_mode = "popup",
			floating_windows = false,
			filetypes = { "asciidoc", "adoc" },
		},
		neorg = {
			enabled = true,
			filetypes = { "norg" },
		},
		rst = {
			enabled = true,
		},
		typst = {
			enabled = true,
			filetypes = { "typst" },
		},
		html = {
			enabled = false,
		},
		css = {
			enabled = false,
		},
	},
	max_width = 100,
	max_height = 12,
	max_width_window_percentage = math.huge,
	max_height_window_percentage = math.huge,
	scale_factor = 1.0,
	window_overlap_clear_enabled = true,                                             -- toggles images when windows are overlapped
	window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
	editor_only_render_when_focused = false,                                         -- auto show/hide images when the editor gains/looses focus
	tmux_show_only_in_active_window = false,                                         -- auto show/hide images in the correct Tmux window (needs visual-activity off)
	hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" }, -- render image files as images when opened
})


require("jupytext").setup({
	style = "markdown",
	output_extension = "md",
	force_ft = "markdown",
})

require("telescope").setup({
	defaults = {
		layout_strategy = "vertical",
		layout_config = {
			vertical = {
				preview_height = 0.75, -- 👈 preview takes 60% (bigger)
				results_height = 0.15, -- 👈 results take 30%
				prompt_position = "bottom",
				mirror = false, -- keeps preview on top
			},
			width = 0.7,
			height = 0.9,
		},
		sorting_strategy = "ascending", -- prompt at bottom works best with this
	},
})


vim.cmd [[colorscheme dracula]]

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'auto',
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				'WinEnter',
				'BufEnter',
				'BufWritePost',
				'SessionLoadPost',
				'FileChangedShellPost',
				'VimResized',
				'Filetype',
				'CursorMoved',
				'CursorMovedI',
				'ModeChanged',
			},
		}
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
