vim.g.mapleader = " "

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
--

require("config.lazy") -- same as lua/config/lazy.lua
require('keymaps')
require('options')
require('commands')
require('lsp')

-- treesitter
require("nvim-treesitter").setup {}

