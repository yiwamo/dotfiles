-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- チートシートを開く
vim.api.nvim_create_user_command("Opencheatsheet", function()
  vim.cmd("edit ~/.dotmemo/nvim/CHEATSHEET.md")
end, {})

-- ToDoリストを開く
vim.api.nvim_create_user_command("OpenTodoList", function()
  vim.cmd("edit ~/.dotmemo/TODO.md")
end, {})

-- 外部変更の自動検出
vim.opt.autoread = true
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  command = "checktime",
})
vim.api.nvim_create_autocmd({ "FileChangedShellPost" }, {
  callback = function()
    vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.WARN)
  end,
})
