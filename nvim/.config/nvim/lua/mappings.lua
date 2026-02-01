require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Toggle transparency
map("n", "<leader>tt", function()
  local config = require("nvconfig")
  config.base46.transparency = not config.base46.transparency
  require("base46").load_all_highlights()

  if config.base46.transparency then
    vim.notify("Transparency enabled", vim.log.levels.INFO)
  else
    vim.notify("Transparency disabled", vim.log.levels.INFO)
  end
end, { desc = "Toggle Transparency" })
