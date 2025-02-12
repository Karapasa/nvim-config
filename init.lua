--Basic config
require("core.options")
require("core.lazy")
require("core.mappings")
require("core.colors")
require("core.plugins_init")

--Plugins config
require("plugins.dashboard")
require("plugins.neotree")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.cmp")
require("plugins.lualine")
require("plugins.whichkey")
require("plugins.codeium")
require("plugins.mason-dap")
require("plugins.dap-ui")
require("plugins.cmp-dap")

--Autocmds
require("core.autocmds")
