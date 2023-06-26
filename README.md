# A Neovim configuration repo to space out with

-- Insert the following into your ~/.config/nvim/init.lua

local beammeup = vim.fn.stdpath("data") .. "/mothership/mothership.nvim"
if not vim.loop.fs_stat(beammeup) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/ramirez-justin/mothership.nvim",
    "--branch=stable", -- latest stable release
    beammeup,
  })
end
vim.opt.rtp:prepend(beammeup)

require("mothership")


