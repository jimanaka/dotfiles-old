-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

local opt = vim.opt
local g = vim.g

opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true

local autocmd = vim.api.nvim_create_autocmd
local function open_nvim_tree(data)

  -- buffer is a directory
  local directory = vim.fn.isdirectory(data.file) == 1
  -- is a [No Name]
  local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
  if not directory then
    return
  end

  if directory then
    vim.cmd.cd(data.file)
  end
  require("nvim-tree.api").tree.open()
end

autocmd({ "VimEnter" }, { callback = open_nvim_tree })
