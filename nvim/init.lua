require("base")
require("autocmds")
require("options")
require("plugins")
require("keymaps")
require("coc")
-- Plugin configurations
require("oil").setup({
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
        win_options = {
            winblend = 10,
        },
    },
    keymaps = {
        ["<C-h>"] = "actions.parent",
        ["<leader>|"] = "actions.select_vsplit",
        ["<leader>-"] = "actions.select_split",
        ["<leader>t"] = "actions.select_tab",
        ["<C-r>"] = "actions.refresh",
        ["q"] = "actions.close",
    },
})
-- lua/mason-config.lua
require("mason").setup({
    ui = {
        border = "rounded",
    },
})

require("mason-tool-installer").setup({
    -- List of tools to be automatically installed
    ensure_installed = {
        "stylua", -- Lua formatter
        "shfmt", -- Shell formatter
        "black", -- Python formatter
        "pyright", -- Python LSP
        "clangd", -- C/C++ Language Server (for coc or nvim-lsp)
        "clang-format", -- C/C++ formatter
        "codelldb", -- debug
        "html-lsp", -- HTML formatter
    },

    -- Automatically update tools
    auto_update = true,
    -- Run installation on startup
    run_on_start = true,
})
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "lua",
        "vim",
        "vimdoc",
        "query",
    },
    auto_install = true,
    highlight = {
        enable = true,
    },
})
require("neogen").setup({
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
})
require("colorscheme")
