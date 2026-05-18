require("base")
require("autocmds")
require("options")
require("plugins")
require("keymaps")
require("coc")
-- Plugin configurations
local function notify_if_ui(message, level)
    if #vim.api.nvim_list_uis() > 0 then
        vim.notify(message, level)
    end
end

-- module_name is the Lua require path; plugin_name is the lazy.nvim plugin identifier.
local function setup_if_available(module_name, setup_opts, plugin_name)
    local ok, module = pcall(require, module_name)
    if not ok then
        local lazy_ok, lazy = pcall(require, "lazy")
        if lazy_ok then
            lazy.load({ plugins = { plugin_name or module_name } })
            ok, module = pcall(require, module_name)
        end
    end
    if not ok then
        notify_if_ui(("Skip %s setup: module is not available"):format(module_name), vim.log.levels.WARN)
        return
    end
    if type(module.setup) ~= "function" then
        notify_if_ui(("Skip %s setup: setup() is not available"):format(module_name), vim.log.levels.WARN)
        return
    end
    local setup_ok, err = pcall(module.setup, setup_opts)
    if not setup_ok then
        notify_if_ui(("Failed setup for %s: %s"):format(module_name, tostring(err)), vim.log.levels.ERROR)
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
}, "oil.nvim")

setup_if_available("mason", {
    ui = {
        border = "rounded",
    },
}, "mason.nvim")

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
}, "mason-tool-installer.nvim")

-- treesitter exposes setup() from "nvim-treesitter.configs" module.
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
}, "nvim-treesitter")

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
}, "neogen")
require("colorscheme")
