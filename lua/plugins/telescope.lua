return {
	{
		'nvim-telescope/telescope.nvim', version = "*",
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-tree/nvim-web-devicons',
			{ 
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make'
			},
		}
	},
}
