local nvim_lsp = require('lspconfig')
local wk = require('which-key')

local on_attach = function(client, bufnr)
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap=true, silent=true }

	wk.register({
		['<C-k>'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help', buffer=bufnr, noremap=true },
		['g'] = {
			D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration', buffer=bufnr, noremap=true },
			d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition', buffer=bufnr, noremap=true },
			i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Show Implementations', buffer=bufnr, noremap=true },
			r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Show References', buffer=bufnr, noremap=true },
		},
		['<space>'] = {
			D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type Definition', buffer=bufnr, noremap=true },
			e = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'Line Diagnostics', buffer=bufnr, noremap=true },
			q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'Diagnostics in Location List', buffer=bufnr, noremap=true },
			f = {'<cmd>lua vim.lsp.buf.format({async=true})<CR>', buffer=bufnr, noremap=true},
			rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename Object', buffer=bufnr, noremap=true },
			wa = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'Add Folder to Workspace', buffer=bufnr, noremap=true },
			wl = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'List workspace Folders', buffer=bufnr, noremap=true },
			wr = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'Remove Workspace Folder', buffer=bufnr, noremap=true },
		},
		['K'] = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'LSP Hover', buffer=bufnr, noremap=true },
		['[d'] = { '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', 'Next Diagnostic', buffer=bufnr, noremap=true },
		[']d'] = { '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', 'Previous Diagnostic', buffer=bufnr, noremap=true },
	})

	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pylsp", "tsserver", "gopls", "cssls", "bashls", "yamlls", "solargraph", "intelephense" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = { debounce_text_changes = 150 }
  }
end

nvim_lsp["rust_analyzer"].setup { 
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = 'clippy';
      }
    }
  }
}
