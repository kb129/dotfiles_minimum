require("base")
require("autocmds")
require("options")
require("plugins")
require("keymaps")
require("coc")
-- Plugin configurations
local function setup_if_available(module_name, setup_opts)
    local ok, module = pcall(require, module_name)
    if not ok then
        return
    end
    if type(module.setup) == "function" then
        module.setup(setup_opts)
    end
end

setup_if_available("oil", {
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

setup_if_available("mason", {
    ui = {
        border = "rounded",
    },
})

setup_if_available("mason-tool-installer", {
    ensure_installed = {
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
})

setup_if_available("nvim-treesitter.configs", {
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

setup_if_available("neogen", {
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
