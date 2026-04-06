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
