-- install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- init
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- install plugins
local has_nvim_0_10_4 = vim.fn.has("nvim-0.10.4") == 1

lazy.setup({
    "williamboman/mason.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "nvim-lua/plenary.nvim",
    "EdenEast/nightfox.nvim",
    "akinsho/bufferline.nvim",
    "averms/black-nvim",
    "stevearc/oil.nvim",
    "danymat/neogen",

    "nvim-treesitter/nvim-treesitter",
    {
        "nvim-telescope/telescope.nvim",
        enabled = has_nvim_0_10_4,
    },

    { "neoclide/coc.nvim", branch = "release" },
    "numToStr/Comment.nvim",
}, {
    ui = {
        border = "rounded",
    },
})
