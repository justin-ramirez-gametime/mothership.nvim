require("lua.mothership.tractor_beam")
require("lua.mothership.autopilot")
require("after.plugin.control_panel")

-- Set leader
vim.g.mapleader = " "
-- Toggle Nvim-Tree
vim.keymap.set("n", "<leader>jt", vim.cmd.NvimTreeToggle)
-- Run Sync for Packer
vim.keymap.set("n", "<leader>jf", vim.cmd.PackerSync)



-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()
