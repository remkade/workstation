local wk = require('which-key')

wk.add({
	{ "<leader>f", group = "Telescope" },
	{ "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Find Buffer", remap = false },
	{ "<leader>fd", function() require("telescope.builtin").lsp_definitions() end, desc = "Find definitions (LSP)", remap = false },
	{ "<leader>fe", function() require("telescope.builtin").lsp_workspace_diagnostics() end, desc = "Find workspace diagnostics (LSP)", remap = false },
	{ "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files", remap = false },
	{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live Grep", remap = false },
	{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Find tags", remap = false },
	{ "<leader>fm", "<Cmd>Telescope media_files<cr>", desc = "Find Media Files", remap = false },
	{ "<leader>fr", function() require("telescope.builtin").lsp_references() end, desc = "Find references (LSP)", remap = false },
	{ "<leader>ft", "<Cmd>TodoTelescope<cr>", desc = "Show Todo Items", remap = false },

	{ "<leader>g", group = "Neogit" },
	{ "<leader>gg", "<Cmd>Neogit<cr>", desc = "Open Neogit", remap = false },
	
	{ "<leader>r", group = "NvimTree" },
	{ "<leader>rt", "<Cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", remap = false },

	{ "<leader>t", group = "Trouble" },
	{ "<leader>tc", "<Cmd>TroubleClose<cr>", desc = "Close Trouble", remap = false },
	{ "<leader>td", "<Cmd>TodoTrouble<cr>", desc = "Show Todo Items", remap = false },
	{ "<leader>to", "<Cmd>TroubleOpen<cr>", desc = "Open Trouble", remap = false },
	{ "<leader>tt", "<Cmd>TroubleToggle<cr>", desc = "Toggle Trouble", remap = false },

	{ "<leader>c", group="Code Companion"},
	{ "<leader>cf", "<Cmd>CodeCompanionActions<cr>", desc = "Code Companion Actions", remap = false },
	{ "<leader>cc", function() require("codecompanion").chat() end, desc = "Code Companion Chat", remap = false },
})
