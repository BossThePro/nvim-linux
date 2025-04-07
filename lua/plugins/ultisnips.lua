return {"SirVer/ultisnips", 
lazy = false, 
init = function()
vim.g.UltiSnipsExpandOrJumpTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<s-tab>'
vim.g.UltiSnipsSnippetDirectories = {"~/.config/nvim/lua/snippets"}
end
}
