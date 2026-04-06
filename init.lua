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

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with a config

---@type nvim_tree.config
local config = {
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
	},
	filters = {
		dotfiles = true,
	},
}
require("nvim-tree").setup(config)
