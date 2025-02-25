local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line"
    },
    ["<leader>dus"] = {
      function()
        local widgets = require('dap.ui.widgets');
        local sidebar = widgets.sidebar(widgets.scopes);
        sidebar.open();
      end,
      "Open debugging sidebar"
    }
  }
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require('dap-go').debug_test()
      end,
      "Debug go test"
    },
    ["<leader>dgl"] = {
      function()
        require('dap-go').debug_last()
      end,
      "Debug last go test"
    }
  }
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags"
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags"
    }
  }
}

M.general = {
  n = {
    ["<leader>nh"] = { ":nohl<CR>", "Clear search highlights" },
    ["<C-d>"] = { "<C-d>zz", "Scroll down and center" },
    ["<C-u>"] = { "<C-u>zz", "Scroll up and center" },
    ["n"] = { "nzzzv", "Next search result and center" },
    ["N"] = { "Nzzzv", "Previous search result and center" },
    ["<leader>Y"] = { [["+Y]], "Yank line to system clipboard" },
    ["<leader>sv"] = { "<C-w>v", "Split window vertically" }, -- split window vertically
    ["<leader>sh"] = { "<C-w>s", "Split window horizontally" }, -- split window horizontally
    ["<leader>se"] = { "<C-w>=", "Make splits equal size" }, -- make split windows equal width & height
    ["<leader>sx"] = { "<cmd>close<CR>", "Close current split" }, -- close current split window

    ["<leader>sr"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Substitute word under cursor" },
    ["<leader>tc"] = { "<cmd>tabclose<CR>", "Close current tab", opts = { silent = true } },
    ["Q"] = { "<nop>" },

    ["<leader>d"] = { [["_d]], "Delete without yanking" },

    ["<leader>y"] = { [["+y]], "Yank to system clipboard" },

  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected line up" },
    ["<leader>y"] = { [["+y]], "Yank to system clipboard" },

    ["<leader>d"] = { [["_d]], "Delete without yanking" },

  },

  x = {
    ["<leader>p"] = { [["_dP]], "Paste without overwriting clipboard" },
  }
}

return M
