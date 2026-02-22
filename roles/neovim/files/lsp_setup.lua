-- vim: sw=2 et sts=2
local wk = require("which-key")

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

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
	})
end

local solargraph_cmd = function()
	local ret_code = nil
	local jid = vim.fn.jobstart("bundle info solargraph", {
		on_exit = function(_, data)
			ret_code = data
		end,
	})
	vim.fn.jobwait({ jid }, 5000)
	if ret_code == 0 then
		return { "bundle", "exec", "solargraph", "stdio" }
	end
	return { "solargraph", "stdio" }
end

local pylsp_cmd = function()
	local ret_code = nil
	local jid = vim.fn.jobstart("poetry run pylsp --version", {
		on_exit = function(_, data)
			ret_code = data
		end,
	})
	vim.fn.jobwait({ jid }, 5000)
	if ret_code == 0 then
		return { "poetry", "run", "pylsp" }
	end
	return { "pylsp" }
end

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
	"bashls",
	"cssls",
	"denols",
	"gopls",
	"hls",
	"html",
	"intelephense",
	"jsonls",
	"texlab",
	"yamlls",
	"elmls",
	"beancount",
}

for _, s in ipairs(servers) do
	vim.lsp.enable(s)
end

vim.lsp.config("solargraph", {
	settings = {
		["solargraph"] = {
			auto_format = true,
			formatting = true,
			useBundler = true,
		},
	},
})

vim.lsp.config("pylsp", {
	cmd = pylsp_cmd(),
	settings = {
		["pylsp"] = {
			plugins = {
				ruff = { enabled = true },
				mypy = { enabled = true },
				rope = { enabled = true },
			},
		},
	},
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust_analyzer"] = {
			formatOnSave = true,
			check = {
				command = "clippy",
			},
		},
	},
})
