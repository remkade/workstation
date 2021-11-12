local wk = require('which-key')

wk.register({
	['<leader>'] = {
		f = {
			name = 'Telescope',
			b = { '<Cmd>lua require("telescope.builtin").buffers()<cr>', "Find Buffer", noremap=true },
			d = { '<Cmd>lua require("telescope.builtin").lsp_definitions()<cr>', "Find definitions (LSP)", noremap=true },
			e = { '<Cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>', "Find workspace diagnostics (LSP)", noremap=true },
			f = { '<Cmd>lua require("telescope.builtin").find_files()<cr>', "Find files", noremap=true },
			g = { '<Cmd>lua require("telescope.builtin").live_grep()<cr>', "Live Grep", noremap=true },
			h = { '<Cmd>lua require("telescope.builtin").help_tags()<cr>', "Find tags", noremap=true },
			m = { '<Cmd>Telescope media_files<cr>', "Find Media Files", noremap=true },
			r = { '<Cmd>lua require("telescope.builtin").lsp_references()<cr>', "Find references (LSP)", noremap=true },
		},
		t = {
			name = 'Trouble',
			c = { '<Cmd>TroubleClose<cr>', 'Close Trouble', noremap=true },
			o = { '<Cmd>TroubleOpen<cr>', 'Open Trouble', noremap=true },
			t = { '<Cmd>TroubleToggle<cr>', 'Toggle Trouble', noremap=true },
		},
		g = {
			name = 'Neogit',
			g = { '<Cmd>Neogit<cr>', 'Open Neogit', noremap=true },
		},
	},
})
