-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "rosepine",

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.nvdash = {
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

    buttons = {
        { txt = "  New File", keys = "Ctrl b", cmd = "enew" },
        { txt = "  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },
        { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
        { txt = "󰈚  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
        { txt = "  Bookmarks", keys = "Spc m a", cmd = "Telescope marks" },
    },
}
M.ui = {
    tabufline = {
        enabled = false,
    },
}

return M
