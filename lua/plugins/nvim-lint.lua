return {
  {
    "mfussenegger/nvim-lint",
    ft = { "python", "markdown" },
    init = function()
      local lint = require("lint")

      lint.linters_by_ft = {
        markdown = { "vale" },
        python   = { "ruff" },
      }

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
