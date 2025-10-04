-- Output Debug messages
vim.api.nvim_create_user_command("DumpMsgs", function()
  vim.cmd("redir > ~/.local/state/nvim/messages.log | silent messages | redir END")
  print("Messages dumped to ~/.local/state/nvim/messages.log")
end, {})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  group = highlight_group,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})
