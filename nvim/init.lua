-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- チートシートを開く

vim.api.nvim_create_user_command("Opencheatsheet", function()
  vim.cmd("edit ~/.dotmemo/nvim/CHEATSHEET.md")
end, {})
