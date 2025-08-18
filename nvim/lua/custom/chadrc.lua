---@type ChadrcConfig
local M = {}

-- User interface configuration
M.ui = {
  -- Set the theme to rosepine
  theme = "rosepine",

  -- Override highlight groups
  hl_override = {
    CursorLine = {
      bg = "one_bg",
    },
  },

  -- NvChad dashboard configuration
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

-- Load custom plugins
M.plugins = "custom.plugins"

-- Load custom mappings
M.mappings = require "custom.mappings"

-- Load custom options
require "custom.options"

-- Load custom autocommands
require "custom.autocmds"

-- Set clipboard to use system clipboard
vim.opt.clipboard = ""

return M
