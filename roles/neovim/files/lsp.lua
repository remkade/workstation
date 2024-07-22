-- vim: sw=2 et sts=2
local nvim_lsp = require('lspconfig')
local wk = require('which-key')
require('cmp_config')

require("luasnip.loaders.from_vscode").lazy_load()

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  wk.add({
    { "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", buffer = 4, desc = "Signature Help", remap = false },
    { "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", buffer = 4, desc = "Type Definition", remap = false },
    { "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", buffer = 4, desc = "Code Action", remap = false },
    { "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", buffer = 4, desc = "Line Diagnostics", remap = false },
    { "<C-f>", "<cmd>lua vim.lsp.buf.format()<CR>", buffer = 4, desc = "Format all files", remap = false },
    { "<leader>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", buffer = 4, desc = "Diagnostics in Location List", remap = false },
    { "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", buffer = 4, desc = "Rename Object", remap = false },
    { "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", buffer = 4, desc = "Add Folder to Workspace", remap = false },
    { "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", buffer = 4, desc = "List workspace Folders", remap = false },
    { "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", buffer = 4, desc = "Remove Workspace Folder", remap = false },
    { "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", buffer = 4, desc = "LSP Hover", remap = false },
    { "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", buffer = 4, desc = "Next Diagnostic", remap = false },
    { "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", buffer = 4, desc = "Previous Diagnostic", remap = false },
    { "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", buffer = 4, desc = "Goto Declaration", remap = false },
    { "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", buffer = 4, desc = "Goto Definition", remap = false },
    { "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", buffer = 4, desc = "Show Implementations", remap = false },
    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>", buffer = 4, desc = "Show References", remap = false },
})

end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local solargraph_cmd = function()
  local ret_code = nil
  local jid = vim.fn.jobstart("bundle info solargraph", { on_exit = function(_, data) ret_code = data end })
  vim.fn.jobwait({ jid }, 5000)
  if ret_code == 0 then
    return { "bundle", "exec", "solargraph", "stdio" }
  end
  return { "solargraph", "stdio" }
end

local pylsp_cmd = function()
  local ret_code = nil
  local jid = vim.fn.jobstart("poetry run pylsp --version", { on_exit = function(_, data) ret_code = data end })
  vim.fn.jobwait({ jid }, 5000)
  if ret_code == 0 then
    return { "poetry", "run", "pylsp" }
  end
  return { "pylsp" }
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "bashls", "cssls", "denols", "gopls", "hls", "html", "intelephense", "jsonls", "solargraph", "texlab", "yamlls" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

nvim_lsp["pylsp"].setup { 
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = pylsp_cmd(),
  settings = {
    pylsp = {
      plugins = {
        ruff = { enabled = true },
        mypy = { enabled = true },
        rope = { enabled = true }
      }
    }
  }
}

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

local lspconfig = require 'lspconfig'
lspconfig.beancount.setup= {
    init_options = {
        journal_file = "/home/kyle/SpiderOak Hive/Business/Amber Leaders Designs/Accounting",
    };
};

-- require("lspconfig").ruby_ls.setup({
  -- on_attach = function(client, buffer)
    -- setup_diagnostics(client, buffer)
  -- end,
-- })
