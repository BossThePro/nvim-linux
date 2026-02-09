vim.g.mapleader = ","
vim.g.maplocalleader = ","

require("config.settings")
require("config.lazy")
require("config.treesitter")
require("config.cmp")
require("config.colorscheme")
require("config.telescope")
require("config.harpoon")
require("config.keybinds")
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     vim.treesitter.start()
--   end,
-- })
