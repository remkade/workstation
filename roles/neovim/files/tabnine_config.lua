require('tabnine').setup({
  disable_auto_comment=true,
  accept_keymap="<F12>", -- I remapped this to Capslock on my corsa
  dismiss_keymap = "<C-]>",
  debounce_ms = 800,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree", "Trouble"},
  log_file_path = nil, -- absolute path to Tabnine log file
})
