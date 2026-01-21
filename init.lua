if os.getenv("NVIM_PACKAGE_MANAGER") ~= "NIX" then
    -- Bootsrap mini plugin manager when outside of NIX
    local path_package = vim.fn.stdpath('data') .. '/site/'
    local mini_path = path_package .. 'pack/deps/start/mini.nvim'
    if not vim.loop.fs_stat(mini_path) then
        vim.cmd('echo "Installing `mini.nvim`" | redraw')
        local clone_cmd = {
            'git', 'clone', '--filter=blob:none',
            'https://github.com/nvim-mini/mini.nvim', mini_path
        }
        vim.fn.system(clone_cmd)
        vim.cmd('packadd mini.nvim | helptags ALL')
        vim.cmd('echo "Installed `mini.nvim`" | redraw')
    end

    require('mini.deps').setup({ path = { package = path_package } })

    local lock_file = table.concat(vim.fn.readfile("mini.lock"), "\n")
    local lock_pkgs = vim.fn.json_decode(lock_file)
    for key, pkg in pairs(lock_pkgs) do
        local success, _ = pcall(MiniDeps.add, pkg)
        if success then
            print("Plugin added:", pkg.source)
        else
            print("Failed to add plugin:", pkg.source)
        end
    end
end

-- Allows to continue when loading one module fails
local function try_require(mod)
    local success, result = pcall(require, mod)
    if not success then
        print("Failed to load module: " .. result)
    end
end

try_require("options")
try_require("remaps")
try_require("plugins.colorscheme")
try_require("plugins.cursorword")
try_require("plugins.lspconfig")
try_require("plugins.lspkind")
try_require("plugins.dap")
try_require("plugins.neo-tree")
try_require("plugins.telescope")
try_require("plugins.treesitter")
try_require("plugins.which-key")
try_require("plugins.trouble")
