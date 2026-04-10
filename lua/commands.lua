-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
	local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
	local filename = vim.api.nvim_buf_get_name(0)
	print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })


-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Sync clipboard between OS and Neovim. See `:help 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
	callback = function()
		vim.o.clipboard = 'unnamedplus'
	end,
})


-- Initialize treesitter and exceptions
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local ft = vim.api.nvim_buf_get_option(args.buf, "filetype")
		if vim.tbl_contains({ "neo-tree", "TelescopeResults", "TelescopePrompt" }, ft) then
			return                      -- no iniciar Treesitter en estos buffers
		end
		pcall(vim.treesitter.start, args.buf) -- evita romper si falla
	end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.ipynb",
	callback = function()
		vim.cmd("MoltenExportOutput!")
	end,
})

-- Solo para buffers markdown
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "es,en"
		vim.opt_local.conceallevel = 2 -- oculta sintaxis markdown
		vim.opt_local.textwidth = 80
		vim.wo.number = false
		vim.wo.relativenumber = false
		vim.wo.signcolumn = "no"
		vim.wo.foldcolumn = "0"
	end
})
