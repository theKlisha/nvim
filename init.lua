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
try_require("plugins.none-ls")
