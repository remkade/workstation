local o = vim.o
local bo = vim.bo
local wo = vim.wo

-- global options
o.termguicolors = true

if vim.fn.has('win64') == 1 then
  -- Use Powershell on Windows
  o.shell = "powershell.exe"
  o.shellcmdflag = "NoProfile\ -NoLogo\ -NonInteractive\ -Command"
  o.shellpipe = "|"
  o.shellredir = ">"
end

require "paq" {
  -- VIM Functionality
  "Shougo/dein.vim";
  "Shougo/deoplete.nvim";
  "Shougo/denite.nvim";
  "Shougo/neosnippet.vim";
  "Shougo/neosnippet-snippets";
  "ctrlpvim/ctrlp.vim";
  "bling/vim-airline";
  "ryanoasis/vim-devicons";
  "neomake/neomake";
  "wincent/ferret";
  "tpope/vim-fugitive";
  "ludovicchabant/vim-lawrencium";
  -- Collection of common configurations for the Nvim LSP client
  "neovim/nvim-lspconfig";
  -- Extensions to built-in LSP, for example, providing type inlay hints
  "tjdevries/lsp_extensions.nvim";
  -- Autocompletion framework for built-in LSP
  "nvim-lua/completion-nvim";
  -- Diagnostic navigation and settings for built-in LSP
  "nvim-lua/diagnostic-nvim";

  -- Languages
  "Glench/Vim-Jinja2-Syntax";
  "cespare/vim-toml";
  "dag/vim-fish";
  "ekalinin/Dockerfile.vim";
  "elmcast/elm-vim";
  "fatih/vim-go";
  "hashivim/vim-terraform";
  "othree/html5.vim";
  "rust-lang/rust.vim";
  "vlaadbrain/gnuplot.vim";
  "PProvost/vim-ps1";

  -- Color Schemes
  "Siphalor/vim-atomified";
  "Yggdroot/duoduo";
  "ajmwagar/vim-deus";
  "arcticicestudio/nord-vim";
  "blerins/flattown";
  "chase/focuspoint-vim";
  "flrnd/candid.vim";
  "flrnprz/plastic.vim";
  "lithammer/vim-eighties";
  "mhartington/oceanic-next";
  "rhysd/vim-color-spring-night";
  "rhysd/wallaby.vim";
  "sainnhe/archived-colors"; -- Cryslominsa
  "sainnhe/edge";
  "sainnhe/sonokai";
  "sainnhe/vim-color-forest-night";
  "scwood/vim-hybrid";
  "tjammer/blayu.vim";
  "wmvanvliet/vim-blackboard";
}
-- Required:
vim.fn.filetype plugin indent on

function! RandomColorscheme()
python3 << EOF
import vim
import random
schemes = [
	'OceanicNext',
	'atomified',
	'blackboard',
	'blayu',
	'candid',
	'cryslominsa',
	'deus',
	'duoduo',
	'edge',
	'eighties',
	'flattown',
	'focuspoint',
        'forest-night',
	'hybrid',
	'nord',
	'plastic',
	'spring-night',
	'sonokai',
	'wallaby'
	]
scheme = random.choice(schemes)
if scheme == 'sonokai':
	variant = random.choice(['shusia','andromeda','atlantis','maia'])
	vim.command("vim.g.sonokai_style = '%s'" % variant)
	vim.command("vim.g.airline_theme = 'sonokai'")
vim.command("colorscheme %s" % scheme)
EOF
endfunction

vim.g.sonokai_enable_italic = 1
vim.g.sonokai_disable_italic_comment = 1

set background=dark
call RandomColorscheme()

-- folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

-- File type based indentation
filetype plugin indent on
vim.g.airline#extensions#tabline#enabled = 1
vim.g.airline_powerline_fonts = 1

-- Set leader to ,
vim.g.mapleader = ','

-- Setup python3
vim.g.python_host_prog = '{{ python_bin.stdout }}'

" disable mouse on command line
if !has('gui_running')
  set mouse-=a
end

if has('nvim')
  -- Set completeopt to have a better completion experience
  " :help completeopt
  " menuone: popup even when there's only one match
  " noinsert: Do not insert text until a selection is made
  " noselect: Do not select, force user to select one from the menu
  set completeopt=menuone,noinsert,noselect

  -- Avoid showing extra messages when using completion
  set shortmess+=c

  -- Configure LSP
  " https://github.com/neovim/nvim-lspconfig#rust_analyzer
lua <<EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd!
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
local servers = { "pyright", "tsserver", "gopls", "cssls", "bashls", "yamlls", "solargraph", "intelephense" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp.rust_analyzer.setup{ 
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = 'clippy';
      }
    }
  }
}
EOF
endif

-- Deocomplete
vim.g.deoplete#enable_at_startup = 1

-- Enable snipMate compatibility feature.
vim.g.neosnippet#enable_snipmate_compatibility = 1

-- Deinite
-- Ripgrep command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

-- Required for operations modifying multiple buffers like rename.
set hidden

-- Fix for mac
set pyxversion=3

-- Disable some vim-go stuff handled by lsp
vim.g.go_code_completion_enabled = 0
vim.g.go_fmt_autosave = 0
vim.g.go_mod_fmt_autosave = 0

-- File indentation
autocmd Filetype ruby set sts=2 sw=2 et
autocmd Filetype yaml set sts=2 sw=2 et
autocmd Filetype json set sts=2 sw=2 et
autocmd Filetype js set sts=2 sw=2 et
autocmd Filetype vim set sts=2 sw=2 et

if has('nvim')
  -- Auto-format *.rs (rust) files prior to saving them
  autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 1000)
  autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)
endif

-- Ignore rust/go specific build stuff
o.wildignore += "*/target/*,*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk,env/"
set backspace=2

if executable('rg')
  vim.g.ackprg = 'rg --no-heading --vimgrep'
endif

-- Plugin key-mappings.
-- Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

-- SuperTab like snippets behavior.
-- Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
  \ pumvisible() ? "\<C-n>" :
  \ neosnippet#expandable_or_jumpable() ?
  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
  \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

-- Denite define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction

-- Run neomake to do linters or whatever
noremap <leader>l :Neomake<enter>

-- Swap between buffers easy
noremap <leader>n :bn<enter>
noremap <leader>p :bp<enter>
