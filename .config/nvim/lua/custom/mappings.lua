---@type MappingsTable
local M = {}

M.general = {
  -- normal mode
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- toggle nvim tree
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    -- tmux navigation
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},

  },
  -- visual mode
  v = {
    [">"] = { ">gv", "indent"},
  },
  i = {
    ["jk"] = {"<Esc>", "enter normal mode", opts = { nowait = true }},
    ["kj"] = {"<Esc>", "enter normal mode", opts = { nowait = true }},
  }
}

-- more keybinds!

return M
