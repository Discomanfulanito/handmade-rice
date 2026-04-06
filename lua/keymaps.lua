-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')


-- Disable F1 in normal, insert, and visual modes
vim.keymap.set('n', '<F1>', '<Nop>', { silent = true })
vim.keymap.set('i', '<F1>', '<Nop>', { silent = true })
vim.keymap.set('v', '<F1>', '<Nop>', { silent = true })


-- Diagnostic
vim.keymap.set('n', '<leader>e', vim.diagnostic.setloclist)

----------------------------------------
--------		PLUGINS			--------
----------------------------------------

vim.keymap.set('n', '-', function()
		local reveal_file = vim.fn.expand('%:p')
		if (reveal_file == '') then
			reveal_file = vim.fn.getcwd()
		else
			local f = io.open(reveal_file, "r")
			if (f) then
				f.close(f)
			else
				reveal_file = vim.fn.getcwd()
			end
		end
		require('neo-tree.command').execute({
			action = "focus", -- OPTIONAL, this is the default value
			source = "filesystem", -- OPTIONAL, this is the default value
			position = "left", -- OPTIONAL, this is the default value
			toggle = true,
			reveal_file = reveal_file, -- path to file or folder to reveal
			reveal_force_cwd = true, -- change cwd without asking if needed
		})
	end,
	{ desc = "Open neo-tree at current file or working directory" }
);

-- Undo tree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.live_grep();
end)











vim.keymap.set("n", "<leader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<leader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<leader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<leader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("v", "<leader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
	{ silent = true, desc = "evaluate visual selection" })
