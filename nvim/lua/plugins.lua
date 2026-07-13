-- install lazy.nvim if not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
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
lazy.setup({
    { "williamboman/mason.nvim", opts = { ui = { border = "rounded" } } },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "glow",
                "stylua",
                "shfmt",
                "black",
                "pyright",
                "clangd",
                "clang-format",
                "codelldb",
                "html-lsp",
            },
            auto_update = true,
            run_on_start = true,
        },
    },
    "nvim-lua/plenary.nvim",
    "EdenEast/nightfox.nvim",
    "akinsho/bufferline.nvim",
    "averms/black-nvim",
    "nvim-telescope/telescope.nvim",
    "numToStr/Comment.nvim",
    {
        "skanehira/preview-markdown.vim",
        init = function()
            vim.g.preview_markdown_parser = "glow"
        end,
    },
    {
        "stevearc/oil.nvim",
        opts = {
            default_file_explorer = true,
            view_options = {
                show_hidden = true,
                natural_sorting = true,
            },
            float = {
                padding = 2,
                max_width = 0.9,
                max_height = 0.9,
                border = "rounded",
                win_options = { winblend = 10 },
            },
            keymaps = {
                ["<C-h>"] = "actions.parent",
                ["<leader>|"] = "actions.select_vsplit",
                ["<leader>-"] = "actions.select_split",
                ["<leader>t"] = "actions.select_tab",
                ["<C-r>"] = "actions.refresh",
                ["q"] = "actions.close",
            },
        },
    },

    {
        "danymat/neogen",
        languages = {
            c = {
                template = {
                    annotation_convention = "doxygen",
                },
            },
            python = {
                template = {
                    annotation_convention = "numpydoc",
                },
            },
        },
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
        config = function()
            pcall(function()
                require("nvim-treesitter.configs").setup({
                    highlight = { enable = true },
                })
            end)
        end,
        opts = {
            ensure_installed = {
                "c",
                "cpp",
                "python",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
            },
            highlight = { enable = true },
        },
    },
    { "neoclide/coc.nvim", branch = "release" },
}, { ui = { border = "rounded" } })
