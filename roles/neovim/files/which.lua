local wk = require("which-key")

-- Setup the Conform.nvim format command
-- From: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#format-command
vim.api.nvim_create_user_command("Format", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	require("conform").format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

wk.add({
	{
		"<C-k>",
		function()
			vim.lsp.buf.signature_help()
		end,
		desc = "Signature Help",
		remap = false,
	},
	{ "<leader>d", group = "Code Definitions" },
	{
		"<leader>D",
		function()
			vim.lsp.buf.type_definition()
		end,
		desc = "Type Definition",
		remap = false,
	},
	{
		"<leader>ca",
		function()
			vim.lsp.buf.code_action()
		end,
		desc = "Code Action",
		remap = true,
	},
	{
		"<leader>e",
		function()
			vim.diagnostic.open_float()
		end,
		desc = "Line Diagnostics",
		remap = false,
	},
	{
		"<leader>q",
		function()
			vim.lsp.diagnostic.set_loclist()
		end,
		desc = "Diagnostics in Location List",
		remap = false,
	},
	{ "<leader>r", group = "Code Action: Rename" },
	{
		"<leader>ro",
		function()
			vim.lsp.buf.rename()
		end,
		desc = "Rename Object",
		remap = false,
	},
	{ "<leader>w", group = "Workspace" },
	{
		"<leader>wa",
		function()
			vim.lsp.buf.add_workspace_folder()
		end,
		desc = "Add Folder to Workspace",
		remap = false,
	},
	{
		"<leader>wl",
		function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end,
		desc = "List workspace Folders",
		remap = false,
	},
	{
		"<leader>wr",
		function()
			vim.lsp.buf.remove_workspace_folder()
		end,
		desc = "Remove Workspace Folder",
		remap = false,
	},
	{
		"K",
		function()
			vim.lsp.buf.hover()
		end,
		desc = "LSP Hover",
		remap = false,
	},
	{
		"[d",
		function()
			vim.lsp.diagnostic.goto_prev()
		end,
		desc = "Next Diagnostic",
		remap = false,
	},
	{
		"]d",
		function()
			vim.lsp.diagnostic.goto_next()
		end,
		desc = "Previous Diagnostic",
		remap = false,
	},
	{
		"gD",
		function()
			vim.lsp.buf.declaration()
		end,
		desc = "Goto Declaration",
		remap = false,
	},
	{
		"gd",
		function()
			vim.lsp.buf.definition()
		end,
		desc = "Goto Definition",
		remap = false,
	},
	{
		"gi",
		function()
			vim.lsp.buf.implementation()
		end,
		desc = "Show Implementations",
		remap = false,
	},
	{
		"gr",
		function()
			vim.lsp.buf.references()
		end,
		desc = "Show References",
		remap = false,
	},
	{ "<leader>c", group = "Code Companion" },
	{
		"<leader>cc",
		"<Cmd>CodeCompanionChat<cr>",
		desc = "Code Companion Chat",
		remap = false,
	},
	{ "<leader>cf", "<Cmd>CodeCompanionActions<cr>", desc = "Code Companion Actions", remap = false },

	-- Format with conform.nvim
	{ "<leader>F", "<Cmd>Format<cr>", desc = "Format this file", remap = false },

	-- Telescope
	{ "<leader>f", group = "Telescope" },
	{
		"<leader>fb",
		function()
			require("telescope.builtin").buffers()
		end,
		desc = "Find Buffer",
		remap = false,
	},
	{
		"<leader>fd",
		function()
			require("telescope.builtin").lsp_definitions()
		end,
		desc = "Find definitions (LSP)",
		remap = false,
	},
	{
		"<leader>fe",
		function()
			require("telescope.builtin").lsp_workspace_diagnostics()
		end,
		desc = "Find workspace diagnostics (LSP)",
		remap = false,
	},
	{
		"<leader>ff",
		function()
			require("telescope.builtin").find_files()
		end,
		desc = "Find files",
		remap = false,
	},
	{
		"<leader>fg",
		function()
			require("telescope.builtin").live_grep()
		end,
		desc = "Live Grep",
		remap = false,
	},
	{
		"<leader>fh",
		function()
			require("telescope.builtin").help_tags()
		end,
		desc = "Find tags",
		remap = false,
	},
	{ "<leader>fm", "<Cmd>Telescope media_files<cr>", desc = "Find Media Files", remap = false },
	{
		"<leader>fr",
		function()
			require("telescope.builtin").lsp_references()
		end,
		desc = "Find references (LSP)",
		remap = false,
	},
	{ "<leader>ft", "<Cmd>TodoTelescope<cr>", desc = "Show Todo Items", remap = false },

	{ "<leader>g", group = "Neogit" },
	{ "<leader>gg", "<Cmd>Neogit<cr>", desc = "Open Neogit", remap = false },

	{ "<leader>r", group = "NvimTree" },
	{ "<leader>rt", "<Cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", remap = false },

	{ "<leader>t", group = "Trouble" },
	{ "<leader>tt", "<Cmd>Trouble diagnostics<cr>", desc = "Open Trouble Diagnostics", remap = false },
	{ "<leader>td", "<Cmd>Trouble todo<cr>", desc = "Show Todo Items", remap = false },
})
