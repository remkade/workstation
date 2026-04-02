-- vim: sw=2 et sts=2
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

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using
				-- (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = {
					"vim",
					"require",
				},
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches
local servers = {
	"bashls",
	"beancount",
	"cssls",
	"denols",
	"elmls",
	"gopls",
	"hls",
	"html",
	"intelephense",
	"jsonls",
	"lua_ls",
	"pylsp",
	"rust_analyzer",
	"solargraph",
	"texlab",
	"yamlls",
}

for _, s in ipairs(servers) do
	vim.lsp.enable(s)
end
