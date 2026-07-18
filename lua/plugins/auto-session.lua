return {
	"rmagatti/auto-session",
	lazy = false,

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
}

--- :AutoSession save " saves a session based on the `cwd` in `root_dir`
--- :AutoSession save my_session " saves a session called `my_session` in `root_dir`
---
--- :AutoSession restore " restores a session based on the `cwd` from `root_dir`
--- :AutoSession restore my_session " restores `my_session` from `root_dir`
---
--- :AutoSession delete " deletes a session based on the `cwd` from `root_dir`
--- :AutoSession delete my_session " deletes `my_session` from `root_dir`
---
--- :AutoSession disable " disables autosave
--- :AutoSession enable " enables autosave (still does all checks in the config)
--- :AutoSession toggle" toggles autosave
---
--- :AutoSession purgeOrphaned " removes all orphaned sessions with no working directory left.
---
--- :AutoSession search " opens a session picker, see Config.session_lens.picker
--- :AutoSession deletePicker " opens a vim.ui.select picker to choose a session to delete.
