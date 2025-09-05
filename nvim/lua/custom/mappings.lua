local M = {}

-- DAP mappings
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

-- DAP Go mappings
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

-- Gopher mappings
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

-- General mappings
M.general = {
  n = {
    -- Clear search highlights
    ["<leader>nh"] = { ":nohl<CR>", "Clear search highlights" },

    -- Scroll and center
    ["<C-d>"] = { "<C-d>zz", "Scroll down and center" },
    ["<C-u>"] = { "<C-u>zz", "Scroll up and center" },

    -- Search result and center
    ["n"] = { "nzzzv", "Next search result and center" },
    ["N"] = { "Nzzzv", "Previous search result and center" },

    -- Yank line to system clipboard
    ["<leader>Y"] = { [["+Y]], "Yank line to system clipboard" },

    -- Window management
    ["<leader>sv"] = { "<C-w>v", "Split window vertically" }, -- split window vertically
    ["<leader>sh"] = { "<C-w>s", "Split window horizontally" }, -- split window horizontally
    ["<leader>se"] = { "<C-w>=", "Make splits equal size" }, -- make split windows equal width & height
    ["<leader>sx"] = { "<cmd>close<CR>", "Close current split" }, -- close current split window

    -- Substitute word under cursor
    ["<leader>sr"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Substitute word under cursor" },

    -- Tab management
    ["<leader>tc"] = { "<cmd>tabclose<CR>", "Close current tab", opts = { silent = true } },

    -- Git worktree
    ["<leader>gw"] = { function() require("telescope").extensions.git_worktree.git_worktree() end, "Switch git worktreie" },
    ["<leader>gwa"] = { function() require("telescope").extensions.git_worktree.create_git_worktree() end, "Create a new git worktreie" },


    -- Disable Q
    ["Q"] = { "<nop>" },

    -- Delete without yanking
    ["<leader>d"] = { [["_d]], "Delete without yanking" },

    -- Yank to system clipboard
    ["<leader>y"] = { [["+y]], "Yank to system clipboard" },

  },
  v = {
    -- Move selected line up and down
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selected line down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selected line up" },

    -- Yank to system clipboard
    ["<leader>y"] = { [["+y]], "Yank to system clipboard" },

    -- Delete without yanking
    ["<leader>d"] = { [["_d]], "Delete without yanking" },

  },

  x = {
    -- Paste without overwriting clipboard
    ["<leader>p"] = { [["_dP]], "Paste without overwriting clipboard" },
  }
}

return M