-- ===================== --
-- == Editor Settings == --
-- ===================== --

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " " -- set leader to space
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.wo.relativenumber = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.g.rust_recommended_style = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 8
vim.opt.cursorline = true

-- ===================== --
-- ==     Plugins     == --
-- ===================== --

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	print("Installing lazy...");
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.termguicolors = true
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins");
