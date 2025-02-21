---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "rosepine",
  hl_override = {
    CursorLine = {
      bg = "one_bg",
    },
  },
  nvdash = {
    load_on_startup = true,
    header = {
      "                                                  ",
      "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "                                                  ",
    },
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
require "custom.options"
vim.opt.clipboard = ""

return M
